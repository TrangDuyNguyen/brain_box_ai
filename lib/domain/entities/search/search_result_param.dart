import 'filter_search_entity.dart';

class SearchResultParam {
  final String text;
  final FilterSearchEntity filterSearch;

  SearchResultParam({
    required this.text,
    required this.filterSearch,
  });

  SearchResultParam copyWith({String? text, FilterSearchEntity? filterSearch}) {
    return SearchResultParam(
        text: text ?? this.text,
        filterSearch: filterSearch ?? this.filterSearch);
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'filterSearch': filterSearch.toJson(),
    };
  }

  factory SearchResultParam.fromJson(Map<String, dynamic> json) {
    return SearchResultParam(
      text: json['text'] as String,
      filterSearch: FilterSearchEntity.fromJson(json['filterSearch'] as Map<String, dynamic>),
    );
  }
}
