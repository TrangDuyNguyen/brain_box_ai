import 'package:brain_box_ai/core/router/router_path.dart';
import 'package:brain_box_ai/main.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> routes = [
  GoRoute(
    path: RouterPath.onboard.getPath,
    builder: (context, state) => const OnBoardingPage(),
  ),
];
