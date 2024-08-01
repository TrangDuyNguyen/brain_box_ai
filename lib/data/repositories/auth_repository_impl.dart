import "package:brain_box_ai/core/exception/no_result.dart";
import "package:brain_box_ai/core/exception/result.dart";
import "package:brain_box_ai/domain/repositories/auth_repository.dart";

import "../datasources/auth_datasource.dart";

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<Result> authenticate(
      {required String email, required String password}) async {
    // TODO: implement authenticate
    try {
      final response = await dataSource.authenticate(email, password);
      // Xử lý response và trả về kết quả
      return Result.success(NoResult); // Giả sử xác thực thành công
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<Result> register(
      {required String email,
      required username,
      required String password}) async {
    // TODO: implement register
    try {
      final response = await dataSource.register(email, username, password);
      // Xử lý response và trả về kết quả
      return Result.success(NoResult); // Giả sử xác thực thành công
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<Result> forgotPassword({required String password}) async {
    // TODO: implement forgotPassword
    try {
      final response = await dataSource.forgot(password);
      // Xử lý response và trả về kết quả
      return Result.success(NoResult); // Giả sử xác thực thành công
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<Result> verify({required String code}) async {
    // TODO: implement verify
    try {
      final response = await dataSource.verify(code);
      // Xử lý response và trả về kết quả
      return Result.success(NoResult); // Giả sử xác thực thành công
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<Result> sendVerify({required String email}) async {
    // TODO: implement sendVerify
    try {
      final response = await dataSource.sendVerify(email);
      // Xử lý response và trả về kết quả
      return Result.success(NoResult); // Giả sử xác thực thành công
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }
}
