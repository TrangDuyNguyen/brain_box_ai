class PromptEntity {
  final String id;
  final String title;
  final String content;
  final String category;
  final bool like;
  final bool save;
  final double rate;
  final DateTime createdAt;
  final DateTime updatedAt;

  const PromptEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.like,
    required this.rate,
    required this.save,
    required this.createdAt,
    required this.updatedAt,
  });
}
