import 'package:flutter/cupertino.dart';

import '../../../domain/entities/prompt_entity.dart';

@immutable
abstract class SearchResultState {
  const SearchResultState();
}

class SearchResultInitial extends SearchResultState {
  const SearchResultInitial();
}

class SearchResultLoading extends SearchResultState {
  const SearchResultLoading();
}

class SearchPromptResultSuccess extends SearchResultState {
  final List<PromptEntity> listResult;
  const SearchPromptResultSuccess(this.listResult);
}

class SearchResultError extends SearchResultState {
  final String message;
  const SearchResultError(this.message);
}