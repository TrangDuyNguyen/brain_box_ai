import 'package:brain_box_ai/providers/search/state/filter_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/entities/search/category_entity.dart';

class FilterNotifier extends StateNotifier<FilterState> {
  FilterNotifier()
      : super(FilterState(
            selectedCategoryIndices: [],
            selectedRateIndex: CategoryEntity(id: 0, name: 'All')));

  void updateCategoryFilter(List<CategoryEntity> newSelectedCategories) {
    state = state.copyWith(selectedCategoryIndices: newSelectedCategories);
  }

  void updateRateFilter(CategoryEntity newSelectedRate) {
    state = state.copyWith(selectedRateIndex: newSelectedRate);
  }

  void toggleCategoryChip(CategoryEntity category) {
    final List<CategoryEntity> updatedIndices =
        List.from(state.selectedCategoryIndices);
    if (updatedIndices.any((element) => element.id == category.id)) {
      updatedIndices.removeWhere((element) => element.id == category.id);
    } else {
      updatedIndices.add(category);
    }
    state = state.copyWith(selectedCategoryIndices: updatedIndices);
  }

  void resetFilters() {
    state = FilterState(
        selectedCategoryIndices: [],
        selectedRateIndex: CategoryEntity(id: 0, name: 'All'));
  }
}

final filterNotifierProvider = StateNotifierProvider<FilterNotifier, FilterState>(
  (ref) => FilterNotifier(),
);
