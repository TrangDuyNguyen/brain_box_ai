import '../../domain/entities/setting/app_setting.dart';
import '../../domain/entities/setting/country.dart';
import '../../domain/entities/setting/currency.dart';
import '../../domain/entities/setting/language.dart';
import '../../domain/repositories/setting_repository.dart';
import '../datasources/local/setting_local_datasource.dart';
import '../models/extentions/setting_mapper.dart';

class SettingRepositoryImp extends SettingsRepository {
  final SettingLocalDataSource mSettingLocalDataSource;

  SettingRepositoryImp(this.mSettingLocalDataSource);

  @override
  Future<AppSetting> getAppSettings() async {
    try {
      final model = await mSettingLocalDataSource.getSetting();
      return Future.value(AppSettingMapper().fromDTO(model));
    } on Exception {
      return AppSetting.defaultSettings();
    }
  }

  @override
  Future<void> installed(bool value) async {
    try {
      final appSetting = await getAppSettings();
      await mSettingLocalDataSource.updateSetting(
          AppSettingMapper().toDTO(appSetting.copyWith(isInstalled: value)));
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> toggleNotification(bool isEnabled) async {
    try {
      final appSetting = await getAppSettings();
      await mSettingLocalDataSource.updateSetting(AppSettingMapper()
          .toDTO(appSetting.copyWith(notificationEnabled: isEnabled)));
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> updateCountryCd(String countryCd) async {
    try {
      final appSetting = await getAppSettings();
      await mSettingLocalDataSource.updateSetting(AppSettingMapper()
          .toDTO(appSetting.copyWith(countryCode: countryCd)));
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> updateCurrencyCd(String currencyCd) async {
    try {
      final appSetting = await getAppSettings();
      await mSettingLocalDataSource.updateSetting(AppSettingMapper()
          .toDTO(appSetting.copyWith(currencyCode: currencyCd)));
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> updateLanguageCd(String languageCd) async {
    try {
      final appSetting = await getAppSettings();
      await mSettingLocalDataSource.updateSetting(AppSettingMapper()
          .toDTO(appSetting.copyWith(languageCode: languageCd)));
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> updateSupportCountries(List<Country> countries) async {
    try {
      final appSetting = await getAppSettings();
      await mSettingLocalDataSource.updateSetting(AppSettingMapper()
          .toDTO(appSetting.copyWith(supportCountries: countries)));
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> updateSupportCurrencies(List<Currency> currencies) async {
    try {
      final appSetting = await getAppSettings();
      await mSettingLocalDataSource.updateSetting(AppSettingMapper()
          .toDTO(appSetting.copyWith(supportCurrencies: currencies)));
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> updateSupportLanguages(List<Language> languages) async {
    try {
      final appSetting = await getAppSettings();
      await mSettingLocalDataSource.updateSetting(AppSettingMapper()
          .toDTO(appSetting.copyWith(supportLanguages: languages)));
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> updateThemeMode(String theme) async {
    try {
      final appSetting = await getAppSettings();
      await mSettingLocalDataSource.updateSetting(
          AppSettingMapper().toDTO(appSetting.copyWith(theme: theme)));
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> updateThemeColor(int id) async {
    try {
      final appSetting = await getAppSettings();
      await mSettingLocalDataSource.updateSetting(AppSettingMapper()
          .toDTO(appSetting.copyWith(selectedThemeColorId: id)));
    } catch (e) {
      return Future.error(e);
    }
  }
}
