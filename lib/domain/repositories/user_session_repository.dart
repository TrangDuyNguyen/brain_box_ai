import '../../core/exception/no_result.dart';
import '../../core/exception/result.dart';
import '../entities/user_session.dart';

abstract class UserSessionRepository {
  Future<Result<UserSession>> getUserSession();
  Future<Result<NoResult>> setUserSession(UserSession model);
  Future<Result<NoResult>> deleteUserSession();
  Future<Result<String?>> getDeviceToken();
  Future<Result<NoResult>> setDeviceToken(String deviceToken);
}
