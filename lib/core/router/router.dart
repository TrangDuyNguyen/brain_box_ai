import 'package:brain_box_ai/core/router/router_path.dart';
import 'package:brain_box_ai/core/router/routing.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      // TODO: add your router here
      initialLocation: RouterPath.onboard.getPath,
      routes: routes,
    );
  },
);
