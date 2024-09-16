import 'package:brain_box_ai/core/exception/result.dart';
import 'package:brain_box_ai/core/usecases/usecase.dart';
import 'package:brain_box_ai/domain/entities/review/review_entity.dart';
import 'package:brain_box_ai/domain/repositories/review_repository.dart';

class ReviewGetListUseCase implements UseCase<List<ReviewEntity>, ReviewParam> {
  final ReviewRepository repository;

  ReviewGetListUseCase(this.repository);
  @override
  Future<Result> call(ReviewParam params) {
    return repository.getListReview();
  }
}

class ReviewParam {}
