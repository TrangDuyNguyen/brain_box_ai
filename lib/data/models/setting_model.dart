import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../db/hive/core/hive_model.dart';
import '../db/hive/core/hive_types.dart';
import 'country_model.dart';
import 'currency_model.dart';
import 'language_model.dart';

part 'gen/setting_model.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypes.systemSettingId)
class SettingModel extends HiveObject with HiveModelMixin {
  static const String modelKey = 'user_settings';

  @override
  String get key => modelKey;

  @HiveField(0)
  final String languageCode;
  @HiveField(1)
  final String currencyCode;
  @HiveField(2)
  final String countryCode;
  @HiveField(3)
  final String theme;
  @HiveField(4)
  final bool notificationEnabled;
  @HiveField(5)
  final bool isInstalled;
  @HiveField(6)
  final List<CurrencyModel> supportCurrencies;
  @HiveField(7)
  final List<LanguageModel> supportLanguages;
  @HiveField(8)
  final List<CountryModel> supportCountries; // new field
  @HiveField(9)
  final int selectedThemeColorId;

  SettingModel({
    required this.languageCode,
    required this.currencyCode,
    required this.countryCode,
    required this.theme,
    required this.notificationEnabled,
    required this.isInstalled,
    required this.supportCurrencies,
    required this.supportLanguages,
    required this.supportCountries,
    required this.selectedThemeColorId, // new field
  });

  SettingModel copyWith({
    String? languageCode,
    String? currencyCode,
    String? countryCode,
    String? theme,
    bool? notificationEnabled,
    bool? isInstalled,
    List<CurrencyModel>? supportCurrencies,
    List<LanguageModel>? supportLanguages,
    List<CountryModel>? supportCountries,
    int? selectedThemeColorId, // new field
  }) {
    return SettingModel(
      languageCode: languageCode ?? this.languageCode,
      currencyCode: currencyCode ?? this.currencyCode,
      countryCode: countryCode ?? this.countryCode,
      theme: theme ?? this.theme,
      notificationEnabled: notificationEnabled ?? this.notificationEnabled,
      isInstalled: isInstalled ?? this.isInstalled,
      supportCurrencies: supportCurrencies ?? this.supportCurrencies,
      supportLanguages: supportLanguages ?? this.supportLanguages,
      supportCountries: supportCountries ?? this.supportCountries,
      selectedThemeColorId:
          selectedThemeColorId ?? this.selectedThemeColorId, // new field
    );
  }

  static SettingModel fromJson(Map<String, dynamic> json) {
    return SettingModel(
        languageCode: json['languageCode'] as String,
        currencyCode: json['currencyCode'] as String,
        countryCode: json['countryCode'] as String,
        theme: json['theme'] as String,
        notificationEnabled: json['notificationEnabled'] as bool,
        isInstalled: json['isInstalled'] as bool,
        supportCurrencies: (json['supportCurrencies'] as List)
            .map((e) => CurrencyModel.fromJson(e))
            .toList(),
        supportLanguages: (json['supportLanguages'] as List)
            .map((e) => LanguageModel.fromJson(e))
            .toList(),
        supportCountries: (json['supportCountries'] as List)
            .map((e) => CountryModel.fromJson(e))
            .toList(), // new field
        selectedThemeColorId: json['selectedThemeColorId'] as int);
  }

  Map<String, dynamic> toJson() {
    return {
      'languageCode': languageCode,
      'currencyCode': currencyCode,
      'countryCode': countryCode,
      'theme': theme,
      'notificationEnabled': notificationEnabled,
      'isInstalled': isInstalled,
      'supportCurrencies': supportCurrencies.map((e) => e.toJson()).toList(),
      'supportLanguages': supportLanguages.map((e) => e.toJson()).toList(),
      'supportCountries': supportCountries.map((e) => e.toJson()).toList(),
      'selectedThemeColorId': selectedThemeColorId,
      // new field
    };
  }
}
