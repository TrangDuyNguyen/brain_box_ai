import 'package:brain_box_ai/l10n/generated/app_localizations.dart';
import 'package:brain_box_ai/providers/setting/setting_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/environments/app_config.dart';
import 'core/environments/flavor_config.dart';
import 'core/router/router.dart';
import 'core/theme/app_theme.dart';
import 'data/db/hive/core/hive_database_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Hive and Database
  final hiveManager = HiveDatabaseManager();
  await hiveManager.start();

  AppConfig.initialize(flavor: Flavor.debug, environment: Environment.test);
  runApp(const ProviderScope(overrides: [], child: App()));
}

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSetting = ref.watch(settingNotifierProvider);
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
