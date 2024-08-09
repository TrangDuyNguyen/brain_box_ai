import "package:brain_box_ai/core/exception/result.dart";
import "package:brain_box_ai/domain/repositories/home_repository.dart";

import "../datasources/home_datasource.dart";

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);
  @override
  Future<Result> getListTopPrompt() async {
    try {
      final response = await dataSource.getListTopPrompt();
      // Xử lý response và trả về kết quả
      return Result.success(response);
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }
  // TODO: implement your HomeRepositoryImpl
}
