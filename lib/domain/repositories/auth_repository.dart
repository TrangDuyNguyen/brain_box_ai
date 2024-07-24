import 'package:brain_box_ai/core/exception/result.dart';

abstract class AuthRepository {
  // TODO: implement your AuthRepository
  Future<Result> authenticate(
      {required String email, required String password});
}
