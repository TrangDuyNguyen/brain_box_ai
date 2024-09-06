import 'package:brain_box_ai/data/models/prompt_search_result_model.dart';
import 'package:brain_box_ai/data/models/search_model.dart';
import 'package:brain_box_ai/domain/entities/search/filter_search_entity.dart';

import '../../core/exception/result.dart';
import 'dummy_data/dummy_data.dart';

abstract class SearchDatasource {
  Future<Result<List<SearchModel>>> getSearchHistory();
  Future<Result<List<SearchModel>>> deleteHistorySearch(String id);

  Future<Result<List<SearchModel>>> searchAll(String text);
  Future<Result<List<PromptSearchResultModel>>> getSearchPromptResult(
      String text, FilterSearchEntity filler);
}

class SearchDatasourceImpl implements SearchDatasource {
  @override
  Future<Result<List<SearchModel>>> deleteHistorySearch(String id) async {
    // TODO: implement deleteHistorySearch
    throw UnimplementedError();
  }

  @override
  Future<Result<List<SearchModel>>> getSearchHistory() async {
    try {
      final searchHistoryList = searchHistory
          .map((json) => SearchModel.fromJson(json))
          .toList();
      return Result.success(searchHistoryList);
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<Result<List<PromptSearchResultModel>>> getSearchPromptResult(
      String text, FilterSearchEntity filler) async {
    try {
      final searchResultList = jsonPromptList
          .map((json) => PromptSearchResultModel.fromJson(json))
          .toList();
      return Result.success(searchResultList);
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<Result<List<SearchModel>>> searchAll(String text) async {
    try {
      final searchResultList =
          searchResult.map((json) => SearchModel.fromJson(json)).toList();
      return Result.success(searchResultList);
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }
}
