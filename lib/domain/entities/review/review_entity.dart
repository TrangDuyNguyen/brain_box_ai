class ReviewEntity {
  final String userId;
  final String promptId;
  final int rating;
  final String comment;
  final int likeCount;
  final DateTime updatedAt;
  final DateTime createdAt;

  ReviewEntity({
    required this.userId,
    required this.promptId,
    required this.rating,
    required this.comment,
    required this.likeCount,
    required this.updatedAt,
    required this.createdAt,
  });
}
