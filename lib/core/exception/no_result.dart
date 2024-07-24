class NoResult extends Object {
  const NoResult();

  Map<String, dynamic> toJson() {
    return {};
  }

  static fromJson(Map<String, dynamic> json) {
    return const NoResult();
  }
}
