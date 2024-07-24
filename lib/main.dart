import 'package:brain_box_ai/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/environments/app_config.dart';
import 'core/environments/flavor_config.dart';
import 'core/router/router.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  AppConfig.initialize(flavor: Flavor.debug, environment: Environment.test);
  runApp(const ProviderScope(overrides: [], child: App()));
}

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.read(appThemeProvider);
    final router = ref.read(routerProvider);

    return MaterialApp.router(
      title: AppConfig.instance.appName,
      locale: const Locale("en"),
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      localizationsDelegates: AppStr.localizationsDelegates,
      supportedLocales: AppStr.supportedLocales,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(AppStr.of(context).helloWorld),
      ),
    );
  }
}
