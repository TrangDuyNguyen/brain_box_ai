import 'package:brain_box_ai/domain/entities/search/search_result_param.dart';
import 'package:brain_box_ai/providers/search/search_provider.dart';
import 'package:brain_box_ai/providers/search/state/search_result_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/repositories/search_repository.dart';

class SearchResultNotifier extends StateNotifier<SearchResultState> {
  final SearchRepository repository;

  SearchResultNotifier(this.repository) : super(const SearchResultInitial());

  Future<void> onSearchResult(SearchResultParam param) async {
    state = const SearchResultLoading();
    final result =
        await repository.getSearchPromptResult(param.text, param.filterSearch);
    result.fold(
      (error) {
        state = SearchResultError(error.toString());
      },
      (data) {
        state = SearchPromptResultSuccess(data);
      },
    );
  }
}

final searchResultNotifierProvider =
    StateNotifierProvider<SearchResultNotifier, SearchResultState>((ref) {
  final repository = ref.read(searchRepositoryProvider);
  return SearchResultNotifier(repository);
});
