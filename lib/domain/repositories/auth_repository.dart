import 'package:brain_box_ai/core/exception/result.dart';

abstract class AuthRepository {
  // TODO: implement your AuthRepository
  Future<Result> authenticate(
      {required String email, required String password});

  Future<Result> register(
      {required String email, required username, required String password});

  Future<Result> sendVerify({required String email});

  Future<Result> verify({required String code});

  Future<Result> forgotPassword({required String password});
}
