// Light and dark ColorSchemes made by FlexColorScheme v7.3.1.
// These ColorScheme objects require Flutter 3.7 or later.
import 'package:flutter/material.dart';

const ColorScheme flexSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff212121), // Adjusted to a darker gray
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffe0e0e0), // Lighter gray for containers
  onPrimaryContainer: Color(0xff212121),
  secondary: Color(0xff616161), // Secondary dark gray
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffbdbdbd), // Light gray for secondary containers
  onSecondaryContainer: Color(0xff212121),
  tertiary: Color(0xff757575), // Tertiary gray
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xffe0e0e0), // Light gray for tertiary containers
  onTertiaryContainer: Color(0xff212121),
  error: Color(0xffd32f2f),
  onError: Color(0xffffffff),
  errorContainer: Color(0xfff9bdbb), // Light red for error containers
  onErrorContainer: Color(0xff212121),
  surface: Color(0xfffafafa), // Light surface
  onSurface: Color(0xff212121),
  surfaceContainerHighest:
      Color(0xfff5f5f5), // Very light gray for high contrast
  onSurfaceVariant: Color(0xff616161),
  outline: Color(0xffbdbdbd),
  outlineVariant: Color(0xffe0e0e0),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff212121),
  onInverseSurface: Color(0xfffafafa),
  inversePrimary: Color(0xffbdbdbd),
  surfaceTint: Color(0xff212121),
);

const ColorScheme flexSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff1e1e1e), // Màu nền chính tối
  onPrimary: Color(0xffffffff), // Màu chữ trên nền chính
  primaryContainer: Color(0xff333333), // Màu nền cho các thành phần chứa
  onPrimaryContainer: Color(0xffffffff), // Màu chữ trên các thành phần chứa
  secondary: Color(0xff424242), // Màu phụ tối
  onSecondary: Color(0xffffffff), // Màu chữ trên nền phụ
  secondaryContainer: Color(0xff616161), // Màu nền cho các thành phần chứa phụ
  onSecondaryContainer: Color(0xffffffff), // Màu chữ trên các thành phần chứa phụ
  tertiary: Color(0xff757575), // Màu thứ ba tối
  onTertiary: Color(0xffffffff), // Màu chữ trên nền thứ ba
  tertiaryContainer: Color(0xff9e9e9e), // Màu nền cho các thành phần chứa thứ ba
  onTertiaryContainer: Color(0xff000000), // Màu chữ trên các thành phần chứa thứ ba
  error: Color(0xffd32f2f), // Màu lỗi
  onError: Color(0xffffffff), // Màu chữ trên nền lỗi
  errorContainer: Color(0xffb00020), // Màu nền cho các thành phần chứa lỗi
  onErrorContainer: Color(0xffffb4ab), // Màu chữ trên các thành phần chứa lỗi
  surface: Color(0xff121212), // Màu nền bề mặt
  onSurface: Color(0xffe0e0e0), // Màu chữ trên nền bề mặt
  surfaceContainerHighest: Color(0xff1f1f1f), // Màu nền cho các thành phần chứa bề mặt
  onSurfaceVariant: Color(0xff616161), // Màu chữ trên các biến thể bề mặt
  outline: Color(0xffbdbdbd), // Màu đường viền
  outlineVariant: Color(0xff43474e), // Biến thể màu đường viền
  shadow: Color(0xff000000), // Màu bóng
  scrim: Color(0xff000000), // Màu mờ
  inverseSurface: Color(0xffe0e0e0), // Màu bề mặt ngược lại
  onInverseSurface: Color(0xff121212), // Màu chữ trên bề mặt ngược lại
  inversePrimary: Color(0xffbb86fc), // Màu chính ngược lại
  surfaceTint: Color(0xffbb86fc), // Màu tint bề mặt
);
