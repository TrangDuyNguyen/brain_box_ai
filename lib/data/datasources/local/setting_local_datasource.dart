import '../../../core/exception/app_exception.dart';
import '../../db/hive/operation/app_setting_operation.dart';
import '../../db/secure/secure_database_manager.dart';
import '../../models/setting_model.dart';

abstract class SettingLocalDataSource {
  Future<SettingModel> getSetting();
  Future<void> setSetting(SettingModel setting);
  Future<void> updateSetting(SettingModel setting);
}

class SettingLocalDataSourceImp extends SettingLocalDataSource {
  final SystemSettingOperator _settingOperator;

  SettingLocalDataSourceImp()
      : _settingOperator = SystemSettingOperator(
          primitiveDatabase: SecureDatabaseManager(),
        );

  @override
  Future<SettingModel> getSetting() async {
    await _settingOperator.start();
    final setting = _settingOperator.getItem(SettingModel.modelKey);
    if (setting == null) {
      throw CacheException(message: "UserSessionModel not found");
    }
    return setting;
  }

  @override
  Future<void> setSetting(SettingModel setting) async {
    await _settingOperator.addOrUpdateItem(setting);
  }

  @override
  Future<void> updateSetting(SettingModel setting) {
    return _settingOperator.addOrUpdateItem(setting);
  }
}
