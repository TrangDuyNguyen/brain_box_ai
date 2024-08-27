class FilterState {
  final List<int> selectedCategoryIndices;
  final int selectedRateIndex;

  FilterState({
    required this.selectedCategoryIndices,
    required this.selectedRateIndex,
  });

  FilterState copyWith({
    List<int>? selectedCategoryIndices,
    int? selectedRateIndex,
  }) {
    return FilterState(
      selectedCategoryIndices: selectedCategoryIndices ?? this.selectedCategoryIndices,
      selectedRateIndex: selectedRateIndex ?? this.selectedRateIndex,
    );
  }
}