import 'package:brain_box_ai/core/exception/no_result.dart';
import 'package:brain_box_ai/core/exception/result.dart';
import 'package:brain_box_ai/domain/entities/user_session.dart';
import 'package:brain_box_ai/domain/repositories/user_session_repository.dart';

import '../datasources/local/user_session_datasource.dart';
import '../models/extentions/user_session_mapper.dart';

class UserSessionRepositoryImp extends UserSessionRepository {
  final UserSessionLocalDatasource _mSessionLocalDatasource;

  UserSessionRepositoryImp(this._mSessionLocalDatasource);

  @override
  Future<Result<NoResult>> deleteUserSession() async {
    try {
      await _mSessionLocalDatasource.clearUserSession();
      return Result.success(const NoResult());
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<Result<String?>> getDeviceToken() async {
    // TODO: implement getDeviceToken
    throw UnimplementedError();
  }

  @override
  Future<Result<UserSession>> getUserSession() async {
    try {
      return await _mSessionLocalDatasource
          .getUserSession()
          .then((dto) => UserSessionMapper().fromDTO(dto))
          .then((data) => Result.success(data));
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<Result<NoResult>> setDeviceToken(String deviceToken) async {
    // TODO: implement setDeviceToken
    throw UnimplementedError();
  }

  @override
  Future<Result<NoResult>> setUserSession(UserSession model) async {
    try {
      print('UserSessionRepositoryImp setUserSession: ${model.displayName}');
      return await _mSessionLocalDatasource
          .cacheUserSession(UserSessionMapper().toDTO(model))
          .then((value) => Result.success(const NoResult()));
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }
}
