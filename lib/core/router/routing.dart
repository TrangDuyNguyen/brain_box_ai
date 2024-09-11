import 'dart:convert';

import 'package:brain_box_ai/core/router/router_path.dart';
import 'package:brain_box_ai/presentation/auth/pages/auth_page.dart';
import 'package:brain_box_ai/presentation/auth/pages/login_page.dart';
import 'package:brain_box_ai/presentation/auth/pages/reset_password_page.dart';
import 'package:brain_box_ai/presentation/auth/pages/send_email_page.dart';
import 'package:brain_box_ai/presentation/auth/pages/sign_up_page.dart';
import 'package:brain_box_ai/presentation/auth/pages/verify_page.dart';
import 'package:brain_box_ai/presentation/category/pages/category_page.dart';
import 'package:brain_box_ai/presentation/home/pages/home_page.dart';
import 'package:brain_box_ai/presentation/profile/profile_detail_page.dart';
import 'package:brain_box_ai/presentation/prompts/pages/prompt_page.dart';
import 'package:brain_box_ai/presentation/search/pages/search_page.dart';
import 'package:brain_box_ai/presentation/search/pages/search_result_page.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/search/search_result_param.dart';
import '../../presentation/auth/pages/on_boading_page.dart';
import '../../presentation/search/pages/filter_page.dart';

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
  GoRoute(
    path: RouterPath.profile.getPath,
    builder: (context, state) => const ProfileDetailPage(),
  ),
  GoRoute(
    path: RouterPath.search.getPath,
    builder: (context, state) => const SearchPage(),
  ),
  GoRoute(
    path: RouterPath.filter.getPath,
    builder: (context, state) => const FilterPage(),
  ),
  GoRoute(
    path: RouterPath.searchResult.getPath,
    builder: (context, state) {
      final jsonString = state.extra as String;
      final searchResultParam = SearchResultParam.fromJson(jsonDecode(jsonString));
      return SearchResultPage(searchResultParam);
    },
  ),
  GoRoute(
    path: RouterPath.category.getPath,
    builder: (context, state) => const CategoryPage(),
  ),
  GoRoute(
    path: RouterPath.promptPage.getPath,
    builder: (context, state) => const PromptPage(),
  ),
];
