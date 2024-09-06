import 'category_entity.dart';

class FilterSearchEntity {
  final List<CategoryEntity> selectedCategoryIndices;
  final CategoryEntity selectedRateIndex;

  FilterSearchEntity({
    required this.selectedCategoryIndices,
    required this.selectedRateIndex,
  });

  FilterSearchEntity copyWith({
    List<CategoryEntity>? selectedCategoryIndices,
    CategoryEntity? selectedRateIndex,
  }) {
    return FilterSearchEntity(
      selectedCategoryIndices: selectedCategoryIndices ?? this.selectedCategoryIndices,
      selectedRateIndex: selectedRateIndex ?? this.selectedRateIndex,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'selectedCategoryIndices': selectedCategoryIndices.map((e) => e.toJson()).toList(),
      'selectedRateIndex': selectedRateIndex.toJson(),
    };
  }

  factory FilterSearchEntity.fromJson(Map<String, dynamic> json) {
    return FilterSearchEntity(
      selectedCategoryIndices: (json['selectedCategoryIndices'] as List<dynamic>)
          .map((e) => CategoryEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedRateIndex: CategoryEntity.fromJson(json['selectedRateIndex']),
    );
  }
}