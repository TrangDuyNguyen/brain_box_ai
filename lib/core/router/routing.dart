import 'package:brain_box_ai/core/router/router_path.dart';
import 'package:brain_box_ai/presentation/auth/pages/auth_page.dart';
import 'package:brain_box_ai/presentation/auth/pages/login_page.dart';
import 'package:brain_box_ai/presentation/auth/pages/phone_number_page.dart';
import 'package:brain_box_ai/presentation/auth/pages/sign_up_page.dart';
import 'package:brain_box_ai/presentation/auth/pages/verify_page.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/auth/pages/on_boading_page.dart';

final List<RouteBase> routes = [
  GoRoute(
    path: RouterPath.onboard.getPath,
    builder: (context, state) => const OnBoardingPage(),
  ),
  GoRoute(
    path: RouterPath.authPage.getPath,
    builder: (context, state) => const AuthPage(),
  ),
  GoRoute(
    path: RouterPath.loginPage.getPath,
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: RouterPath.signUpPage.getPath,
    builder: (context, state) => const SignUpPage(),
  ),
  GoRoute(
    path: RouterPath.phoneNumber.getPath,
    builder: (context, state) => const PhoneNumberPage(),
  ),
  GoRoute(
    path: RouterPath.verifyAcc.getPath,
    builder: (context, state) => const VerifyPage(),
  ),
];
