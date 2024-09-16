import 'package:brain_box_ai/data/models/review_model.dart';
import 'package:brain_box_ai/domain/entities/review/review_entity.dart';

import 'base_mapper_model.dart';

class ReviewMapper extends MapperModel<ReviewModel, ReviewEntity> {
  @override
  ReviewEntity fromDTO(ReviewModel dto) {
    return ReviewEntity(
      userId: dto.userId,
      promptId: dto.promptId,
      rating: dto.rating,
      comment: dto.comment,
      likeCount: dto.likeCount,
      updatedAt: DateTime.parse(dto.updatedAt),
      createdAt: DateTime.parse(dto.createdAt),
    );
  }

  @override
  ReviewModel toDTO(ReviewEntity model) {
    return ReviewModel(
      userId: model.userId,
      promptId: model.promptId,
      rating: model.rating,
      comment: model.comment,
      likeCount: model.likeCount,
      updatedAt: model.updatedAt.toIso8601String(),
      createdAt: model.createdAt.toIso8601String(),
    );
  }
}
