enum RouterPath {
  splash,
  authPage,
  onboard,
  loginPage,
  signUpPage,
  phoneNumber,
  verifyAcc,
  resetPass,
  homePage,
  profile,
  search,
  filter,
  searchResult,
}

extension RouterPathEx on RouterPath {
  static const Map<RouterPath, String> _pageNames = {
    RouterPath.onboard: 'onboard',
    RouterPath.authPage: 'authPage',
    RouterPath.loginPage: 'loginPage',
    RouterPath.signUpPage: 'signUpPage',
    RouterPath.phoneNumber: 'phoneNumber',
    RouterPath.verifyAcc: 'verifyAcc',
    RouterPath.resetPass: 'resetPass',
    RouterPath.homePage: 'homePage',
    RouterPath.profile: 'profile',
    RouterPath.search: 'search',
    RouterPath.filter: 'filter',
    RouterPath.searchResult: 'searchResult',
  };

  static const Map<RouterPath, String> _pagePaths = {
    /// Main
    RouterPath.onboard: '/onboard',
    RouterPath.authPage: '/authPage',
    RouterPath.loginPage: '/loginPage',
    RouterPath.signUpPage: '/signUpPage',
    RouterPath.phoneNumber: '/phoneNumber',
    RouterPath.verifyAcc: '/verifyAcc',
    RouterPath.resetPass: '/resetPass',
    RouterPath.homePage: '/homePage',
    RouterPath.profile: '/profile',
    RouterPath.search: '/search',
    RouterPath.filter: '/filter',
    RouterPath.searchResult: '/searchResult',
  };

  String get namePage => _pageNames[this] ?? '';

  String get getPath => _pagePaths[this] ?? RouterPath.onboard.getPath;

  String get getRoute => '/${_pagePaths[this] ?? RouterPath.onboard.getPath}';
}
