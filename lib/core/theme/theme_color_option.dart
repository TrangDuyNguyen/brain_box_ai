import 'package:flutter/material.dart';

import 'color_scheme.dart';

class ThemeColorOption {
  final int id;
  final String name;
  final ThemeData themeDataLight;
  final ThemeData themeDataDark;

  const ThemeColorOption({
    required this.id,
    required this.name,
    required this.themeDataLight,
    required this.themeDataDark,
  });
}

final List<ThemeColorOption> themeColorOptions = [
  ThemeColorOption(
    id: 0,
    name: 'Gentle',
    themeDataLight:
        ThemeData(useMaterial3: true, colorScheme: lightGentleScheme),
    themeDataDark:
        ThemeData(useMaterial3: true, colorScheme: darkGentleScheme), // Teal
  ),
  ThemeColorOption(
    id: 1,
    name: 'Lavender',
    themeDataLight:
        ThemeData(useMaterial3: true, colorScheme: lightLavenderScheme),
    themeDataDark:
        ThemeData(useMaterial3: true, colorScheme: darkLavenderScheme), // Teal
  ),
  ThemeColorOption(
    id: 2,
    name: 'Mint',
    themeDataLight:
        ThemeData(useMaterial3: true, colorScheme: lightMintScheme),
    themeDataDark:
        ThemeData(useMaterial3: true, colorScheme: darkMintScheme), // Teal
  ),
  ThemeColorOption(
    id: 3,
    name: 'Coral',
    themeDataLight:
    ThemeData(useMaterial3: true, colorScheme: lightCoralScheme),
    themeDataDark:
    ThemeData(useMaterial3: true, colorScheme: darkCoralScheme), // Teal
  ),
];
