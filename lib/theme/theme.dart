import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  useMaterial3: true,
  colorScheme: colorTheme,
  applyElevationOverlayColor: false,
);

ColorScheme colorTheme = ColorScheme.light(
  primary: Colors.yellow.shade700,
  secondary: Colors.blueGrey.shade900,
  onSecondary: Colors.white,
  tertiary: Colors.green.shade700,
  onTertiary: Colors.white,
  surface: const Color(0xFFF1F1F1),
);
