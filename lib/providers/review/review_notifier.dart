import 'package:brain_box_ai/domain/usecases/review_use_case/review_get_list_use_case.dart';
import 'package:brain_box_ai/providers/review/review_provider.dart';
import 'package:brain_box_ai/providers/review/state/review_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReviewNotifier extends StateNotifier<ReviewState> {
  final ReviewGetListUseCase useCase;

  ReviewNotifier(this.useCase) : super(ReviewState()) {
    getListReview();
  }

  Future<void> getListReview() async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await useCase.call(ReviewParam());
      result.fold((error) {
        state = state.copyWith(isLoading: false, error: error.toString());
      }, (data) {
        state = state.copyWith(
          isLoading: false,
          listReview: data,
          listFilteredReview: data,
        );
      });
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void filterByRate(int rate) {
    if (rate == 0) {
      state = state.copyWith(listFilteredReview: state.listReview);
    } else {
      final filteredList =
          state.listReview.where((review) => review.rating == rate).toList();
      state = state.copyWith(listFilteredReview: filteredList);
    }
  }
}

final reviewNotifierProvider =
    StateNotifierProvider<ReviewNotifier, ReviewState>((ref) {
  final useCase = ref.read(reviewUseCaseProvider);
  return ReviewNotifier(useCase);
});
