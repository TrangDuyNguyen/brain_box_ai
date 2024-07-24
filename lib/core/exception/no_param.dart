class NoParam extends Object {
  const NoParam();

  Map<String, dynamic> toJson() {
    return {};
  }

  static fromJson(Map<String, dynamic> json) {
    return const NoParam();
  }
}
