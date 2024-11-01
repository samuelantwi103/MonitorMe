// ../../washking/washking/lib/themes/theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      dynamicSchemeVariant: DynamicSchemeVariant.content,
      seedColor:const Color(0xFF1DD341),
    ),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.bebasNeue(),
        //  color: Colors.transparent,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    ),
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
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.bebasNeue(),
      // color: Colors.transparent,
      
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    ),
    snackBarTheme: const SnackBarThemeData(
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
    ));
