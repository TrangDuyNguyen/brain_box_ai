import '../../../domain/entities/review/review_entity.dart';

class ReviewState {
  final List<ReviewEntity> listReview;
  final List<ReviewEntity> listFilteredReview;
  final bool isLoading;
  final String error;

  ReviewState({
    this.listReview = const [],
    this.listFilteredReview = const [],
    this.isLoading = false,
    this.error = '',
  });

  ReviewState copyWith({
    List<ReviewEntity>? listReview,
    List<ReviewEntity>? listFilteredReview,
    bool? isLoading,
    String? error,
  }) {
    return ReviewState(
      listReview: listReview ?? this.listReview,
      listFilteredReview: listFilteredReview ?? this.listFilteredReview,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
