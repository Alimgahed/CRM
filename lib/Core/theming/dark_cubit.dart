// lib/features/theme/theme_cubit.dart
import 'package:crm/Core/helpers/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static const String _themeKey = 'app_theme_mode';

  ThemeCubit() : super(ThemeMode.light) {
    _loadTheme();
  }

  /// Load saved theme from SharedPreferences
  Future<void> _loadTheme() async {
    try {
      final savedTheme = await SharedPreferencesHelper.getData<String>(
        _themeKey,
      );

      if (savedTheme != null) {
        final themeMode = _stringToThemeMode(savedTheme);
        emit(themeMode);
        debugPrint('✅ Loaded theme: $savedTheme');
      } else {
        debugPrint('ℹ️ No saved theme found, using default (light)');
      }
    } catch (e) {
      debugPrint('❌ Error loading theme: $e');
    }
  }

  /// Toggle between light and dark theme
  Future<void> toggleTheme() async {
    final newMode = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await _saveAndEmitTheme(newMode);
  }

  /// Set specific theme mode
  Future<void> setTheme(ThemeMode mode) async {
    await _saveAndEmitTheme(mode);
  }

  /// Save theme to SharedPreferences and emit new state
  Future<void> _saveAndEmitTheme(ThemeMode mode) async {
    try {
      final themeString = _themeModeToString(mode);
      final success = await SharedPreferencesHelper.saveData(
        _themeKey,
        themeString,
      );

      if (success) {
        emit(mode);
        debugPrint('✅ Theme saved and applied: $themeString');
      } else {
        debugPrint('❌ Failed to save theme');
      }
    } catch (e) {
      debugPrint('❌ Error saving theme: $e');
    }
  }

  /// Convert ThemeMode to String for storage
  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }

  /// Convert String to ThemeMode
  ThemeMode _stringToThemeMode(String mode) {
    switch (mode.toLowerCase()) {
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      case 'light':
      default:
        return ThemeMode.light;
    }
  }

  /// Check if current theme is dark
  bool get isDarkMode => state == ThemeMode.dark;

  /// Check if current theme is light
  bool get isLightMode => state == ThemeMode.light;

  /// Check if using system theme
  bool get isSystemMode => state == ThemeMode.system;
}
