import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/search_model.freezed.dart';
part 'gen/search_model.g.dart';

@freezed
class SearchModel with _$SearchModel {
  const factory SearchModel({
    required int id,
    required String result,
  }) = _SearchResultModel;

  factory SearchModel.fromJson(Map<String, dynamic> json) => _$SearchModelFromJson(json);
}