import '../../../domain/entities/search/category_entity.dart';

class CategoryState {
  final List<CategoryEntity> listCategory;
  final bool isLoading;
  final bool error;

  const CategoryState({
    this.listCategory = const [],
    this.isLoading = false,
    this.error = false,
  });

  CategoryState copyWith({
    List<CategoryEntity>? listCategory,
    bool? isLoading,
    bool? error,
  }) {
    return CategoryState(
        listCategory: listCategory ?? this.listCategory,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error);
  }
}
