import 'package:brain_box_ai/data/datasources/dummy_data/dummy_data.dart';
import 'package:brain_box_ai/data/models/category_model.dart';

import '../../core/exception/result.dart';
import '../models/prompt_top_model.dart';

abstract class HomeDataSource {
  Future<Result<List<PromptTopModel>>> getListTopPrompt();
  Future<Result<List<CategoryModel>>> getListCategory();
}

class HomeDataSourceImpl implements HomeDataSource {
  @override
  Future<Result<List<PromptTopModel>>> getListTopPrompt() async {
    // TODO: implement getListTopPrompt
    try {
      final promptTopModels =
          jsonPromptList.map((json) => PromptTopModel.fromJson(json)).toList();
      return Result.success(promptTopModels);
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<Result<List<CategoryModel>>> getListCategory() async {
    try {
      final categories =
          listCategoryJson.map((json) => CategoryModel.fromJson(json)).toList();
      print("categories: ${categories.length}");
      return Result.success(categories);
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }
}
