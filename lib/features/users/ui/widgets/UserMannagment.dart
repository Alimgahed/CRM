import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/auth/login/data/model/users_model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/users/ui/widgets/header_section..dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserManagementWidget extends StatelessWidget {
  final UsersModel user;
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
        child: UserHeaderSection(
          onEdit: onEdit!,
          onDelete: onDelete!,
          onViewPermissions: onViewPermissions!,
          onToggleStatus: onToggleStatus!,
          user: user,
          isDark: isDark,
          loc: loc,
        ),
      ),
    );
  }
}
