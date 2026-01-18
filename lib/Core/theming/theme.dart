import 'package:crm/Core/theming/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // =======================
  // Light Theme
  // =======================
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.white,
      fontFamily: 'Alexandria',

      // Color scheme
      colorScheme: const ColorScheme.light(
        primary: appColor,
        surface: Colors.white,
        onPrimary: Colors.black,
      ),

      // Icons
      iconTheme: IconThemeData(color: appColor),
      primaryIconTheme: IconThemeData(color: appColor),

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        titleTextStyle: TextStyle(
          color: appColor,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: appColor),
        elevation: 0,
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(color: appColor),

      // Text
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black87),
        bodyMedium: TextStyle(color: Colors.black54),
        bodySmall: TextStyle(color: Colors.black45),
      ),

      brightness: Brightness.light,
      primarySwatch: Colors.blue,
    );
  }

  // =======================
  // Dark Theme
  // =======================
  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: darkColor,
      primaryColor: darkColor2,
      fontFamily: 'Alexandria',

      colorScheme: ColorScheme.dark(
        primary: appColor,
        surface: darkColor2,
        onPrimary: Colors.white,
        onSurface: Colors.white70,
      ),

      // Icons
      iconTheme: IconThemeData(color: appColor),
      primaryIconTheme: IconThemeData(color: appColor),

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: darkColor2,
        surfaceTintColor: darkColor2,
        titleTextStyle: TextStyle(
          color: appColor,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: appColor),
        elevation: 0,
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(color: appColor),

      // Card
      cardTheme: CardThemeData(color: containerColor, elevation: 2),

      // Input fields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: containerColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),

      // Text
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white70),
        bodySmall: TextStyle(color: Colors.white60),
      ),

      // Divider
      dividerTheme: DividerThemeData(color: Colors.white24, thickness: 1),

      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
    );
  }
}

class AppDecorations {
  static const BoxDecoration lightContainer = BoxDecoration(
    color: containerColor,
    borderRadius: BorderRadius.all(Radius.circular(12)),
    boxShadow: [
      BoxShadow(
        color: Color(0x1A000000), // black with 0.1 opacity
        blurRadius: 8,
        offset: Offset(0, 2),
      ),
    ],
  );

  static const BoxDecoration darkContainer = BoxDecoration(
    color: darkFieldColor,
    borderRadius: BorderRadius.all(Radius.circular(12)),
    boxShadow: [
      BoxShadow(
        color: darkColor, // black with 0.4 opacity
        blurRadius: 8,
        offset: Offset(0, 2),
      ),
    ],
  );
}
