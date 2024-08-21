import 'package:brain_box_ai/core/exception/result.dart';

import 'package:brain_box_ai/core/usecases/usecase.dart';

import '../repositories/auth_repository.dart';
import '../repositories/user_session_repository.dart';

class AuthUseCase implements UseCase<void, AuthParams> {
  // TODO: implement the output of your AuthUseCase
  final AuthRepository repository;

  AuthUseCase(this.repository);

  @override
  Future<Result> call(Object params) {
    // TODO: implement call
    throw UnimplementedError();
  }

  Future<Result> login(AuthParams params) async {
    // TODO: implement call
    return await repository.authenticate(
      email: params.email ?? '',
      password: params.password ?? '',
    );
  }

  Future<Result> createAccount(AuthParams params) async {
    // TODO: implement createAccount
    return await repository.register(
      email: params.email ?? '',
      username: params.username ?? '',
      password: params.password ?? '',
    );
  }

  Future<Result> verifyAccount(String code) async {
    // TODO: implement createAccount
    return await repository.verify(
      code: code,
    );
  }

  Future<Result> sendVerify(String email) async {
    // TODO: implement createAccount
    return await repository.sendVerify(
      email: email,
    );
  }

  Future<Result> forgotAccount(AuthParams params) async {
    // TODO: implement createAccount
    return await repository.forgotPassword(
      password: params.password ?? "",
    );
  }
}

class AuthParams {
  final String? email;
  final String? username;
  final String? password;

  AuthParams({this.email, this.username, this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'password': password,
    };
  }

  factory AuthParams.fromJson(Map<String, dynamic> json) {
    return AuthParams(
      email: json['email'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
    );
  }
}
