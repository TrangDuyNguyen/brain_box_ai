import "package:brain_box_ai/core/exception/result.dart";
import "package:brain_box_ai/data/models/extentions/prompt_mapper.dart";
import "package:brain_box_ai/domain/repositories/home_repository.dart";

import "../../domain/entities/prompt_entity.dart";
import "../datasources/home_datasource.dart";

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);
  @override
  Future<Result<List<PromptEntity>>> getListTopPrompt() async {
    try {
      final result = await dataSource.getListTopPrompt();

      if (result.isSuccess) {
        final promptTopModels = result.data ?? [];
        final promptEntities =
            promptTopModels.map((model) => model.toEntity()).toList();

        return Result.success(promptEntities);
      } else {
        return Result.errors(result.getError()!);
      }
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }
  // TODO: implement your HomeRepositoryImpl
}
