import 'package:crm/Core/network/api_constants.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/users/data/model/users_model.dart';
import 'package:crm/features/users/ui/widgets/widget_build_actions.dart';
import 'package:flutter/material.dart';

Widget buildHeaderSection(
  VoidCallback onedit,
  User user,
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
                style: const TextStyle(color: secondaryTextColor, fontSize: 13),
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
        buildActionMenu(context, user, loc, onedit, () {}, () {}, () {}),
      ],
    ),
  );
}

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
