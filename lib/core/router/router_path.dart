enum RouterPath {
  splash,
  authPage,
  onboard,
  loginPage,
  signUpPage,
  phoneNumber,
  verifyAcc,
  resetPass,
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
  };

  String get namePage => _pageNames[this] ?? '';

  String get getPath => _pagePaths[this] ?? RouterPath.onboard.getPath;

  String get getRoute => '/${_pagePaths[this] ?? RouterPath.onboard.getPath}';
}
