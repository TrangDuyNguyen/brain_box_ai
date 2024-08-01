import 'package:brain_box_ai/core/exception/result.dart';

abstract class AuthDataSource {
  // TODO: implement your AuthDataSource
  Future<Result> authenticate(String email, String password);
  Future<Result> register(String email, String username, String password);
  Future<Result> sendVerify(String email);
  Future<Result> verify(String code);
  Future<Result> forgot(String newPassword);
}

class AuthDataSourceImpl implements AuthDataSource {
  // client...

  @override
  Future<Result> authenticate(String email, String password) {
    // TODO: implement authenticate

    // post
    throw UnimplementedError();
  }

  @override
  Future<Result> register(String email, String username, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Result> forgot(String newPassword) {
    // TODO: implement forgot
    throw UnimplementedError();
  }

  @override
  Future<Result> sendVerify(String email) {
    // TODO: implement sendVerify
    throw UnimplementedError();
  }

  @override
  Future<Result> verify(String code) {
    // TODO: implement verify
    throw UnimplementedError();
  }
  // TODO: implement your AuthDataSourceImpl
}
