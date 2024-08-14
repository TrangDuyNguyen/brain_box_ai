import '../../../core/exception/app_exception.dart';
import '../../db/hive/operation/user_session_hive_operation.dart';
import '../../db/secure/secure_database_manager.dart';
import '../../models/user_session_model.dart';

abstract class UserSessionLocalDatasource {
  Future<UserSessionModel> getUserSession();
  Future<void> cacheUserSession(UserSessionModel model);
  Future<void> clearUserSession();
}

class UserSessionLocalDatasourceImp extends UserSessionLocalDatasource {
  final UserSessionHiveOperation _hiveOperation;

  UserSessionLocalDatasourceImp()
      : _hiveOperation = UserSessionHiveOperation(
            primitiveDatabase: SecureDatabaseManager());

  @override
  Future<void> cacheUserSession(UserSessionModel model) async {
    _hiveOperation.addOrUpdateItem(model);
  }

  @override
  Future<void> clearUserSession() async {
    _hiveOperation.deleteItem(UserSessionModel.modelKey);
  }

  @override
  Future<UserSessionModel> getUserSession() async {
    await _hiveOperation.start();
    final session = _hiveOperation.getItem(UserSessionModel.modelKey);
    if (session == null) {
      throw CacheException(message: "UserSessionModel not found");
    }
    return session;
  }
}
