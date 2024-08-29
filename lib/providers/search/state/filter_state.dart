import '../../../domain/entities/search/category_entity.dart';

class FilterState {
  final List<CategoryEntity> selectedCategoryIndices;
  final CategoryEntity selectedRateIndex;

  FilterState({
    required this.selectedCategoryIndices,
    required this.selectedRateIndex,
  });

  FilterState copyWith({
    List<CategoryEntity>? selectedCategoryIndices,
    CategoryEntity? selectedRateIndex,
  }) {
    return FilterState(
      selectedCategoryIndices: selectedCategoryIndices ?? this.selectedCategoryIndices,
      selectedRateIndex: selectedRateIndex ?? this.selectedRateIndex,
    );
  }
}