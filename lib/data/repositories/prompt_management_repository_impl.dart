import "package:brain_box_ai/core/exception/result.dart";
import "package:brain_box_ai/data/datasources/prompt_management_datasource.dart";
import "package:brain_box_ai/data/models/extentions/prompt_mapper.dart";
import "package:brain_box_ai/domain/entities/prompt_entity.dart";
import "package:brain_box_ai/domain/repositories/prompt_management_repository.dart";

class PromptManagementRepositoryImpl implements PromptManagementRepository {
  final PromptManagementDataSource dataSource;

  PromptManagementRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<PromptEntity>>> getListFavoritePrompt() async {
    try {
      final result = await dataSource.getListFavoritePrompt();

      if (result.isSuccess) {
        final promptFavoriteModels = result.data ?? [];
        final promptEntities =
            promptFavoriteModels.map((model) => model.toEntity()).toList();

        return Result.success(promptEntities);
      } else {
        return Result.errors(result.getError()!);
      }
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<Result<List<PromptEntity>>> getListHistoryPrompt() async {
    try {
      final result = await dataSource.getListHistoryPrompt();
      if (result.isSuccess) {
        final promptHistoryModels = result.data ?? [];
        final promptEntities =
            promptHistoryModels.map((model) => model.toEntity()).toList();

        return Result.success(promptEntities);
      } else {
        return Result.errors(result.getError()!);
      }
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<Result<List<PromptEntity>>> getListSavedPrompt() async {
    try {
      final result = await dataSource.getListSavedPrompt();

      if (result.isSuccess) {
        final promptSavedModels = result.data ?? [];
        final promptEntities =
            promptSavedModels.map((model) => model.toEntity()).toList();

        return Result.success(promptEntities);
      } else {
        return Result.errors(result.getError()!);
      }
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }
}
