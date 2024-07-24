import 'package:brain_box_ai/core/exception/result.dart';

abstract class AuthDataSource {
  // TODO: implement your AuthDataSource
  Future<Result> authenticate(String email, String password);
}

class AuthDataSourceImpl implements AuthDataSource {
  // client...

  @override
  Future<Result> authenticate(String email, String password) {
    // TODO: implement authenticate

    // post/get
    throw UnimplementedError();
  }
  // TODO: implement your AuthDataSourceImpl
}
