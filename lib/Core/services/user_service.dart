import 'package:crm/Core/helpers/shared_preference_contatnt.dart';
import 'package:crm/Core/helpers/shared_preferences.dart';
import 'package:crm/features/auth/login/data/model/users_model.dart';
import 'package:flutter/material.dart';

class UserService {
  // Singleton instance
  static final UserService _instance = UserService._internal();
  factory UserService() => _instance;
  UserService._internal();

  // Cached user - accessible throughout the app
  UsersModel? _currentUser;

  /// Get current user (from memory)
  UsersModel? get currentUser => _currentUser;

  /// Check if user is logged in
  bool get isLoggedIn => _currentUser != null;

  /// Get user ID
  String? get userId => _currentUser?.userId;

  /// Get user name
  String? get userName => _currentUser?.fullName;

  /// Get user email
  String? get userEmail => _currentUser?.email;

  /// Get company ID
  String? get companyId => _currentUser?.companyId;

  /// Initialize - Load user from storage on app start
  Future<void> init() async {
    await loadUser();
    await getToken();
  }

  /// Load user from storage
  Future<UsersModel?> loadUser() async {
    try {
      final json = await SharedPreferencesHelper.getJson(
        SharedPreferenceKeys.user,
      );

      if (json != null) {
        _currentUser = UsersModel.fromJson(json);
        debugPrint('✅ User loaded: ${_currentUser?.fullName}');
        return _currentUser;
      }
    } catch (e) {
      debugPrint('❌ Error loading user: $e');
    }
    return null;
  }

  /// Save user to memory and storage
  Future<void> saveUser(UsersModel user) async {
    _currentUser = user;
    await SharedPreferencesHelper.saveJson(
      SharedPreferenceKeys.user,
      user.toJson(),
    );
    debugPrint('✅ User saved: ${user.fullName}');
  }

  /// Check if user has specific permission
  bool hasPermission(String permission) {
    return _currentUser?.hasPermission(permission) ?? false;
  }

  /// Check multiple permissions (user must have ALL)
  bool hasAllPermissions(List<String> permissions) {
    if (_currentUser == null) return false;
    return permissions.every((p) => _currentUser!.hasPermission(p));
  }

  /// Check multiple permissions (user must have ANY)
  bool hasAnyPermission(List<String> permissions) {
    if (_currentUser == null) return false;
    return permissions.any((p) => _currentUser!.hasPermission(p));
  }

  /// Update user data
  Future<void> updateUser(UsersModel user) async {
    await saveUser(user);
  }

  /// Clear user (logout)
  Future<void> clearUser() async {
    _currentUser = null;
    await SharedPreferencesHelper.removeData(SharedPreferenceKeys.user);
    await SharedPreferencesHelper.deleteSecureString(
      SharedPreferenceKeys.userToken,
    );
    debugPrint('✅ User cleared');
  }

  /// Get token
  Future<String> getToken() async {
    return await SharedPreferencesHelper.getSecureString(
      SharedPreferenceKeys.userToken,
    );
  }

  /// Save token
  Future<void> saveToken(String token, String refreshToken) async {
    await SharedPreferencesHelper.setSecureString(
      SharedPreferenceKeys.userToken,
      token,
    );
    await SharedPreferencesHelper.setSecureString(
      SharedPreferenceKeys.refreshToken,
      refreshToken,
    );
  }
}
