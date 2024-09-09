import 'package:brain_box_ai/domain/usecases/category_use_case.dart';
import 'package:brain_box_ai/providers/home/state/category_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/entities/search/category_entity.dart';
import 'home_provider.dart';

class CategoryNotifier extends StateNotifier<CategoryState> {
  final CategoryUseCase useCase;

  CategoryNotifier(this.useCase) : super(const CategoryState()) {
    fetchCategories();
  }

  Future<void> fetchCategories() async {

    state = state.copyWith(isLoading: true);
    try {
      final result = await useCase.call(const CategoryParam());
      if (result.isSuccess) {
        final List<CategoryEntity> categories = result.data;
        state = state.copyWith(isLoading: false, listCategory: categories);
      } else {
        state = state.copyWith(isLoading: false, error: true);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: true);
    }
  }
}

final categoryNotifierProvider =
    StateNotifierProvider<CategoryNotifier, CategoryState>((ref) {
  final useCase = ref.read(categoryUseCaseProvider);
  return CategoryNotifier(useCase);
});

// UseCase Provider
final categoryUseCaseProvider = Provider<CategoryUseCase>((ref) {
  final repository = ref.read(homeRepositoryProvider);
  return CategoryUseCase(repository);
});
