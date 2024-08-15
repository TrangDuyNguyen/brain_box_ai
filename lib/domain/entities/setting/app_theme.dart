class ThemeSetting {
  final String theme;

  ThemeSetting(this.theme);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeSetting &&
          runtimeType == other.runtimeType &&
          theme == other.theme;

  @override
  int get hashCode => theme.hashCode;
}
