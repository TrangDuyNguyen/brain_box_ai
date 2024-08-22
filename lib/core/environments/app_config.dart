//
import 'flavor_config.dart';

class AppConfig {
  final String appName;
  final String apiBaseUrl;
  final String apiKey;
  final String appVersion;

  String deviceToken = '';
  String defaultCurrencyCode;
  String defaultCountryCode;
  String defaultLanguageCode;
  String defaultThemeMode;
  bool isEnableNotification = false;
  int defaultThemeColor = 0;

  AppConfig({
    required this.appName,
    required this.apiBaseUrl,
    required this.apiKey,
    this.appVersion = '1.0.0',
    this.defaultCountryCode = 'US',
    this.defaultLanguageCode = 'en',
    this.defaultThemeMode = 'light',
    this.defaultCurrencyCode = 'USD',
    this.defaultThemeColor = 0,
  });

  static AppConfig? _instance;

  static void initialize(
      {required Flavor flavor, required Environment environment}) {
    switch (flavor) {
      case Flavor.debug:
        switch (environment) {
          case Environment.test:
            _instance = AppConfig(
              appName: 'Brain box Ai (Test)',
              apiBaseUrl: 'https://test.api.myapp.com',
              apiKey: 'test-api-key',
            );
            break;
          case Environment.staging:
            _instance = AppConfig(
              appName: 'Brain box Ai (Staging)',
              apiBaseUrl: 'https://staging.api.myapp.com',
              apiKey: 'staging-api-key',
            );
            break;
          default:
            throw Exception(
                'Unknown environment: $environment for debug flavor');
        }
        break;
      case Flavor.release:
        _instance = AppConfig(
          appName: 'Brain box Ai',
          apiBaseUrl: 'https://api.myapp.com',
          apiKey: 'production-api-key',
        );
        break;
    }
  }

  static AppConfig get instance {
    if (_instance == null) {
      throw Exception('AppConfig is not initialized. Call initialize() first.');
    }
    return _instance!;
  }
}
