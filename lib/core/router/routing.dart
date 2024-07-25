import 'package:brain_box_ai/core/router/router_path.dart';
import 'package:brain_box_ai/presentation/auth/pages/auth_page.dart';
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
];
