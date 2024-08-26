// Light and dark ColorSchemes made by FlexColorScheme v7.3.1.
// These ColorScheme objects require Flutter 3.7 or later.
import 'package:flutter/material.dart';

const ColorScheme lightGentleScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xffa8d5ba), // Xanh nhạt nhẹ nhàng
  onPrimary: Color(0xff1b1b1b), // Màu chữ trên nền chính
  primaryContainer: Color(0xffd7f5e0), // Màu chứa nhẹ cho các thành phần
  onPrimaryContainer:
      Color(0xff1b3d2f), // Màu chữ trên các thành phần chứa chính
  secondary: Color(0xfff2c94c), // Màu vàng nhẹ tươi sáng
  onSecondary: Color(0xff1b1b1b), // Màu chữ trên nền phụ
  secondaryContainer:
      Color(0xfffff4d1), // Màu nền nhẹ nhàng cho các thành phần chứa phụ
  onSecondaryContainer:
      Color(0xff4f3b01), // Màu chữ trên các thành phần chứa phụ
  tertiary: Color(0xfff7bfb4), // Màu hồng phấn nhạt
  onTertiary: Color(0xff1b1b1b), // Màu chữ trên nền thứ ba
  tertiaryContainer:
      Color(0xffffe5e0), // Màu nền nhẹ cho các thành phần chứa thứ ba
  onTertiaryContainer:
      Color(0xff5c1f19), // Màu chữ trên các thành phần chứa thứ ba
  error: Color(0xffcf6679), // Màu lỗi nhạt
  onError: Color(0xffffffff), // Màu chữ trên nền lỗi
  errorContainer: Color(0xffffdde1), // Màu nền lỗi nhẹ
  onErrorContainer: Color(0xff690005), // Màu chữ trên các thành phần chứa lỗi
  surface: Color(0xfffefefe), // Màu bề mặt nhẹ nhàng
  onSurface: Color(0xff1b1b1b), // Màu chữ trên bề mặt
  surfaceContainerHighest: Color(0xffeceff1), // Màu bề mặt biến thể sáng dịu
  onSurfaceVariant: Color(0xff4a4a4a), // Màu chữ trên bề mặt biến thể
  outline: Color(0xffc1c1c1), // Màu đường viền nhẹ
  shadow: Color(0xff000000), // Màu bóng
  scrim: Color(0xff000000), // Màu mờ
  inverseSurface: Color(0xff1b1b1b), // Màu bề mặt ngược lại
  onInverseSurface: Color(0xfffefefe), // Màu chữ trên bề mặt ngược lại
  inversePrimary: Color(0xff4a7a64), // Màu chính ngược lại
  surfaceTint: Color(0xffa8d5ba), // Màu tint bề mặt
);

const ColorScheme darkGentleScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff4a7a64), // Xanh đậm nhưng vẫn nhẹ nhàng
  onPrimary: Color(0xfff1f1f1), // Màu chữ sáng trên nền chính
  primaryContainer: Color(0xff2e4d3e), // Màu nền cho các thành phần chứa chính
  onPrimaryContainer:
      Color(0xffd7f5e0), // Màu chữ trên các thành phần chứa chính
  secondary: Color(0xffcda454), // Màu vàng ấm áp cho nền phụ
  onSecondary: Color(0xff1b1b1b), // Màu chữ tối trên nền phụ
  secondaryContainer: Color(0xff7f6433), // Màu nền chứa phụ nhẹ nhàng
  onSecondaryContainer:
      Color(0xfffff4d1), // Màu chữ trên các thành phần chứa phụ
  tertiary: Color(0xffb4837c), // Màu hồng nhạt đậm
  onTertiary: Color(0xff1b1b1b), // Màu chữ tối trên nền thứ ba
  tertiaryContainer: Color(0xff6e433b), // Màu nền chứa thứ ba nhẹ nhàng
  onTertiaryContainer:
      Color(0xffffe5e0), // Màu chữ trên các thành phần chứa thứ ba
  error: Color(0xffcf6679), // Màu lỗi nhạt
  onError: Color(0xff1b1b1b), // Màu chữ trên nền lỗi
  errorContainer: Color(0xff8a1a2b), // Màu nền lỗi đậm hơn
  onErrorContainer: Color(0xffffdde1), // Màu chữ trên nền chứa lỗi
  surface: Color(0xff121212), // Màu bề mặt tối dịu
  onSurface: Color(0xffe0e0e0), // Màu chữ trên bề mặt tối
  surfaceContainerHighest: Color(0xff2e2e2e), // Màu bề mặt biến thể nhẹ nhàng
  onSurfaceVariant: Color(0xffb0b0b0), // Màu chữ trên bề mặt biến thể
  outline: Color(0xff707070), // Màu đường viền tối nhẹ
  shadow: Color(0xff000000), // Màu bóng
  scrim: Color(0xff000000), // Màu mờ
  inverseSurface: Color(0xffe0e0e0), // Màu bề mặt ngược lại
  onInverseSurface: Color(0xff1b1b1b), // Màu chữ trên bề mặt ngược lại
  inversePrimary: Color(0xffa8d5ba), // Màu chính ngược lại
  surfaceTint: Color(0xff4a7a64), // Màu tint bề mặt
);

