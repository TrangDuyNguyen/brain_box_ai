import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/review_model.freezed.dart';

part 'gen/review_model.g.dart';

@unfreezed
class ReviewModel with _$ReviewModel {
  factory ReviewModel({
    required String userId,
    required String promptId,
    required int rating,
    required String comment,
    required int likeCount,
    required String createdAt,
    required String updatedAt,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}
