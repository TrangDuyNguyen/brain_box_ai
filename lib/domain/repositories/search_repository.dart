import 'package:brain_box_ai/domain/entities/prompt_entity.dart';
import 'package:brain_box_ai/domain/entities/search/search_entity.dart';

import '../../core/exception/result.dart';
import '../entities/search/filter_search_entity.dart';

abstract class SearchRepository {
  Future<Result<List<SearchEntity>>> getSearchHistory();
  Future<Result<List<SearchEntity>>> deleteHistorySearch(String id);

  Future<Result<List<SearchEntity>>> searchAll(String text);
  Future<Result<List<PromptEntity>>> getSearchPromptResult(
      String text, FilterSearchEntity filler);
}