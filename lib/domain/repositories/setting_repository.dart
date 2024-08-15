import '../entities/setting/app_setting.dart';
import '../entities/setting/country.dart';
import '../entities/setting/currency.dart';
import '../entities/setting/language.dart';

abstract class SettingsRepository {
  Future<AppSetting> getAppSettings();
  Future<void> updateLanguageCd(String languageCd);
  Future<void> updateCurrencyCd(String currencyCd);
  Future<void> updateCountryCd(String countryCd);
  Future<void> updateTheme(String theme);
  Future<void> toggleNotification(bool isEnabled);
  Future<void> installed(bool value);
  Future<void> updateSupportCurrencies(List<Currency> currencies);
  Future<void> updateSupportLanguages(List<Language> languages);
  Future<void> updateSupportCountries(List<Country> countries);
}