const ColorScheme lightLavenderScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xffd1c4e9), // Lavender nhạt
  onPrimary: Color(0xff1b1b1b), // Màu chữ tối trên nền chính
  primaryContainer: Color(0xffede7f6), // Màu nền nhẹ nhàng
  onPrimaryContainer: Color(0xff4a3e7a), // Màu chữ trên các thành phần chứa chính
  secondary: Color(0xffffb74d), // Cam vàng nhẹ
  onSecondary: Color(0xff1b1b1b), // Màu chữ tối trên nền phụ
  secondaryContainer: Color(0xffffe0b2), // Màu nền phụ dịu
  onSecondaryContainer: Color(0xff7a4d2e), // Màu chữ trên các thành phần phụ
  tertiary: Color(0xfff8bbd0), // Hồng pastel
  onTertiary: Color(0xff1b1b1b), // Màu chữ tối
  tertiaryContainer: Color(0xffffe3f0), // Màu nền thứ ba nhẹ nhàng
  onTertiaryContainer: Color(0xff7a4a5b), // Màu chữ trên các thành phần chứa thứ ba
  error: Color(0xfff44336), // Màu lỗi đỏ
  onError: Color(0xffffffff), // Màu chữ sáng trên nền lỗi
  surface: Color(0xfffefefe), // Màu bề mặt trắng
  onSurface: Color(0xff1b1b1b), // Màu chữ trên bề mặt
  surfaceContainerHighest: Color(0xffeceff1), // Màu bề mặt nhẹ nhàng
  onSurfaceVariant: Color(0xff4a4a4a), // Màu chữ trên biến thể bề mặt
  inverseSurface: Color(0xff1b1b1b), // Màu bề mặt ngược lại
  onInverseSurface: Color(0xfffefefe), // Màu chữ trên bề mặt ngược lại
  outline: Color(0xffc1c1c1), // Màu viền nhẹ
  shadow: Color(0xff000000), // Màu bóng
  surfaceTint: Color(0xffd1c4e9), // Màu tint bề mặt
);

const ColorScheme darkLavenderScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff4a3e7a), // Lavender đậm
  onPrimary: Color(0xfff1f1f1), // Màu chữ sáng
  primaryContainer: Color(0xff332d4d), // Màu nền tối hơn cho các thành phần chính
  onPrimaryContainer: Color(0xffd1c4e9), // Màu chữ trên nền chứa chính
  secondary: Color(0xffffab40), // Cam vàng đậm
  onSecondary: Color(0xff1b1b1b), // Màu chữ tối
  secondaryContainer: Color(0xff7a4d2e), // Màu nền tối nhẹ
  onSecondaryContainer: Color(0xffffe0b2), // Màu chữ trên nền chứa phụ
  tertiary: Color(0xff7a4a5b), // Hồng đậm
  onTertiary: Color(0xff1b1b1b), // Màu chữ tối
  tertiaryContainer: Color(0xff5e3a45), // Màu nền chứa thứ ba đậm
  onTertiaryContainer: Color(0xffffe3f0), // Màu chữ trên nền chứa thứ ba
  error: Color(0xffd32f2f), // Màu lỗi đỏ đậm
  onError: Color(0xff1b1b1b), // Màu chữ tối trên nền lỗi
  surface: Color(0xff121212), // Màu bề mặt tối
  onSurface: Color(0xffe0e0e0), // Màu chữ trên bề mặt tối
  surfaceContainerHighest: Color(0xff2e2e2e), // Màu biến thể tối
  onSurfaceVariant: Color(0xffb0b0b0), // Màu chữ trên biến thể tối
  inverseSurface: Color(0xffe0e0e0), // Bề mặt ngược lại sáng
  onInverseSurface: Color(0xff1b1b1b), // Chữ trên bề mặt ngược lại tối
  outline: Color(0xff707070), // Viền tối nhẹ
  shadow: Color(0xff000000), // Bóng
  surfaceTint: Color(0xff4a3e7a), // Tint bề mặt
);

