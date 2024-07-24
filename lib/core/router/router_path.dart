enum RouterPath {
  splash,
  welcome,
  onboard,
}

extension RouterPathEx on RouterPath {
  static const Map<RouterPath, String> _pageNames = {
    RouterPath.onboard: 'onboard',
  };

  static const Map<RouterPath, String> _pagePaths = {
    /// Main
    RouterPath.onboard: '/onboard',

  };

  String get namePage => _pageNames[this] ?? '';

  String get getPath => _pagePaths[this] ?? RouterPath.onboard.getPath;

  String get getRoute => '/${_pagePaths[this] ?? RouterPath.onboard.getPath}';
}