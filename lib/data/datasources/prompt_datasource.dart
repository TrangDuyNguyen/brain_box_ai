import '../../core/exception/result.dart';
import '../models/prompt_model.dart';
import 'dummy_data/dummy_data.dart';

abstract class PromptDatasource {
  Future<Result<List<PromptModel>>> listPromptAll();
}

class PromptDatasourceImpl extends PromptDatasource {
  @override
  Future<Result<List<PromptModel>>> listPromptAll() async {
    try {
      final promptModels =
          jsonPromptList.map((json) => PromptModel.fromJson(json)).toList();
      return Result.success(promptModels);
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }
}
