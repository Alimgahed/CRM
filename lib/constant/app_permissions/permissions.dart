class AppPermissions {
  AppPermissions._();

  // ==================== SYSTEM ROLES ====================
  static const String superAdmin = "super_admin";
  static const String sysAdmin = "sys_admin";

  // ==================== USERS ====================
  static const String viewUser = "users:view";
  static const String createUser = "users:create";
  static const String updateUser = "users:update";
  static const String deleteUser = "users:delete";

  // ==================== ROLES ====================
  static const String viewRole = "roles:view";
  static const String createRole = "roles:create";
  static const String updateRole = "roles:update";
  static const String deleteRole = "roles:delete";
  static const String assignRole = "roles:assign";

  // ==================== LEADS ====================
  static const String viewLead = "leads:view";
  static const String createLead = "leads:create";
  static const String updateLead = "leads:update";
  static const String deleteLead = "leads:delete";

  // ==================== CUSTOMERS ====================
  static const String viewCustomer = "customers:view";
  static const String createCustomer = "customers:create";
  static const String updateCustomer = "customers:update";
  static const String deleteCustomer = "customers:delete";

  // ==================== PROJECTS ====================
  static const String viewProject = "projects:view";
  static const String createProject = "projects:create";
  static const String updateProject = "projects:update";
  static const String deleteProject = "projects:delete";

  // ==================== UNITS ====================
  static const String viewUnit = "units:view";
  static const String createUnit = "units:create";
  static const String updateUnit = "units:update";
  static const String deleteUnit = "units:delete";

  // ==================== SALES ====================
  static const String viewSale = "sales:view";
  static const String createSale = "sales:create";
  static const String updateSale = "sales:update";
  static const String deleteSale = "sales:delete";

  // ==================== RENTALS ====================
  static const String viewRental = "rentals:view";
  static const String createRental = "rentals:create";
  static const String updateRental = "rentals:update";
  static const String deleteRental = "rentals:delete";

  // ==================== COLLECTIONS ====================
  static const String viewCollection = "collections:view";
  static const String createCollection = "collections:create";
  static const String updateCollection = "collections:update";
  static const String deleteCollection = "collections:delete";

  // ==================== COMPANIES ====================
  static const String viewCompany = "companies:view";
  static const String createCompany = "companies:create";
  static const String updateCompany = "companies:update";
  static const String deleteCompany = "companies:delete";

  // ==================== OWNERS ====================
  static const String viewOwner = "owners:view";
  static const String createOwner = "owners:create";
  static const String updateOwner = "owners:update";
  static const String deleteOwner = "owners:delete";

  // ==================== MAINTENANCE ====================
  static const String viewMaintenance = "maintenance:view";
  static const String createMaintenance = "maintenance:create";
  static const String updateMaintenance = "maintenance:update";
  static const String deleteMaintenance = "maintenance:delete";

  // ==================== TASKS ====================
  static const String viewTask = "tasks:view";
  static const String createTask = "tasks:create";
  static const String updateTask = "tasks:update";
  static const String deleteTask = "tasks:delete";

  // ==================== ATTACHMENTS ====================
  static const String viewAttachment = "attachments:view";
  static const String createAttachment = "attachments:create";
  static const String deleteAttachment = "attachments:delete";

  // ==================== PERMISSION GROUPS ====================
  static const Map<String, List<String>> permissionGroups = {
    'Users': [viewUser, createUser, updateUser, deleteUser],
    'Roles': [viewRole, createRole, updateRole, deleteRole, assignRole],
    'Leads': [viewLead, createLead, updateLead, deleteLead],
    'Customers': [viewCustomer, createCustomer, updateCustomer, deleteCustomer],
    'Projects': [viewProject, createProject, updateProject, deleteProject],
    'Units': [viewUnit, createUnit, updateUnit, deleteUnit],
    'Sales': [viewSale, createSale, updateSale, deleteSale],
    'Rentals': [viewRental, createRental, updateRental, deleteRental],
    'Collections': [
      viewCollection,
      createCollection,
      updateCollection,
      deleteCollection,
    ],
    'Companies': [viewCompany, createCompany, updateCompany, deleteCompany],
    'Owners': [viewOwner, createOwner, updateOwner, deleteOwner],
    'Maintenance': [
      viewMaintenance,
      createMaintenance,
      updateMaintenance,
      deleteMaintenance,
    ],
    'Tasks': [viewTask, createTask, updateTask, deleteTask],
    'Attachments': [viewAttachment, createAttachment, deleteAttachment],
  };

  // ==================== ALL PERMISSIONS ====================
  static List<String> get allPermissions => [
    // System
    superAdmin,
    sysAdmin,
    // Users
    ...permissionGroups['Users']!,
    // Roles
    ...permissionGroups['Roles']!,
    // Leads
    ...permissionGroups['Leads']!,
    // Customers
    ...permissionGroups['Customers']!,
    // Projects
    ...permissionGroups['Projects']!,
    // Units
    ...permissionGroups['Units']!,
    // Sales
    ...permissionGroups['Sales']!,
    // Rentals
    ...permissionGroups['Rentals']!,
    // Collections
    ...permissionGroups['Collections']!,
    // Companies
    ...permissionGroups['Companies']!,
    // Owners
    ...permissionGroups['Owners']!,
    // Maintenance
    ...permissionGroups['Maintenance']!,
    // Tasks
    ...permissionGroups['Tasks']!,
    // Attachments
    ...permissionGroups['Attachments']!,
  ];

  // ==================== HELPER METHODS ====================

  /// Get permission display name
  static String getDisplayName(String permission) {
    final parts = permission.split(':');
    if (parts.length == 2) {
      final module = parts[0].replaceAll('_', ' ');
      final action = parts[1].replaceAll('_', ' ');
      return '${_capitalize(action)} ${_capitalize(module)}';
    }
    return _capitalize(permission.replaceAll('_', ' '));
  }

  /// Get permission module
  static String getModule(String permission) {
    final parts = permission.split(':');
    return parts.isNotEmpty ? _capitalize(parts[0]) : '';
  }

  /// Get permission action
  static String getAction(String permission) {
    final parts = permission.split(':');
    return parts.length == 2 ? _capitalize(parts[1]) : '';
  }

  static String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
