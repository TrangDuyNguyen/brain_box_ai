import 'package:brain_box_ai/data/datasources/remote/dummy_data.dart';

import '../../core/exception/result.dart';
import '../models/prompt_favorite_model.dart';
import '../models/prompt_history_model.dart';
import '../models/prompt_saved_model.dart';

abstract class PromptManagementDataSource {
  // TODO: implement your PromptManagementDataSource
  Future<Result<List<PromptHistoryModel>>> getListHistoryPrompt();
  Future<Result<List<PromptFavoriteModel>>> getListFavoritePrompt();
  Future<Result<List<PromptSavedModel>>> getListSavedPrompt();
}

class PromptManagementDataSourceImpl implements PromptManagementDataSource {
  @override
  Future<Result<List<PromptHistoryModel>>> getListHistoryPrompt() async {
    // TODO: implement getListHistoryPrompt
    try {
      final promptHistoryModels = jsonPromptList
          .map((json) => PromptHistoryModel.fromJson(json))
          .toList();
      return Result.success(promptHistoryModels);
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<Result<List<PromptSavedModel>>> getListSavedPrompt() async {
    try {
      final promptSavedModels = jsonPromptList
          .map((json) => PromptSavedModel.fromJson(json))
          .toList();
      return Result.success(promptSavedModels);
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<Result<List<PromptFavoriteModel>>> getListFavoritePrompt() async {
    try {
      final promptFavoriteModels = jsonPromptList
          .map((json) => PromptFavoriteModel.fromJson(json))
          .toList();
      return Result.success(promptFavoriteModels);
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }
  // TODO: implement your PromptManagementDataSourceImpl
}
