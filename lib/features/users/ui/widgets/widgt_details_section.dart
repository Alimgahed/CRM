import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/features/auth/login/data/model/users_model.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';

Widget buildDetailsSection(bool isDark, AppLocalizations loc, UsersModel user) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        InfoRow(
          icon: Icons.email_outlined,
          label: loc.email,
          value: user.email,
          isDark: isDark,
        ),
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
