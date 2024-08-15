class RegionEntity {
  String name;

  RegionEntity({
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RegionEntity &&
          runtimeType == other.runtimeType &&
          name == other.name);

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'RegioneEntity{' ' name: $name,' '}';
  }

  RegionEntity copyWith({
    String? name,
  }) {
    return RegionEntity(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory RegionEntity.fromMap(Map<String, dynamic> map) {
    return RegionEntity(
      name: map['name'] as String,
    );
  }

//</editor-fold>
}
