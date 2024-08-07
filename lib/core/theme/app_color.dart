import 'package:flutter/material.dart';

import 'app_text_style.dart';

class AppColors {
  late final ThemeData _themeData;

  AppColors._(this._themeData);

  static AppColors of(BuildContext context) {
    return AppColors._(Theme.of(context));
  }

  Color get primary => _themeData.colorScheme.primary;
  Color get onPrimary => _themeData.colorScheme.onPrimary;
  Color get primaryContainer => _themeData.colorScheme.primaryContainer;
  Color get onPrimaryContainer => _themeData.colorScheme.onPrimaryContainer;
  Color get secondary => _themeData.colorScheme.secondary;
  Color get onSecondary => _themeData.colorScheme.onSecondary;
  Color get secondaryContainer => _themeData.colorScheme.secondaryContainer;
  Color get onSecondaryContainer => _themeData.colorScheme.onSecondaryContainer;
  Color get tertiary => _themeData.colorScheme.tertiary;
  Color get onTertiary => _themeData.colorScheme.onTertiary;
  Color get tertiaryContainer => _themeData.colorScheme.tertiaryContainer;
  Color get onTertiaryContainer => _themeData.colorScheme.onTertiaryContainer;
  Color get error => _themeData.colorScheme.error;
  Color get onError => _themeData.colorScheme.onError;
  Color get errorContainer => _themeData.colorScheme.errorContainer;
  Color get onErrorContainer => _themeData.colorScheme.onErrorContainer;
  Color get surface => _themeData.colorScheme.surface;
  Color get onSurface => _themeData.colorScheme.onSurface;
  Color get surfaceContainerHighest =>
      _themeData.colorScheme.surfaceContainerHighest;
  Color get onSurfaceVariant => _themeData.colorScheme.onSurfaceVariant;
  Color get outline => _themeData.colorScheme.outline;
  Color get outlineVariant => _themeData.colorScheme.outlineVariant;
  Color get shadow => _themeData.colorScheme.shadow;
  Color get scrim => _themeData.colorScheme.scrim;
  Color get inverseSurface => _themeData.colorScheme.inverseSurface;
  Color get onInverseSurface => _themeData.colorScheme.onInverseSurface;
  Color get inversePrimary => _themeData.colorScheme.inversePrimary;
  Color get surfaceTint => _themeData.colorScheme.surfaceTint;

  LinearGradient get brandPrimaryGradient => LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

extension ThemesExtension on BuildContext {
  AppColors get appColors => AppColors.of(this);

  AppTextStyles get appTextStyles => AppTextStyles.of(this);

  AppTextStyles appTextStylesWithColor(Function(AppColors appColors) getColor) {
    return appTextStyles.copyWith(color: getColor(appColors));
  }
}

extension HexColor on Color {
  static Color formHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst("#", ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
