import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/features/auth/login/data/model/users_model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/users/logic/cubit/edit_user_cubit.dart';
import 'package:crm/features/users/logic/cubit/users_cubit.dart';
import 'package:crm/features/users/logic/states/edit_user_states.dart';
import 'package:crm/features/users/logic/states/users_states.dart';
import 'package:crm/features/users/ui/screens/edit_user.dart';
import 'package:crm/features/users/ui/widgets/UserMannagment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserManagement extends StatelessWidget {
  const UserManagement({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: BlocListener<EditUserCubit, EditUserState>(
        listener: (context, state) {
          state.maybeWhen(
            loaded: (user) => context.read<UsersCubit>().getAllUsers(),
            error: (message) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.red),
            ),
            orElse: () {},
          );
        },
        child: Column(
          children: [
            ReusableHeader(title: appLocalizations.userManagements),
            _buildBackgroundLoadingIndicator(),

            // --- Optimized Search Bar ---
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: SearchBarWidget(
                prefixIcon: Icons.search,
                suffixIcon: Icons.filter_list,
                hintText: appLocalizations.search,
                onChanged: (value) {
                  context.read<UsersCubit>().filterUsers(value);
                },
              ),
            ),

            Expanded(
              child: BlocBuilder<UsersCubit, UsersState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => _buildEmptyState(appLocalizations, isDark),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (message) => _buildErrorState(message, isDark),
                    loaded: (users) => users.isEmpty
                        ? _buildEmptyState(appLocalizations, isDark)
                        : _buildUsersList(context, users, appLocalizations),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Visual feedback for toggles/background edits
  Widget _buildBackgroundLoadingIndicator() {
    return BlocBuilder<EditUserCubit, EditUserState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const LinearProgressIndicator(minHeight: 2),
          orElse: () => const SizedBox(height: 2),
        );
      },
    );
  }

  Widget _buildUsersList(
    BuildContext context,
    List<UsersModel> users,
    AppLocalizations loc,
  ) {
    return RefreshIndicator(
      onRefresh: () => context.read<UsersCubit>().getAllUsers(),
      child: ListView.separated(
        padding: const EdgeInsets.only(bottom: 20),
        itemCount: users.length,
        physics: const AlwaysScrollableScrollPhysics(),
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final user = users[index];
          return UserManagementWidget(
            user: user,
            onEdit: () => _handleEdit(context, user, users),
            onDelete: () => _handleDelete(context, user, loc),
            onViewPermissions: () => _handleViewPermissions(context, user),
            onToggleStatus: () =>
                context.read<EditUserCubit>().toggleUserStatus(user),
          );
        },
      ),
    );
  }

  void _handleEdit(
    BuildContext context,
    UsersModel user,
    List<UsersModel> allUsers,
  ) {
    context.read<EditUserCubit>().initializeForEdit(user);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) => FractionallySizedBox(
        heightFactor: 0.8,
        child: BlocProvider.value(
          value: context.read<EditUserCubit>(),
          child: EditUser(
            user: user,
            allUsers: allUsers,
            usersCubit: context.read<UsersCubit>(),
          ),
        ),
      ),
    ).then((_) {
      context.read<EditUserCubit>().reset();
    });
  }

  void _handleDelete(
    BuildContext context,
    UsersModel user,
    AppLocalizations loc,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(loc.confirm),
        content: Text('${loc.deleteConfirmation} ${user.fullName}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(loc.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              // TODO: Implement delete functionality
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${loc.deletedSuccessfully} ${user.fullName}'),
                ),
              );
            },
            child: Text(loc.delete, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _handleViewPermissions(BuildContext context, UsersModel user) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('${user.fullName} Permissions'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [Text("${user.permissions}")],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(AppLocalizations loc, bool isDark) {
    return Center(
      child: Text(
        loc.noData,
        style: TextStyle(color: isDark ? Colors.white70 : darkColor),
      ),
    );
  }

  Widget _buildErrorState(String message, bool isDark) {
    return Center(
      child: Text(
        message,
        style: TextStyle(color: isDark ? Colors.red[300] : Colors.red),
      ),
    );
  }
}
