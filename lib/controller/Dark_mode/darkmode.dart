import 'package:crm/cache/cache.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  final RxBool _isDark = false.obs;

  bool get isDark => _isDark.value;
  ThemeMode get themeMode => isDark ? ThemeMode.dark : ThemeMode.light;

  @override
  void onInit() {
    // Read from SharedPreferences using your Cache helper
    final storedValue = Cache.getdata(key: "isDarkMode");
    _isDark.value = storedValue ?? false;
    super.onInit();
  }

  void toggleTheme() {
    _isDark.value = !_isDark.value;

    // Save using your Cache class
    Cache.saveData(key: "isDarkMode", value: _isDark.value);

    // Update the UI theme
    Get.changeThemeMode(themeMode);
  }
}
