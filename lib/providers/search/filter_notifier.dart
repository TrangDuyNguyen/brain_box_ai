import 'package:brain_box_ai/providers/search/state/filter_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterNotifier extends StateNotifier<FilterState> {
  FilterNotifier() : super(FilterState(selectedCategoryIndices: [], selectedRateIndex: 0));

  void updateCategoryFilter(List<int> newSelectedCategories) {
    state = state.copyWith(selectedCategoryIndices: newSelectedCategories);
  }

  void updateRateFilter(int newSelectedRate) {
    state = state.copyWith(selectedRateIndex: newSelectedRate);
  }

  void toggleCategoryChip(int index) {
    final List<int> updatedIndices = List.from(state.selectedCategoryIndices);
    if (updatedIndices.contains(index)) {
      updatedIndices.remove(index);
    } else {
      updatedIndices.add(index);
    }
    state = state.copyWith(selectedCategoryIndices: updatedIndices);
  }

  void resetFilters() {
    state = FilterState(selectedCategoryIndices: [], selectedRateIndex: 0);
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, FilterState>(
      (ref) => FilterNotifier(),
);