import 'package:brain_box_ai/domain/entities/review/review_entity.dart';

import '../../core/exception/no_result.dart';
import '../../core/exception/result.dart';

abstract class ReviewRepository {
  Future<Result<List<ReviewEntity>>> getListReview();
  Future<NoResult> postReview();
  Future<Result<ReviewEntity>> editReview();
  Future<NoResult> deleteReview();
}
