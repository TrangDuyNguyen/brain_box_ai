import 'package:brain_box_ai/domain/repositories/setting_repository.dart';

import '../../core/exception/result.dart';
import '../../core/usecases/usecase.dart';
import '../entities/setting/app_setting.dart';

class SettingUserCase implements UseCase<void, SettingParams> {
  // TODO: implement the output of your HomeUseCase
  final SettingsRepository repository;

  SettingUserCase(this.repository);
  @override
  Future<Result> call(SettingParams params) {
    throw UnimplementedError();
  }

  Future<AppSetting> getAppSetting() async {
    return repository.getAppSettings();
  }

  Future<void> installed(bool value) {
    return repository.installed(value);
  }

  Future<void> toggleNotification(bool isEnabled) {
    return repository.toggleNotification(isEnabled);
  }

  Future<void> updateLanguage(String languageCode) {
    return repository.updateLanguageCd(languageCode);
  }

  Future<void> updateCountry(String countryCd) {
    return repository.updateCountryCd(countryCd);
  }

  Future<void> updateTheme(String theme) {
    return repository.updateTheme(theme);
  }
}

class SettingParams {
  // TODO: implement your HomeParams
  const SettingParams();
}
