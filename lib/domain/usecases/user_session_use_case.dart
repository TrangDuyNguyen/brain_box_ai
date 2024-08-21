import 'package:brain_box_ai/core/exception/no_result.dart';
import 'package:brain_box_ai/core/exception/result.dart';

import '../../core/usecases/usecase.dart';
import '../entities/user_session.dart';
import '../repositories/user_session_repository.dart';

class UserSessionUseCase implements UseCase<void, UserSessionParam> {
  final UserSessionRepository repository;
  UserSessionUseCase(this.repository);

  @override
  Future<Result> call(UserSessionParam params) {
    // TODO: implement call
    throw UnimplementedError();
  }

  Future<Result> getUserSession() {
    return repository.getUserSession();
  }

  Future<Result<NoResult>> setUserSession(UserSession param) {
    return repository.setUserSession(param);
  }

  Future<Result> deleteUserSession() {
    return repository.deleteUserSession();
  }

  Future<Result> getDeviceToken() {
    return repository.getDeviceToken();
  }

  Future<Result> setDeviceToken(String deviceToken) {
    return repository.setDeviceToken(deviceToken);
  }
}

class UserSessionParam {
  const UserSessionParam();
}
