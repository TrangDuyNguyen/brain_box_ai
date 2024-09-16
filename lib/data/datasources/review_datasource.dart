import 'package:brain_box_ai/core/exception/no_result.dart';
import 'package:brain_box_ai/data/models/review_model.dart';

import '../../core/exception/result.dart';
import 'dummy_data/dummy_data.dart';

abstract class ReviewDatasource {
  Future<Result<List<ReviewModel>>> getListReview();
  Future<NoResult> postReview();
  Future<Result<ReviewModel>> editReview();
  Future<NoResult> deleteReview();
}

class ReviewDatasourceImpl implements ReviewDatasource {
  @override
  Future<NoResult> deleteReview() {
    // TODO: implement deleteReview
    throw UnimplementedError();
  }

  @override
  Future<Result<ReviewModel>> editReview() {
    // TODO: implement editReview
    throw UnimplementedError();
  }

  @override
  Future<Result<List<ReviewModel>>> getListReview() async {
    try {
      final listReview =
          jsonReviewList.map((json) => ReviewModel.fromJson(json)).toList();
      return Result.success(listReview);
    } on Exception catch (e) {
      return Result.errors(e);
    }
  }

  @override
  Future<NoResult> postReview() {
    // TODO: implement postReview
    throw UnimplementedError();
  }
}
