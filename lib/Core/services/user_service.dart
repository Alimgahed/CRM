import 'package:crm/Core/helpers/shared_preference_contatnt.dart';
import 'package:crm/Core/helpers/shared_preferences.dart';
import 'package:crm/constant/app_permissions/permissions.dart';
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
  int? get userId => _currentUser?.id;

  /// Get user name
  String? get userName => _currentUser?.fullName;

  /// Get user email
  String? get userEmail => _currentUser?.email;

  /// Get company ID
  int? get companyId => _currentUser?.companyId;

  /// Check if super admin
  bool get isSuperAdmin =>
      _currentUser?.permissions?.containsKey(AppPermissions.superAdmin) ??
      false;

  /// Check if system admin
  bool get isSysAdmin =>
      _currentUser?.permissions?.containsKey(AppPermissions.sysAdmin) ?? false;

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
        debugPrint('📋 Permissions: ${_currentUser?.permissions}');
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

  // ==================== PERMISSION CHECKS ====================

  /// Check if user has specific permission
  bool hasPermission(String permission) {
    if (_currentUser == null) return false;
    return _currentUser!.hasPermission(permission);
  }

  /// Check multiple permissions (user must have ALL)

  /// Check multiple permissions (user must have ANY)
  bool hasAnyPermission(List<String> permissions) {
    if (_currentUser == null) return false;
    return _currentUser!.permissions!.keys.any(
      (key) => permissions.contains(key),
    );
  }

  // ==================== MODULE-SPECIFIC PERMISSIONS ====================

  // Users
  bool get canViewUsers => hasPermission(AppPermissions.viewUser);
  bool get canCreateUsers => hasPermission(AppPermissions.createUser);
  bool get canUpdateUsers => hasPermission(AppPermissions.updateUser);
  bool get canDeleteUsers => hasPermission(AppPermissions.deleteUser);
  bool get canManageUsers => hasAnyPermission([
    AppPermissions.createUser,
    AppPermissions.updateUser,
    AppPermissions.deleteUser,
  ]);

  // Projects
  bool get canViewProjects => hasPermission(AppPermissions.viewProject);
  bool get canCreateProjects => hasPermission(AppPermissions.createProject);
  bool get canUpdateProjects => hasPermission(AppPermissions.updateProject);
  bool get canDeleteProjects => hasPermission(AppPermissions.deleteProject);
  bool get canManageProjects => hasAnyPermission([
    AppPermissions.createProject,
    AppPermissions.updateProject,
    AppPermissions.deleteProject,
  ]);

  // Leads
  bool get canViewLeads => hasPermission(AppPermissions.viewLead);
  bool get canCreateLeads => hasPermission(AppPermissions.createLead);
  bool get canUpdateLeads => hasPermission(AppPermissions.updateLead);
  bool get canDeleteLeads => hasPermission(AppPermissions.deleteLead);
  bool get canManageLeads => hasAnyPermission([
    AppPermissions.createLead,
    AppPermissions.updateLead,
    AppPermissions.deleteLead,
  ]);

  // Customers
  bool get canViewCustomers => hasPermission(AppPermissions.viewCustomer);
  bool get canCreateCustomers => hasPermission(AppPermissions.createCustomer);
  bool get canUpdateCustomers => hasPermission(AppPermissions.updateCustomer);
  bool get canDeleteCustomers => hasPermission(AppPermissions.deleteCustomer);

  // Sales
  bool get canViewSales => hasPermission(AppPermissions.viewSale);
  bool get canCreateSales => hasPermission(AppPermissions.createSale);
  bool get canUpdateSales => hasPermission(AppPermissions.updateSale);
  bool get canDeleteSales => hasPermission(AppPermissions.deleteSale);

  // Rentals
  bool get canViewRentals => hasPermission(AppPermissions.viewRental);
  bool get canCreateRentals => hasPermission(AppPermissions.createRental);
  bool get canUpdateRentals => hasPermission(AppPermissions.updateRental);
  bool get canDeleteRentals => hasPermission(AppPermissions.deleteRental);

  // Units
  bool get canViewUnits => hasPermission(AppPermissions.viewUnit);
  bool get canCreateUnits => hasPermission(AppPermissions.createUnit);
  bool get canUpdateUnits => hasPermission(AppPermissions.updateUnit);
  bool get canDeleteUnits => hasPermission(AppPermissions.deleteUnit);

  // Tasks
  bool get canViewTasks => hasPermission(AppPermissions.viewTask);
  bool get canCreateTasks => hasPermission(AppPermissions.createTask);
  bool get canUpdateTasks => hasPermission(AppPermissions.updateTask);
  bool get canDeleteTasks => hasPermission(AppPermissions.deleteTask);

  // ==================== USER MANAGEMENT ====================

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
    await SharedPreferencesHelper.deleteSecureString(
      SharedPreferenceKeys.refreshToken,
    );
    debugPrint('✅ User cleared');
  }

  /// Get token
  Future<String> getToken() async {
    return await SharedPreferencesHelper.getSecureString(
      SharedPreferenceKeys.userToken,
    );
  }

  /// Get refresh token
  Future<String> getRefreshToken() async {
    return await SharedPreferencesHelper.getSecureString(
      SharedPreferenceKeys.refreshToken,
    );
  }

  /// Save tokens
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

  /// Check if user can access a route/screen
  bool canAccessRoute(String route) {
    // Map routes to permissions
    final routePermissions = {
      '/users': AppPermissions.viewUser,
      '/projects': AppPermissions.viewProject,
      '/leads': AppPermissions.viewLead,
      '/customers': AppPermissions.viewCustomer,
      '/sales': AppPermissions.viewSale,
      '/rentals': AppPermissions.viewRental,
      '/units': AppPermissions.viewUnit,
      '/tasks': AppPermissions.viewTask,
    };

    final permission = routePermissions[route];
    if (permission == null) return true; // No permission required
    return hasPermission(permission);
  }
}
