import 'package:brain_box_ai/domain/entities/search/search_result_param.dart';
import 'package:brain_box_ai/domain/repositories/search_repository.dart';
import 'package:brain_box_ai/providers/search/search_provider.dart';
import 'package:brain_box_ai/providers/search/state/search_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchNotifier extends StateNotifier<SearchState> {
  final SearchRepository repository;

  SearchNotifier(this.repository) : super(const SearchInitial()) {
    getListSearchHistory();
  }

  Future<void> getListSearchHistory() async {
    final result = await repository.getSearchHistory();
    result.fold(
      (error) {
        state = SearchError(error.toString());
      },
      (data) {
        state = SearchHistorySuccess(data);
      },
    );
  }

  Future<void> onSearch(String text) async {
    final result = await repository.searchAll(text);
    result.fold(
      (error) {
        state = SearchError(error.toString());
      },
      (data) {
        state = SearchResultSuccess(data);
      },
    );
  }
}

final searchNotifierProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  final repository = ref.read(searchRepositoryProvider);
  return SearchNotifier(repository);
});