const ColorScheme lightMintScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xffb2dfdb), // Xanh mint nhạt
  onPrimary: Color(0xff1b1b1b), // Chữ tối trên nền chính
  primaryContainer: Color(0xffe0f2f1), // Nền nhẹ nhàng cho thành phần chứa chính
  onPrimaryContainer: Color(0xff004d40), // Chữ tối trên thành phần chứa chính
  secondary: Color(0xffffcc80), // Màu vàng nhạt
  onSecondary: Color(0xff1b1b1b), // Chữ tối trên nền phụ
  secondaryContainer: Color(0xffffe0b2), // Nền nhẹ cho phụ
  onSecondaryContainer: Color(0xff7a4d2e), // Chữ trên nền chứa phụ
  tertiary: Color(0xfff8bbd0), // Hồng pastel
  onTertiary: Color(0xff1b1b1b), // Chữ tối trên nền thứ ba
  tertiaryContainer: Color(0xffffe3f0), // Nền nhẹ nhàng cho thứ ba
  onTertiaryContainer: Color(0xff7a4a5b), // Chữ trên nền chứa thứ ba
  error: Color(0xfff44336), // Lỗi đỏ nhẹ
  onError: Color(0xffffffff), // Chữ sáng trên nền lỗi
  surface: Color(0xfffefefe), // Bề mặt trắng sáng
  onSurface: Color(0xff1b1b1b), // Chữ tối trên bề mặt
  surfaceContainerHighest: Color(0xffeceff1), // Bề mặt biến thể sáng
  onSurfaceVariant: Color(0xff4a4a4a), // Chữ trên biến thể bề mặt
  inverseSurface: Color(0xff1b1b1b), // Bề mặt ngược lại tối
  onInverseSurface: Color(0xfffefefe), // Chữ trên bề mặt ngược lại
  outline: Color(0xffc1c1c1), // Viền nhẹ
  shadow: Color(0xff000000), // Bóng tối
  surfaceTint: Color(0xffb2dfdb), // Tint bề mặt
);

const ColorScheme darkMintScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff004d40), // Xanh mint đậm
  onPrimary: Color(0xfff1f1f1), // Chữ sáng trên nền chính
  primaryContainer: Color(0xff00332c), // Nền tối cho các thành phần chính
  onPrimaryContainer: Color(0xffb2dfdb), // Chữ trên nền chứa chính
  secondary: Color(0xffcba865), // Màu vàng nhạt đậm
  onSecondary: Color(0xff1b1b1b), // Chữ tối trên nền phụ
  secondaryContainer: Color(0xff7a4d2e), // Nền tối nhẹ cho thành phần phụ
  onSecondaryContainer: Color(0xffffe0b2), // Chữ trên nền chứa phụ
  tertiary: Color(0xff7a4a5b), // Hồng pastel đậm
  onTertiary: Color(0xff1b1b1b), // Chữ tối trên nền thứ ba
  tertiaryContainer: Color(0xff5e3a45), // Nền tối nhẹ cho thứ ba
  onTertiaryContainer: Color(0xffffe3f0), // Chữ trên nền chứa thứ ba
  error: Color(0xffd32f2f), // Lỗi đỏ đậm
  onError: Color(0xff1b1b1b), // Chữ tối trên nền lỗi
  surface: Color(0xff121212), // Bề mặt tối dịu
  onSurface: Color(0xffe0e0e0), // Chữ trên bề mặt tối
  surfaceContainerHighest: Color(0xff2e2e2e), // Bề mặt biến thể tối
  onSurfaceVariant: Color(0xffb0b0b0), // Chữ trên biến thể tối
  inverseSurface: Color(0xffe0e0e0), // Bề mặt ngược lại sáng
  onInverseSurface: Color(0xff1b1b1b), // Chữ trên bề mặt ngược lại tối
  outline: Color(0xff707070), // Viền tối nhẹ
  shadow: Color(0xff000000), // Bóng
  surfaceTint: Color(0xff004d40), // Tint bề mặt
);

