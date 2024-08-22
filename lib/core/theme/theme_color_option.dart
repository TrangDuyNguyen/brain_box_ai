import 'package:flutter/material.dart';

class ThemeColorOption {
  final int id;
  final String name;
  final Color primary;
  final Color secondary;

  const ThemeColorOption({
    required this.id,
    required this.name,
    required this.primary,
    required this.secondary,
  });
}

final List<ThemeColorOption> themeColorOptions = [
  const ThemeColorOption(
    id: 0,
    name: 'Gentle',
    primary: Color(0xffa8d5ba), // Purple
    secondary: Color(0xfff2c94c), // Teal
  ),
  const ThemeColorOption(
    id: 1,
    name: 'Purple Teal',
    primary: Color(0xff6200ea), // Purple
    secondary: Color(0xff03dac6), // Teal
  ),
  const ThemeColorOption(
    id: 2,
    name: 'Light Blue Lime',
    primary: Color(0xff03a9f4), // Light Blue
    secondary: Color(0xffcddc39), // Lime
  ),
  const ThemeColorOption(
    id: 3,
    name: 'Pink Amber',
    primary: Color(0xffe91e63), // Pink
    secondary: Color(0xffffc107), // Amber
  ),
  const ThemeColorOption(
    id: 4,
    name: 'Light Green Deep Orange',
    primary: Color(0xff8bc34a), // Light Green
    secondary: Color(0xffff5722), // Deep Orange
  ),
  const ThemeColorOption(
    id: 5,
    name: 'Blue Red',
    primary: Color(0xff2196f3), // Blue// Dark Blue
    secondary: Color(0xfff44336), // Red
  ),
  const ThemeColorOption(
    id: 6,
    name: 'Orange Blue Grey',
    primary: Color(0xffff9800), // Orange
    secondary: Color(0xff607d8b), // Blue Grey
  ),
  const ThemeColorOption(
    id: 7,
    name: 'Deep Purple Yellow',
    primary: Color(0xff673ab7), // Deep Purple
    secondary: Color(0xffffeb3b), // Yellow
  ),
  const ThemeColorOption(
    id: 8,
    name: 'Green Purple',
    primary: Color(0xff4caf50), // Green
    secondary: Color(0xff9c27b0), // Purple
  ),
  const ThemeColorOption(
    id: 9,
    name: 'Teal Brown',
    primary: Color(0xff009688), // Teal
    secondary: Color(0xff795548), // Brown
  ),
];

ThemeData createTheme(ThemeColorOption selectedTheme, bool isDarkTheme) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: selectedTheme.primary,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
    ).copyWith(
      secondary: selectedTheme.secondary,  // Set the secondary color
    ),
    useMaterial3: true,
  );
}
