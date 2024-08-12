import 'package:brain_box_ai/data/datasources/remote/dummy_data.dart';

import '../../core/exception/result.dart';
import '../models/prompt_history_model.dart';

abstract class PromptManagementDataSource {
  // TODO: implement your PromptManagementDataSource
  Future<Result<List<PromptHistoryModel>>> getListHistoryPrompt();
  Future<Result> getListFavoritePrompt();
  Future<Result> getListSavedPrompt();
}

class PromptManagementDataSourceImpl implements PromptManagementDataSource {
  @override
  Future<Result> getListFavoritePrompt() {
    // TODO: implement getListFavoritePrompt
    throw UnimplementedError();
  }

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
  Future<Result> getListSavedPrompt() {
    // TODO: implement getListSavedPrompt
    throw UnimplementedError();
  }
  // TODO: implement your PromptManagementDataSourceImpl
}
