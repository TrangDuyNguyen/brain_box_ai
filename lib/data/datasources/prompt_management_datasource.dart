import 'package:brain_box_ai/data/datasources/dummy_data/dummy_data.dart';
import 'package:brain_box_ai/data/models/prompt_model.dart';

import '../../core/exception/result.dart';

abstract class PromptManagementDataSource {
  // TODO: implement your PromptManagementDataSource
  Future<Result<List<PromptModel>>> getListHistoryPrompt();
  Future<Result<List<PromptModel>>> getListFavoritePrompt();
  Future<Result<List<PromptModel>>> getListSavedPrompt();
}

class PromptManagementDataSourceImpl implements PromptManagementDataSource {
  @override
  Future<Result<List<PromptModel>>> getListHistoryPrompt() async {
    // TODO: implement getListHistoryPrompt
    try {
      final promptHistoryModels = jsonPromptList
          .map((json) => PromptModel.fromJson(json))
          .toList();
      return Result.success(promptHistoryModels);
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<Result<List<PromptModel>>> getListSavedPrompt() async {
    try {
      final promptSavedModels = jsonPromptList
          .map((json) => PromptModel.fromJson(json))
          .toList();
      return Result.success(promptSavedModels);
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<Result<List<PromptModel>>> getListFavoritePrompt() async {
    try {
      final promptFavoriteModels = jsonPromptList
          .map((json) => PromptModel.fromJson(json))
          .toList();
      return Result.success(promptFavoriteModels);
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }
  // TODO: implement your PromptManagementDataSourceImpl
}
