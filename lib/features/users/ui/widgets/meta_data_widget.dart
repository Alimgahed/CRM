import 'package:crm/Core/helpers/date_format.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/auth/login/data/model/users_model.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';

Widget buildMetadataSection(
  UsersModel user,
  bool isDark,
  AppLocalizations loc,
) {
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
              user.createdAt!.toFormattedDate(loc),
            ),
            _buildMetaItem(
              Icons.update_outlined,
              "Updated",
              user.updatedAt!.toFormattedDate(loc),
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
                "User Type: ${user.userType}",
                style: const TextStyle(fontSize: 11, color: secondaryTextColor),
              ),
            ],
          ),
        ],
      ],
    ),
  );
}

// ========== HELPER WIDGETS ==========

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
