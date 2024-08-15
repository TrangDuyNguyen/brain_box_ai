import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../db/hive/core/hive_model.dart';
import '../db/hive/core/hive_types.dart';

part 'gen/country_model.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypes.countryId)
class CountryModel extends HiveObject with HiveModelMixin {
  static const String countryKey = 'country';

  @override
  String get key => countryKey;

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String alpha2;
  @HiveField(3)
  final String alpha3;
  @HiveField(4)
  final String dialCode;

  CountryModel(
      {required this.id,
      required this.name,
      required this.alpha2,
      required this.alpha3,
      required this.dialCode});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      name: json['name'],
      alpha2: json['alpha2'],
      alpha3: json['alpha3'],
      dialCode: json['dialCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'alpha2': alpha2,
      'alpha3': alpha3,
      'dialCode': dialCode,
    };
  }
}
