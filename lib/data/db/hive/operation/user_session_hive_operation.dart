import '../../../models/user_session_model.dart';
import '../core/hive_operation.dart';

/// The class `UserHiveOperation` is a subclass of `HiveDatabaseOperation` specifically designed for performing operations
/// on `User` objects in a Hive database.
class UserSessionHiveOperation extends HiveDatabaseOperation<UserSessionModel> {
  UserSessionHiveOperation({required super.primitiveDatabase});
}
