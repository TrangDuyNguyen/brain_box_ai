class CategoryEntity {
  final int id;
  final String name;

  CategoryEntity({
    required this.id,
    required this.name,
  });

  CategoryEntity copyWith({
    int? id,
    String? name,
  }) {
    return CategoryEntity(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory CategoryEntity.fromJson(Map<String, dynamic> json) {
    return CategoryEntity(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}
