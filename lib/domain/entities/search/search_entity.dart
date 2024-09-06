class SearchEntity {
  final int id;
  final String result;

  SearchEntity({
    required this.id,
    required this.result,
  });

  SearchEntity copyWith({
    int? id,
    String? result,
  }) {
    return SearchEntity(id: id ?? this.id, result: result ?? this.result);
  }
}
