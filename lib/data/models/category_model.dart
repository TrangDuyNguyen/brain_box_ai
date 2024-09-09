import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/category_model.freezed.dart';

part 'gen/category_model.g.dart';

@unfreezed
class CategoryModel with _$CategoryModel {
  factory CategoryModel({
    required int id,
    required String name,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
