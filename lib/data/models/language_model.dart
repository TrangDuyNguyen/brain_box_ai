import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../db/hive/core/hive_model.dart';
import '../db/hive/core/hive_types.dart';

part 'gen/language_model.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypes.languageId)
class LanguageModel extends HiveObject with HiveModelMixin {
  static const String languageKey = 'language';

  @override
  String get key => languageKey;

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String languageCode;

  LanguageModel(
      {required this.id, required this.name, required this.languageCode});

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      id: json['id'],
      name: json['name'],
      languageCode: json['languageCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'languageCode': languageCode,
    };
  }
}
