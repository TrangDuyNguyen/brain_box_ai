import 'package:brain_box_ai/data/datasources/remote/dummy_data.dart';

import '../../core/exception/result.dart';
import '../models/prompt_top_model.dart';

abstract class HomeDataSource {
  Future<Result<List<PromptTopModel>>> getListTopPrompt();
}

class HomeDataSourceImpl implements HomeDataSource {
  @override
  Future<Result<List<PromptTopModel>>> getListTopPrompt() async {
    // TODO: implement getListTopPrompt
    try {
      final promptTopModels = jsonPromptList
          .map((json) => PromptTopModel.fromJson(json))
          .toList();
      return Result.success(promptTopModels);
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }
  // TODO: implement your HomeDataSourceImpl
}
