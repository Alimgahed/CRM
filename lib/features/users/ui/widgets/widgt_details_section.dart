import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/users/data/model/users_model.dart';
import 'package:flutter/material.dart';

Widget buildDetailsSection(bool isDark, AppLocalizations loc, User user) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        if (user.email != null && user.email!.isNotEmpty)
          InfoRow(
            icon: Icons.email_outlined,
            label: loc.email,
            value: user.email!,
            isDark: isDark,
          ),
        if (user.email != null && user.email!.isNotEmpty)
          const SizedBox(height: 10),

        const SizedBox(height: 10),

        InfoRow(
          icon: Icons.person_pin_circle_outlined,
          label: loc.assignedTo,
          value: user.leaderName ?? loc.notAssigned,
          isDark: isDark,
        ),
      ],
    ),
  );
}
