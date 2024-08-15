import 'currency.dart';
import 'language.dart';
import 'country.dart';

class AppSetting {
  final String languageCode;
  final String currencyCode;
  final String countryCode;
  final String theme;
  final bool notificationEnabled;
  final bool isInstalled;
  final List<Currency> supportCurrencies;
  final List<Language> supportLanguages;
  final List<Country> supportCountries; // new field

  AppSetting({
    required this.languageCode,
    required this.currencyCode,
    required this.countryCode,
    required this.theme,
    required this.notificationEnabled,
    required this.isInstalled,
    required this.supportCurrencies,
    required this.supportLanguages,
    required this.supportCountries, // new field
  });

  AppSetting copyWith({
    String? languageCode,
    String? currencyCode,
    String? countryCode,
    String? theme,
    bool? notificationEnabled,
    bool? isInstalled,
    List<Currency>? supportCurrencies,
    List<Language>? supportLanguages,
    List<Country>? supportCountries, // new field
  }) {
    return AppSetting(
      languageCode: languageCode ?? this.languageCode,
      currencyCode: currencyCode ?? this.currencyCode,
      countryCode: countryCode ?? this.countryCode,
      theme: theme ?? this.theme,
      notificationEnabled: notificationEnabled ?? this.notificationEnabled,
      isInstalled: isInstalled ?? this.isInstalled,
      supportCurrencies: supportCurrencies ?? this.supportCurrencies,
      supportLanguages: supportLanguages ?? this.supportLanguages,
      supportCountries: supportCountries ?? this.supportCountries, // new field
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'languageCode': languageCode,
      'currencyCode': currencyCode,
      'theme': theme,
      'notificationEnabled': notificationEnabled,
      'isInstalled': isInstalled,
      'countryCode': countryCode,
      'supportCurrencies': supportCurrencies.map((e) => e.toJson()).toList(),
      'supportLanguages': supportLanguages.map((e) => e.toJson()).toList(),
      'supportCountries':
          supportCountries.map((e) => e.toJson()).toList(), // new field
    };
  }

  factory AppSetting.fromMap(Map<String, dynamic> map) {
    return AppSetting(
      languageCode: map['languageCode'] as String,
      currencyCode: map['currencyCode'] as String,
      countryCode: map['countryCode'] as String,
      theme: map['theme'] as String,
      notificationEnabled: map['notificationEnabled'] as bool,
      isInstalled: map['isInstalled'] as bool,
      supportCurrencies: (map['supportCurrencies'] as List)
          .map((e) => Currency.fromJson(e))
          .toList(),
      supportLanguages: (map['supportLanguages'] as List)
          .map((e) => Language.fromJson(e))
          .toList(),
      supportCountries: (map['supportCountries'] as List)
          .map((e) => Country.fromJson(e))
          .toList(), // new field
    );
  }

  static defaultSettings({
    String languageCode = 'en',
    String currencyCode = 'USD',
    String countryCode = 'US',
    String theme = 'light',
    bool notificationEnabled = true,
    bool isInstalled = false,
    List<Currency> supportCurrencies = const [],
    List<Language> supportLanguages = const [],
    List<Country> supportCountries = const [], // new field
  }) {
    return AppSetting(
      languageCode: 'en',
      currencyCode: 'USD',
      countryCode: 'US',
      theme: 'light',
      notificationEnabled: true,
      isInstalled: false,
      supportCurrencies: [],
      supportLanguages: [],
      supportCountries: [], // new field
    );
  }
}
