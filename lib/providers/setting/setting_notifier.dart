import 'package:brain_box_ai/domain/entities/setting/app_setting.dart';
import 'package:brain_box_ai/domain/usecases/setting_user_case.dart';
import 'package:brain_box_ai/providers/setting/setting_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/environments/app_config.dart';

class SettingNotifier extends StateNotifier<AppSetting> {
  final SettingUserCase useCase;

  SettingNotifier(this.useCase)
      : super(AppSetting.defaultSettings(
          languageCode: AppConfig.instance.defaultLanguageCode,
          currencyCode: AppConfig.instance.defaultCurrencyCode,
          countryCode: AppConfig.instance.defaultCountryCode,
          theme: AppConfig.instance.defaultThemeMode,
          selectedThemeColorId: AppConfig.instance.defaultThemeColor,
        ));

  /// Method to handle async initialization after the constructor
  Future<void> init() async {
    final setting = await useCase.getAppSetting();

    // Update AppConfig with the retrieved settings
    AppConfig.instance.defaultLanguageCode = setting.languageCode;
    AppConfig.instance.defaultCurrencyCode = setting.currencyCode;
    AppConfig.instance.defaultThemeMode = setting.theme;
    AppConfig.instance.isEnableNotification = setting.notificationEnabled;
    AppConfig.instance.defaultThemeColor = setting.selectedThemeColorId;

    // Update the state with the fetched setting
    state = state.copyWith(
      languageCode: setting.languageCode,
      currencyCode: setting.currencyCode,
      theme: setting.theme,
      notificationEnabled: setting.notificationEnabled,
      selectedThemeColorId: setting.selectedThemeColorId,
    );
  }

  // State update methods
  void setLanguage(String code) {
    useCase.updateLanguage(code);
    state = state.copyWith(languageCode: code);
  }

  void setCountry(String code) {
    useCase.updateCountry(code);
    state = state.copyWith(countryCode: code);
  }

  void setUpdateTheme(String theme) {
    useCase.updateThemeMode(theme);
    state = state.copyWith(theme: theme);
  }

  void toggleNotification(bool isEnable) {
    useCase.toggleNotification(isEnable);
    state = state.copyWith(notificationEnabled: isEnable);
  }

  void setUpdateThemeColor(int id) {
    useCase.updateThemeColor(id);
    state = state.copyWith(selectedThemeColorId: id);
  }
}

final settingNotifierProvider =
    StateNotifierProvider<SettingNotifier, AppSetting>((ref) {
  final useCase = ref.read(settingUseCaseProvider);
  final notifier = SettingNotifier(useCase);

  // Call the async initialization method
  notifier.init();

  return notifier;
});
