import 'package:crm/constant/colors.dart';
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
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        titleTextStyle: TextStyle(color: appColor, fontSize: 22),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: appColor, // Set CircularProgressIndicator color here
      ),
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
    );
  }
}