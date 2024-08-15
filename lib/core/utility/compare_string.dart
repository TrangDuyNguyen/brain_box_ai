extension CompareStringUtils on String? {
  bool equalsIgnoreCase(String? other) {
    if (this == null && other == null) {
      return true;
    }
    if (this == null || other == null) {
      return false;
    }
    return this!.toLowerCase() == other.toLowerCase();
  }

  bool containsIgnoreCase(String? other) {
    if (this == null && other == null) {
      return true;
    }
    if (this == null || other == null) {
      return false;
    }
    return this!.trimAll!.toLowerCase().contains(other.trimAll!.toLowerCase());
  }
}

extension TrimStringUtils on String? {
  String? get trim => this?.trim();
  String? get trimAll {
    return this?.replaceAll(RegExp(r'\s+'), '');
  }
}
