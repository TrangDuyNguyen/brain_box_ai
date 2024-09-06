import 'package:flutter/foundation.dart';
import '../../../domain/entities/search/search_entity.dart';

@immutable
abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchHistorySuccess extends SearchState {
  final List<SearchEntity> listSearchHistory;
  const SearchHistorySuccess(this.listSearchHistory);
}

class SearchResultSuccess extends SearchState {
  final List<SearchEntity> listSearchResult;
  const SearchResultSuccess(this.listSearchResult);
}

class SearchError extends SearchState {
  final String message;
  const SearchError(this.message);
}
