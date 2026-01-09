import 'package:crm/Core/theming/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      // Default app color set to white
      scaffoldBackgroundColor: Colors.white,

      primaryColor: Colors.white,
      fontFamily: 'Alexandria',
      colorScheme: ColorScheme.light(
        primary: Colors.white,
        surface: Colors.white,
        onPrimary: Colors.black,
      ),

      // Icon color set to appColor
      iconTheme: IconThemeData(color: appColor),
      primaryIconTheme: IconThemeData(color: appColor),

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        titleTextStyle: TextStyle(color: appColor, fontSize: 22),
        iconTheme: IconThemeData(color: appColor),
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(color: appColor),

      brightness: Brightness.light,
      primarySwatch: Colors.blue,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      // Dark theme background
      scaffoldBackgroundColor: const Color(0xFF121212),

      primaryColor: const Color(0xFF1E1E1E),
      fontFamily: 'Alexandria',
      colorScheme: ColorScheme.dark(
        primary: appColor,
        surface: const Color(0xFF1E1E1E),
        onPrimary: Colors.white,
        onSurface: Colors.white,
      ),

      // Icon color set to appColor
      iconTheme: IconThemeData(color: appColor),
      primaryIconTheme: IconThemeData(color: appColor),

      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1E1E1E),
        surfaceTintColor: const Color(0xFF1E1E1E),
        titleTextStyle: TextStyle(color: appColor, fontSize: 22),
        iconTheme: IconThemeData(color: appColor),
        elevation: 0,
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(color: appColor),

      // Card theme for dark mode
      cardTheme: CardThemeData(color: const Color(0xFF1E1E1E), elevation: 2),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),

      // Text theme
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white70),
        bodySmall: TextStyle(color: Colors.white60),
      ),

      // Divider theme
      dividerTheme: DividerThemeData(color: Colors.white24, thickness: 1),

      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
    );
  }
}
