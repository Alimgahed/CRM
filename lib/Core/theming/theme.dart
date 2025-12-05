import 'package:crm/Core/theming/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      // Default app color set to white
      scaffoldBackgroundColor: Colors.grey.shade100,

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

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: appColor, // Set CircularProgressIndicator color here
      ),

      brightness: Brightness.light,
      primarySwatch: Colors.blue,
    );
  }
}
