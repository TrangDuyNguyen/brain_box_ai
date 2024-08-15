import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../db/hive/core/hive_model.dart';
import '../db/hive/core/hive_types.dart';
part 'gen/currency_model.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypes.currencyId)
class CurrencyModel extends HiveObject with HiveModelMixin {
  static const String currencyKey = 'currency';

  @override
  String get key => currencyKey;

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String currencyCode;

  CurrencyModel(
      {required this.id, required this.name, required this.currencyCode});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      id: json['id'],
      name: json['name'],
      currencyCode: json['currencyCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'currencyCode': currencyCode,
    };
  }
}
