import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferencesHelper._();

  static Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  static Future<bool> saveData<T>(String key, T value) async {
    debugPrint('Saving data: $key = $value');

    final prefs = await _prefs;

    if (value is String) return prefs.setString(key, value);
    if (value is int) return prefs.setInt(key, value);
    if (value is bool) return prefs.setBool(key, value);
    if (value is double) return prefs.setDouble(key, value);
    if (value is List<String>) return prefs.setStringList(key, value);

    debugPrint('❌ Unsupported type for key: $key');
    return false;
  }

  /// Read data
  static Future<T?> getData<T>(String key) async {
    final prefs = await _prefs;

    return prefs.get(key) as T?;
  }

  /// Remove specific key
  static Future<bool> removeData(String key) async {
    debugPrint('Removing data for key: $key');
    final prefs = await _prefs;
    return prefs.remove(key);
  }

  /// Clear all keys
  static Future<bool> clearAllData() async {
    debugPrint('Clearing all shared preferences data');
    final prefs = await _prefs;
    return prefs.clear();
  }
  static setSecureString(String key, String value) async {
    final flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.write(key: key, value: value);
  }
  static  getSecureString(String key) async {
    final flutterSecureStorage = FlutterSecureStorage();
    return await flutterSecureStorage.read(key: key)??'';
  }
  static deleteSecureString(String key) async {
    final flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.delete(key: key);
  }
}
