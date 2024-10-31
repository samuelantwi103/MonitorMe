// ../../washking/washking/lib/themes/theme.dart
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      dynamicSchemeVariant: DynamicSchemeVariant.content,
      seedColor:const Color(0xFF1DD341),
    ),
    useMaterial3: true,
    snackBarTheme:const SnackBarThemeData(
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
    ));

ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      dynamicSchemeVariant: DynamicSchemeVariant.content,
      seedColor:const Color(0xFF1DD341),
      // tertiary: Color(0xffcf5500),
      brightness: Brightness.dark,
    ),
    brightness: Brightness.dark,
    useMaterial3: true,
    snackBarTheme: const SnackBarThemeData(
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
    ));
