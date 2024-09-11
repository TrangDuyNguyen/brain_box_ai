import 'package:brain_box_ai/domain/entities/search/category_entity.dart';

class PromptEntity {
  final String id;
  final String title;
  final String content;
  final CategoryEntity category;
  final bool like;
  final bool save;
  final int rate;
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