const ColorScheme lightCoralScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xffd64045), // Đỏ coral
  onPrimary: Color(0xffffffff), // Chữ sáng trên nền chính
  primaryContainer: Color(0xffffb3b5), // Nền chứa cho các thành phần chính
  onPrimaryContainer: Color(0xff410006), // Chữ trên nền chứa chính
  secondary: Color(0xfffdab89), // Cam nhẹ
  onSecondary: Color(0xff1b1b1b), // Chữ tối trên nền phụ
  secondaryContainer: Color(0xffffd6c0), // Nền chứa cho các thành phần phụ
  onSecondaryContainer: Color(0xff4f2a00), // Chữ trên nền chứa phụ
  tertiary: Color(0xff7b61a6), // Tím nhạt
  onTertiary: Color(0xffffffff), // Chữ sáng trên nền thứ ba
  tertiaryContainer: Color(0xffe6d4f1), // Nền chứa thứ ba
  onTertiaryContainer: Color(0xff2f174b), // Chữ trên nền chứa thứ ba
  error: Color(0xffba1a1a), // Màu lỗi đỏ nhạt
  onError: Color(0xffffffff), // Chữ sáng trên nền lỗi
  errorContainer: Color(0xffffdad6), // Nền lỗi nhẹ
  onErrorContainer: Color(0xff410002), // Chữ trên nền lỗi chứa
  surface: Color(0xfffefefe), // Bề mặt trắng sáng nhẹ nhàng
  onSurface: Color(0xff1b1b1b), // Chữ trên bề mặt
  surfaceContainerHighest: Color(0xffeceff1), // Bề mặt biến thể sáng
  onSurfaceVariant: Color(0xff4a4a4a), // Chữ trên bề mặt biến thể
  inverseSurface: Color(0xff1b1b1b), // Bề mặt ngược lại
  onInverseSurface: Color(0xfffefefe), // Chữ trên bề mặt ngược lại
  outline: Color(0xff9e9e9e), // Viền nhẹ nhàng
  shadow: Color(0xff000000), // Bóng tối
  scrim: Color(0xff000000), // Màu mờ
  surfaceTint: Color(0xffd64045), // Tint bề mặt đỏ coral
);

const ColorScheme darkCoralScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xffd64045), // Đỏ coral đậm
  onPrimary: Color(0xfff1f1f1), // Chữ sáng trên nền chính
  primaryContainer: Color(0xffa33031), // Nền tối cho các thành phần chính
  onPrimaryContainer: Color(0xffffb3b5), // Chữ trên nền chứa chính
  secondary: Color(0xfffdab89), // Màu cam nhạt dịu nhẹ
  onSecondary: Color(0xff1b1b1b), // Chữ tối trên nền phụ
  secondaryContainer: Color(0xffb76b4e), // Nền tối nhẹ cho thành phần phụ
  onSecondaryContainer: Color(0xffffd6c0), // Chữ trên nền chứa phụ
  tertiary: Color(0xff7b61a6), // Màu tím nhạt đậm
  onTertiary: Color(0xff1b1b1b), // Chữ tối trên nền thứ ba
  tertiaryContainer: Color(0xff593c77), // Nền tối nhẹ cho thứ ba
  onTertiaryContainer: Color(0xffe6d4f1), // Chữ trên nền chứa thứ ba
  error: Color(0xffd32f2f), // Lỗi đỏ đậm
  onError: Color(0xff1b1b1b), // Chữ tối trên nền lỗi
  surface: Color(0xff121212), // Bề mặt tối dịu
  onSurface: Color(0xffe0e0e0), // Chữ trên bề mặt tối
  surfaceContainerHighest: Color(0xff2e2e2e), // Bề mặt biến thể tối
  onSurfaceVariant: Color(0xffb0b0b0), // Chữ trên biến thể tối
  inverseSurface: Color(0xffe0e0e0), // Bề mặt ngược lại sáng
  onInverseSurface: Color(0xff1b1b1b), // Chữ trên bề mặt ngược lại tối
  outline: Color(0xff707070), // Viền tối nhẹ
  shadow: Color(0xff000000), // Bóng
  surfaceTint: Color(0xffd64045), // Tint bề mặt
);


