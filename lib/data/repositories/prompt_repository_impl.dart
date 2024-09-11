import 'package:brain_box_ai/core/exception/result.dart';
import 'package:brain_box_ai/data/datasources/prompt_datasource.dart';
import 'package:brain_box_ai/data/models/extentions/prompt_mapper.dart';
import 'package:brain_box_ai/domain/entities/prompt_entity.dart';
import 'package:brain_box_ai/domain/repositories/prompt_repository.dart';

class PromptRepositoryImpl implements PromptRepository {
  final PromptDatasource dataSource;

  PromptRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<PromptEntity>>> getPromptAll() async {
    try {
      final result = await dataSource.listPromptAll();

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
}