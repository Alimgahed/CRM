import 'package:crm/Core/network/api_constants.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/users/data/model/role_info.dart';
import 'package:crm/features/users/data/model/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class UserManagementWidget extends StatelessWidget {
  final User user;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onViewPermissions;
  final VoidCallback? onToggleStatus;

  const UserManagementWidget({
    super.key,
    required this.user,
    this.onEdit,
    this.onDelete,
    this.onViewPermissions,
    this.onToggleStatus,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final loc = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? darkColor : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isDark ? darkBorder : Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.3 : 0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            _buildHeaderSection(context, isDark, loc),
            const Divider(height: 1),
            _buildDetailsSection(isDark, loc),
            _buildRolePermissionsSection(context, isDark, loc),
            const Divider(height: 1),
            _buildMetadataSection(isDark, loc),
          ],
        ),
      ),
    );
  }

  // ========== HEADER SECTION ==========
  Widget _buildHeaderSection(
    BuildContext context,
    bool isDark,
    AppLocalizations loc,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserAvatar(user),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.fullName ?? "—",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "@${user.username ?? 'user'}",
                  style: const TextStyle(
                    color: secondaryTextColor,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    _buildStatusBadge(user.isActive ?? false, loc),
                    const SizedBox(width: 8),
                    if (user.isDeleted == true) _buildDeletedBadge(loc),
                  ],
                ),
              ],
            ),
          ),
          _buildActionMenu(context, loc),
        ],
      ),
    );
  }

  // ========== DETAILS SECTION ==========
  Widget _buildDetailsSection(bool isDark, AppLocalizations loc) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          if (user.email != null && user.email!.isNotEmpty)
            _buildInfoRow(Icons.email_outlined, loc.email, user.email!, isDark),
          if (user.email != null && user.email!.isNotEmpty)
            const SizedBox(height: 10),

          const SizedBox(height: 10),

          _buildInfoRow(
            Icons.person_pin_circle_outlined,
            loc.assignedTo,
            user.leaderName ?? loc.notAssigned,
            isDark,
          ),
        ],
      ),
    );
  }

  // ========== ROLE & PERMISSIONS SECTION ==========
  Widget _buildRolePermissionsSection(
    BuildContext context,
    bool isDark,
    AppLocalizations loc,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: isDark ? Colors.white.withOpacity(0.02) : Colors.grey.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.admin_panel_settings_outlined,
                size: 18,
                color: appColor.withOpacity(0.7),
              ),
              const SizedBox(width: 8),
              Text(
                loc.details,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: appColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Role Info
          if (user.roleInfo != null) ...[
            _buildRoleInfoCard(user.roleInfo!, isDark, loc),
          ] else if (user.role != null) ...[
            Text(
              "Role: ${user.role}",
              style: TextStyle(
                fontSize: 13,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ],

          const SizedBox(height: 12),

          // Permissions Count & Action
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.key_rounded,
                    size: 16,
                    color: secondaryTextColor,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "${_getTotalPermissions()} Permissions",
                    style: const TextStyle(
                      fontSize: 12,
                      color: secondaryTextColor,
                    ),
                  ),
                ],
              ),
              if (onViewPermissions != null)
                TextButton.icon(
                  onPressed: onViewPermissions,
                  icon: const Icon(Icons.visibility_outlined, size: 16),
                  label: const Text("View All"),
                  style: TextButton.styleFrom(
                    foregroundColor: appColor,
                    textStyle: const TextStyle(fontSize: 12),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  // ========== METADATA SECTION ==========
  Widget _buildMetadataSection(bool isDark, AppLocalizations loc) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withOpacity(0.03) : Colors.grey.shade100,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMetaItem(
                Icons.calendar_today_outlined,
                "Created",
                _formatDate(user.createdAt),
              ),
              _buildMetaItem(
                Icons.update_outlined,
                "Updated",
                _formatDate(user.updatedAt),
              ),
            ],
          ),
          if (user.userType != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.category_outlined,
                  size: 14,
                  color: secondaryTextColor,
                ),
                const SizedBox(width: 6),
                Text(
                  "User Type: ${_getUserTypeName(user.userType!)}",
                  style: const TextStyle(
                    fontSize: 11,
                    color: secondaryTextColor,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  // ========== HELPER WIDGETS ==========

  Widget _buildUserAvatar(User user) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: appColor.withOpacity(0.2), width: 2),
      ),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: appColor.withOpacity(0.1),
        backgroundImage: user.photoUrl != null
            ? NetworkImage(ApiConstants.baseUrl + user.photoUrl!)
            : null,
        child: user.photoUrl == null
            ? const Icon(Icons.person_rounded, color: appColor, size: 32)
            : null,
      ),
    );
  }

  Widget _buildStatusBadge(bool isActive, AppLocalizations loc) {
    final color = isActive ? Colors.green : Colors.orange;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 3, backgroundColor: color),
          const SizedBox(width: 6),
          Text(
            isActive ? loc.active : loc.inactive,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeletedBadge(AppLocalizations loc) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.red.withOpacity(0.3)),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.delete_outline, size: 12, color: Colors.red),
          SizedBox(width: 4),
          Text(
            "Deleted",
            style: TextStyle(
              color: Colors.red,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionMenu(BuildContext context, AppLocalizations loc) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert, color: appColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      itemBuilder: (context) => [
        if (onEdit != null)
          PopupMenuItem(
            value: 'edit',
            child: Row(
              children: [
                const Icon(Icons.edit_outlined, size: 20, color: appColor),
                const SizedBox(width: 12),
                Text(loc.edit),
              ],
            ),
          ),
        if (onToggleStatus != null)
          PopupMenuItem(
            value: 'toggle_status',
            child: Row(
              children: [
                Icon(
                  user.isActive == true
                      ? Icons.block_outlined
                      : Icons.check_circle_outline,
                  size: 20,
                  color: user.isActive == true ? Colors.orange : Colors.green,
                ),
                const SizedBox(width: 12),
                Text(user.isActive == true ? "Deactivate" : "Activate"),
              ],
            ),
          ),
        if (onViewPermissions != null)
          PopupMenuItem(
            value: 'permissions',
            child: Row(
              children: [
                const Icon(Icons.key_outlined, size: 20, color: Colors.blue),
                const SizedBox(width: 12),
                const Text("View Permissions"),
              ],
            ),
          ),
        if (onDelete != null) const PopupMenuDivider(),
        if (onDelete != null)
          PopupMenuItem(
            value: 'delete',
            child: Row(
              children: [
                const Icon(Icons.delete_outline, size: 20, color: Colors.red),
                const SizedBox(width: 12),
                Text(loc.delete),
              ],
            ),
          ),
      ],
      onSelected: (value) {
        switch (value) {
          case 'edit':
            onEdit?.call();
            break;
          case 'delete':
            _showDeleteConfirmation(context, loc);
            break;
          case 'permissions':
            onViewPermissions?.call();
            break;
          case 'toggle_status':
            onToggleStatus?.call();
            break;
        }
      },
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value, bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: appColor.withOpacity(0.7)),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$label: ",
                  style: const TextStyle(
                    fontSize: 13,
                    color: secondaryTextColor,
                  ),
                ),
                TextSpan(
                  text: value,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRoleInfoCard(
    RoleInfo roleInfo,
    bool isDark,
    AppLocalizations loc,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: appColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: appColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  roleInfo.roleName ?? "—",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: appColor,
                  ),
                ),
              ),
              if (roleInfo.isSystemRole == true)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "System",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          if (roleInfo.roleNameEn != null &&
              roleInfo.roleNameEn != roleInfo.roleName) ...[
            const SizedBox(height: 4),
            Text(
              roleInfo.roleNameEn!,
              style: const TextStyle(fontSize: 12, color: secondaryTextColor),
            ),
          ],
          if (roleInfo.description != null) ...[
            const SizedBox(height: 6),
            Text(
              roleInfo.description!,
              style: TextStyle(
                fontSize: 11,
                color: secondaryTextColor.withOpacity(0.8),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMetaItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 14, color: secondaryTextColor),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: secondaryTextColor.withOpacity(0.7),
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 11,
                color: secondaryTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ========== HELPER METHODS ==========

  int _getTotalPermissions() {
    int count = 0;

    // From roleInfo
    if (user.roleInfo?.permissions != null) {
      count += user.roleInfo!.permissions!.length;
    }

    // From direct permissions map
    if (user.permissions != null) {
      count += user.permissions!.length;
    }

    return count;
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return "—";
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('MMM dd, yyyy').format(date);
    } catch (e) {
      return dateStr.substring(0, 10);
    }
  }

  String _getUserTypeName(int type) {
    switch (type) {
      case 0:
        return "Regular User";
      case 1:
        return "Admin";
      case 2:
        return "Super Admin";
      default:
        return "Type $type";
    }
  }

  void _showDeleteConfirmation(BuildContext context, AppLocalizations loc) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Icon(Icons.warning_amber_rounded, color: Colors.red),
            const SizedBox(width: 8),
            Text(loc.delete ?? "Delete User"),
          ],
        ),
        content: Text(
          "Are you sure you want to delete ${user.fullName ?? 'this user'}? This action cannot be undone.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(loc.cancel ?? "Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              onDelete?.call();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: Text(loc.delete ?? "Delete"),
          ),
        ],
      ),
    );
  }
}
