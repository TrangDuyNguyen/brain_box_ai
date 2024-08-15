import '../../../domain/entities/setting/app_setting.dart';
import '../../../domain/entities/setting/country.dart';
import '../../../domain/entities/setting/currency.dart';
import '../../../domain/entities/setting/language.dart';
import '../country_model.dart';
import '../currency_model.dart';
import '../language_model.dart';
import '../setting_model.dart';
import 'user_session_mapper.dart';

class AppSettingMapper extends MapperModel<SettingModel, AppSetting> {
  AppSettingMapper._();
  static final AppSettingMapper _instance = AppSettingMapper._();
  factory AppSettingMapper() => _instance;

  @override
  AppSetting fromDTO(SettingModel dto) {
    return AppSetting(
      languageCode: dto.languageCode,
      currencyCode: dto.currencyCode,
      countryCode: dto.countryCode,
      theme: dto.theme,
      notificationEnabled: dto.notificationEnabled,
      isInstalled: dto.isInstalled,
      supportCurrencies: dto.supportCurrencies
          .map((currencyModel) => Currency.fromJson(currencyModel.toJson()))
          .toList(),
      supportLanguages: dto.supportLanguages
          .map((languageModel) => Language.fromJson(languageModel.toJson()))
          .toList(),
      supportCountries: dto.supportCountries
          .map((countryModel) => Country.fromJson(countryModel.toJson()))
          .toList(),
    );
  }

  @override
  SettingModel toDTO(AppSetting model) {
    return SettingModel(
      languageCode: model.languageCode,
      currencyCode: model.currencyCode,
      countryCode: model.countryCode,
      theme: model.theme,
      notificationEnabled: model.notificationEnabled,
      isInstalled: model.isInstalled,
      supportCurrencies: model.supportCurrencies
          .map((currency) => CurrencyModel.fromJson(currency.toJson()))
          .toList(),
      supportLanguages: model.supportLanguages
          .map((language) => LanguageModel.fromJson(language.toJson()))
          .toList(),
      supportCountries: model.supportCountries
          .map((country) => CountryModel.fromJson(country.toJson()))
          .toList(),
    );
  }
}
