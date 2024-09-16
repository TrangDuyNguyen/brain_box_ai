import 'package:brain_box_ai/providers/home/state/home_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/usecases/home_use_case.dart';
import 'home_provider.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  final HomeUseCase homeUseCase;

  HomeNotifier(this.homeUseCase) : super(const HomeInitial()) {
    getListTopPrompt();
  }

  Future<void> getListTopPrompt() async {
    state = const HomeLoading();
    await Future.delayed(const Duration(seconds: 3));
    const params = HomeParams();
    final result = await homeUseCase.call(params);
    result.fold(
          (error) {
        state = HomeError(error.toString());
      },
          (data) {
        // Set both the original and filtered list when loading data
        state = HomeSuccess(
          originalList: data,
          filteredList: data, // Initially, filteredList is the same as originalList
        );
      },
    );
  }

  // Filter the prompts by category
  void filterByCategory(int categoryId) {
    if (categoryId == 0) {
      // If "All" is selected, show all prompts (reset the filtered list to originalList)
      state = (state as HomeSuccess).copyWith(filteredList: (state as HomeSuccess).originalList);
    } else {
      // Otherwise, filter based on category ID
      final filteredList = (state as HomeSuccess)
          .originalList
          .where((prompt) => prompt.category.id == categoryId)
          .toList();
      state = (state as HomeSuccess).copyWith(filteredList: filteredList);
    }
  }
}

final homeNotifierProvider =
    StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final useCase = ref.read(homeUseCaseProvider);
  return HomeNotifier(useCase);
});
