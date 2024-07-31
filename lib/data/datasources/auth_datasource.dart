import 'package:brain_box_ai/core/exception/result.dart';

abstract class AuthDataSource {
  // TODO: implement your AuthDataSource
  Future<Result> authenticate(String email, String password);
  Future<Result> register(String email, String username, String password);
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
  // TODO: implement your AuthDataSourceImpl
}
