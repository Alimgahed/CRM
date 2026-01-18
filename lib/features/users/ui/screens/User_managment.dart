import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/users/logic/cubit/users_cubit.dart';
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
      body: Column(
        children: [
          ReusableHeader(title: appLocalizations.userManagements),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SearchBarWidget(
              prefixIcon: Icons.search,
              suffixIcon: Icons.filter_list,
              hintText: appLocalizations.search,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<UsersCubit, UsersState>(
              builder: (context, state) {
                return state.when(
                  initial: () => Center(
                    child: Text(
                      appLocalizations.noData,
                      style: TextStyle(
                        color: isDark ? Colors.white70 : darkColor,
                      ),
                    ),
                  ),
                  loading: () => Center(child: CircularProgressIndicator()),
                  loaded: (users) => users.isEmpty
                      ? Center(
                          child: Text(
                            appLocalizations.noData,
                            style: TextStyle(
                              color: isDark ? Colors.white70 : darkColor,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (_, index) {
                            final user = users[index];
                            return UserManagementWidget(
                              user: user,
                              onEdit: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (_) => FractionallySizedBox(
                                    heightFactor: 0.8,
                                    child: EditUser(user: user),
                                  ),
                                );
                              },
                              onDelete: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Delete ${user.fullName}'),
                                  ),
                                );
                              },
                              onViewPermissions: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Column(
                                      children: [
                                        Text(user.permissions.toString()),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              onToggleStatus: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Toggle status: ${user.fullName}',
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                  error: (message) => Center(
                    child: Text(
                      message,
                      style: TextStyle(
                        color: isDark ? Colors.red[300] : Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
