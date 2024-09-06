import 'package:brain_box_ai/core/exception/result.dart';
import 'package:brain_box_ai/data/datasources/search_datasource.dart';
import 'package:brain_box_ai/data/models/extentions/prompt_mapper.dart';
import 'package:brain_box_ai/data/models/extentions/search_mapper.dart';

import 'package:brain_box_ai/domain/entities/prompt_entity.dart';

import 'package:brain_box_ai/domain/entities/search/filter_search_entity.dart';

import 'package:brain_box_ai/domain/entities/search/search_entity.dart';

import '../../domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource searchDatasource;

  SearchRepositoryImpl(this.searchDatasource);

  @override
  Future<Result<List<SearchEntity>>> deleteHistorySearch(String id) async {
    // TODO: implement deleteHistorySearch
    throw UnimplementedError();
  }

  @override
  Future<Result<List<SearchEntity>>> getSearchHistory() async {
    try {
      final result = await searchDatasource.getSearchHistory();

      if (result.isSuccess) {
        final searchResultHistory = result.data ?? [];
        final searchResultEntities = searchResultHistory
            .map((model) => SearchMapper().fromDTO(model))
            .toList();

        return Result.success(searchResultEntities);
      } else {
        return Result.errors(result.getError()!);
      }
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<Result<List<PromptEntity>>> getSearchPromptResult(
      String text, FilterSearchEntity filler) async {
    try {
      final result = await searchDatasource.getSearchPromptResult(text, filler);

      if (result.isSuccess) {
        final searchResultModels = result.data ?? [];
        final searchResultEntities =
            searchResultModels.map((model) => model.toEntity()).toList();

        return Result.success(searchResultEntities);
      } else {
        return Result.errors(result.getError()!);
      }
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<Result<List<SearchEntity>>> searchAll(String text) async {
    try {
      final result = await searchDatasource.searchAll(text);

      if (result.isSuccess) {
        final searchResult = result.data ?? [];
        final searchResultEntities =
            searchResult.map((model) => SearchMapper().fromDTO(model)).toList();

        return Result.success(searchResultEntities);
      } else {
        return Result.errors(result.getError()!);
      }
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }
}
