import 'package:brain_box_ai/core/exception/no_result.dart';
import 'package:brain_box_ai/core/exception/result.dart';
import 'package:brain_box_ai/data/datasources/review_datasource.dart';
import 'package:brain_box_ai/data/models/extentions/review_mapper.dart';
import 'package:brain_box_ai/domain/entities/review/review_entity.dart';
import 'package:brain_box_ai/domain/repositories/review_repository.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  final ReviewDatasource datasource;

  ReviewRepositoryImpl(this.datasource);

  @override
  Future<NoResult> deleteReview() {
    // TODO: implement deleteReview
    throw UnimplementedError();
  }

  @override
  Future<Result<ReviewEntity>> editReview() {
    // TODO: implement editReview
    throw UnimplementedError();
  }

  @override
  Future<Result<List<ReviewEntity>>> getListReview() async {
    try {
      final result = await datasource.getListReview();

      if (result.isSuccess) {
        final reviewList = result.data ?? [];
        final reviewEntities =
            reviewList.map((model) => ReviewMapper().fromDTO(model)).toList();

        return Result.success(reviewEntities);
      } else {
        return Result.errors(result.getError()!);
      }
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
