import 'package:brain_box_ai/core/router/router_path.dart';
import 'package:brain_box_ai/presentation/auth/pages/auth_page.dart';
import 'package:brain_box_ai/presentation/auth/pages/login_page.dart';
import 'package:brain_box_ai/presentation/auth/pages/reset_password_page.dart';
import 'package:brain_box_ai/presentation/auth/pages/send_email_page.dart';
import 'package:brain_box_ai/presentation/auth/pages/sign_up_page.dart';
import 'package:brain_box_ai/presentation/auth/pages/verify_page.dart';
import 'package:brain_box_ai/presentation/home/pages/home_page.dart';
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
    builder: (context, state) => const SendEmailPage(),
  ),
  GoRoute(
    path: RouterPath.verifyAcc.getPath,
    builder: (context, state) => const VerifyPage(),
  ),
  GoRoute(
    path: RouterPath.resetPass.getPath,
    builder: (context, state) => const ResetPasswordPage(),
  ),
  GoRoute(
    path: RouterPath.homePage.getPath,
    builder: (context, state) => const HomePage(),
  ),
];
