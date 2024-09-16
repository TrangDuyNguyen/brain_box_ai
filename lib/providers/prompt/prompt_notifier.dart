import 'package:brain_box_ai/providers/prompt/prompt_provider.dart';
import 'package:brain_box_ai/providers/prompt/state/prompt_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/usecases/prompt_use_case.dart';

class PromptNotifier extends StateNotifier<PromptState> {
  final PromptUseCase promptUseCase;

  PromptNotifier(this.promptUseCase) : super(const PromptState()) {
    getListPrompt();
  }

  Future<void> getListPrompt() async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await promptUseCase.call(PromptParam());
      result.fold(
        (error) {
          state = state.copyWith(isLoading: false, error: error.toString());
        },
        (data) {
          state = state.copyWith(
            isLoading: false,
            originalList: data,
            filteredList: data,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void filterByCategory(int categoryId) {
    if (categoryId == 0) {
      state = state.copyWith(filteredList: state.originalList);
    } else {
      // Lọc theo categoryId
      final filteredList = state.originalList
          .where((prompt) => prompt.category.id == categoryId)
          .toList();
      state = state.copyWith(filteredList: filteredList);
    }
  }
}

final promptNotifierProvider =
    StateNotifierProvider<PromptNotifier, PromptState>((ref) {
  final useCase = ref.read(promptUseCaseProvider);
  return PromptNotifier(useCase);
});
