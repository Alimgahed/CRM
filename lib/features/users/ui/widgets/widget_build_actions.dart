import 'package:crm/Core/helpers/extesions.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/auth/login/data/model/users_model.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';

Widget buildActionMenu(
  BuildContext context,
  UsersModel user,
  AppLocalizations loc,
  VoidCallback? onEdit,
  VoidCallback? onDelete,
  VoidCallback? onViewPermissions,
  VoidCallback? onToggleStatus,
) {
  void showDeleteConfirmation(BuildContext context, AppLocalizations loc) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Icon(Icons.warning_amber_rounded, color: Colors.red),
            const SizedBox(width: 8),
            Text(loc.delete),
          ],
        ),
        content: Text(
          "Are you sure you want to delete ${user.fullName}? This action cannot be undone.",
        ),
        actions: [
          TextButton(onPressed: () => (context.pop()), child: Text(loc.cancel)),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              onDelete?.call();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: Text(loc.delete),
          ),
        ],
      ),
    );
  }

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
                color: user.isActive == true ? warningColor : successColor,
              ),
              const SizedBox(width: 12),
              Text(user.isActive == true ? loc.deactivate : loc.activate),
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
              Text(loc.permissions),
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
          showDeleteConfirmation(context, loc);
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
