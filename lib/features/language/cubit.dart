// =============================================================
// LOCALE CUBIT - MANAGES APP LANGUAGE
// lib/core/localization/locale_cubit.dart
// =============================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// State
class LocaleState {
  final String locale;

  LocaleState(this.locale);
}

// Cubit
class LocaleCubit extends Cubit<LocaleState> {
  static const String _localeKey = 'app_locale';

  LocaleCubit() : super(LocaleState('ar')) {
    _loadLocale();
  }

  // Load saved locale from SharedPreferences
  Future<void> _loadLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedLocale = prefs.getString(_localeKey) ?? 'ar';
      emit(LocaleState(savedLocale));
    } catch (e) {
      emit(LocaleState('ar'));
    }
  }

  // Change locale
  Future<void> changeLocale(String locale) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_localeKey, locale);
      emit(LocaleState(locale));
    } catch (e) {
      print('Error saving locale: $e');
    }
  }

  // Toggle between Arabic and English
  Future<void> toggleLocale() async {
    final newLocale = state.locale == 'ar' ? 'en' : 'ar';
    await changeLocale(newLocale);
  }

  // Get current locale
  String get currentLocale => state.locale;

  // Check if Arabic
  bool get isArabic => state.locale == 'ar';
}
