import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/features/auth/login/data/model/users_model.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/users/ui/widgets/widget_build_actions.dart';
import 'package:flutter/material.dart';

/// Main header section widget for user details
class UserHeaderSection extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onViewPermissions;
  final VoidCallback onToggleStatus;
  final UsersModel user;
  final bool isDark;
  final AppLocalizations loc;

  const UserHeaderSection({
    super.key,
    required this.onEdit,
    required this.onDelete,
    required this.onViewPermissions,
    required this.onToggleStatus,
    required this.user,
    required this.isDark,
    required this.loc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAvatar(user: user),
          const SizedBox(width: 12),
          Expanded(
            child: UserInfoSection(user: user, isDark: isDark, loc: loc),
          ),
          buildActionMenu(
            context,
            user,
            loc,
            onEdit,
            onDelete,
            onViewPermissions,
            onToggleStatus,
          ),
        ],
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  final UsersModel user;

  const UserAvatar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: appColor.withOpacity(0.2), width: 2),
      ),
      child: AppCircleAvatar(imageUrl: user.photoUrl ?? "", radius: 30),
    );
  }
}

/// User information section containing name, contact, and status badges
class UserInfoSection extends StatelessWidget {
  final UsersModel user;
  final bool isDark;
  final AppLocalizations loc;

  const UserInfoSection({
    super.key,
    required this.user,
    required this.isDark,
    required this.loc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildUserName(),
        const SizedBox(height: 2),
        _buildContactInfo(),
        const SizedBox(height: 6),
        UserBadgesRow(user: user, loc: loc),
      ],
    );
  }

  Widget _buildUserName() {
    return Text(
      user.fullName,
      style: TextStyles.size16(
        fontWeight: FontWeight.bold,
        color: isDark ? darkText : primaryTextColor,
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        infoChip(Icons.email, user.email, infoColor),
        if (user.phone != null && user.phone!.isNotEmpty) ...[
          const SizedBox(height: 6),
          infoChip(Icons.phone, user.phone!, successColor),
        ],
      ],
    );
  }
}

/// Row containing status, deleted, and role badges
class UserBadgesRow extends StatelessWidget {
  final UsersModel user;
  final AppLocalizations loc;

  const UserBadgesRow({super.key, required this.user, required this.loc});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: [
        StatusChip(
          statusColor: user.isActive ?? false ? successColor : warningColor,
          statusText: user.isActive ?? false ? loc.active : loc.inactive,
        ),

        if (user.isDeleted == true)
          StatusChip(statusColor: warningColor, statusText: loc.deleted),

        StatusChip(
          statusColor: appColor,
          statusText: user.roles!.first.roleName!,
        ),
      ],
    );
  }
}
