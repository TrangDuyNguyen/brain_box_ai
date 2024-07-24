import 'app_localizations.dart';

/// The translations for English (`en`).
class AppStrEn extends AppStr {
  AppStrEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';
}
