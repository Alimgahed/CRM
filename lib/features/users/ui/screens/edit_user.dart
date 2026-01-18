import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/theming/Colors.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/Core/widgets/fields.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/users/data/model/role.dart';
import 'package:crm/features/users/data/model/users_model.dart';
import 'package:crm/features/users/data/repo/edit_user_repo.dart';
import 'package:crm/features/users/data/repo/roles_repo.dart';
import 'package:crm/features/users/data/repo/user_repo.dart';
import 'package:crm/features/users/logic/cubit/edit_user_cubit.dart';
import 'package:crm/features/users/logic/cubit/roles_cubit.dart';
import 'package:crm/features/users/logic/cubit/users_cubit.dart';
import 'package:crm/features/users/logic/states/edit_user_states.dart';
import 'package:crm/features/users/logic/states/roles_state.dart';
import 'package:crm/features/users/logic/states/users_states.dart' hide Loading;
import 'package:crm/logic/Features/Country_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUser extends StatelessWidget {
  final User user;

  const EditUser({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => EditUserCubit(editUserRepo: getIt<EditUserRepo>()),
        ),
        BlocProvider(
          create: (_) => RolesCubit(rolesRepo: getIt<RolesRepo>())..getRoles(),
        ),
        BlocProvider(
          create: (_) => UsersCubit(userRepo: getIt<UserRepo>())..getAllUsers(),
        ),
      ],
      child: BlocConsumer<EditUserCubit, EditUserState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (msg) =>
                showAboutDialog(context: context, children: [Text(msg)]),

            loaded: (_) {
              showAboutDialog(context: context, children: [Text(l10n.success)]);
            },
          );
        },
        builder: (context, state) {
          final cubit = context.read<EditUserCubit>();
          cubit.userNameController.text = user.fullName!;
          cubit.userEmailController.text = user.email!;
          cubit.userPhoneController.text = user.phone!;
          cubit.setUserType(user.isActive!);
          final isLoading = state is EditUserLoading;

          return Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const FloatingCloseButton(),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDark ? darkColor : Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// ===== Title =====
                        Row(
                          children: [
                            const Icon(Icons.person_add, color: appColor),
                            const SizedBox(width: 8),
                            Text(
                              l10n.addNewUser,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: appColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        /// ===== Username =====
                        CustomTextFormField(
                          text: l10n.username,
                          labelText: l10n.username,
                          controller: cubit.userNameController,
                          validator: (v) =>
                              cubit.validateRequired(v, l10n.username),
                          enabled: !isLoading,
                        ),
                        const SizedBox(height: 10),

                        /// ===== Email =====
                        CustomTextFormField(
                          text: l10n.email,
                          labelText: l10n.writeEmail,
                          controller: cubit.userEmailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: cubit.validateEmail,
                          enabled: !isLoading,
                        ),
                        const SizedBox(height: 10),

                        /// ===== Password =====
                        CustomTextFormField(
                          text: l10n.password,
                          labelText: l10n.password,
                          controller: cubit.userPasswordController,
                          obscureText: true,
                          validator: (v) =>
                              cubit.validateRequired(v, l10n.password),
                          enabled: !isLoading,
                        ),
                        const SizedBox(height: 10),

                        CountryPhoneField(
                          hintText: l10n.writePhoneNumber,
                          phoneController: cubit.userPhoneController,
                          country: l10n.selectCountry,
                        ),
                        const SizedBox(height: 10),

                        /// ===== Roles =====
                        BlocBuilder<RolesCubit, RolesState>(
                          builder: (_, rolesState) {
                            final List<Role> roles = rolesState.maybeWhen(
                              loaded: (r) => r,
                              orElse: () => [],
                            );

                            final isRolesLoading = rolesState is Loading;

                            return CustomDropdownFormField<String>(
                              text: l10n.jobTitle,
                              hintText: l10n.jobTitle,
                              labelText: rolesState.maybeWhen(
                                loading: () => l10n.loading,
                                orElse: () => cubit.userRolesId ?? "",
                              ),
                              items: roles
                                  .map(
                                    (Role role) => DropdownMenuItem(
                                      value: role.roleId,
                                      child: Text(
                                        isRolesLoading
                                            ? l10n.loading
                                            : role.roleName ?? '',
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: isLoading
                                  ? null
                                  : (val) {
                                      if (val != null) {
                                        cubit.setUserRoleId(val);
                                      }
                                    },
                            );
                          },
                        ),
                        const SizedBox(height: 10),

                        /// ===== Leader =====
                        BlocBuilder<UsersCubit, UsersState>(
                          builder: (context, usersState) {
                            final List<User> users = usersState.maybeWhen(
                              loaded: (user) => user,
                              orElse: () => [],
                            );

                            final isUsersLoading =
                                usersState is EditUserLoading;

                            return CustomDropdownFormField<String>(
                              text: l10n.leader,
                              hintText: l10n.selectLeaderName,
                              labelText: usersState.maybeWhen(
                                loading: () => l10n.loading,
                                orElse: () => cubit.userLeadId ?? "",
                              ),

                              // Disable dropdown while loading
                              onChanged: (usersState is Loading) || isLoading
                                  ? null
                                  : (val) {
                                      cubit.setUserLeadId(val ?? '');
                                    },

                              items: users
                                  .map(
                                    (User u) => DropdownMenuItem(
                                      value: u.userId,
                                      child: Text(
                                        isUsersLoading
                                            ? l10n.loading
                                            : u.fullName ?? '',
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                          },
                        ),
                        const SizedBox(height: 10),

                        /// ===== User Type =====
                        CustomDropdownFormField<bool>(
                          text: l10n.status,
                          labelText: l10n.status,
                          value: cubit.isActive,
                          items: [
                            DropdownMenuItem(
                              value: true,
                              child: Text(l10n.active),
                            ),
                            DropdownMenuItem(
                              value: false,
                              child: Text(l10n.inactive),
                            ),
                          ],
                          onChanged: isLoading
                              ? null
                              : (value) {
                                  if (value != null) {
                                    cubit.setUserType(value);
                                  }
                                },
                        ),
                        const SizedBox(height: 24),

                        /// ===== Save Button =====
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: isLoading
                                ? null
                                : () => cubit.editUser(user.userId!),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: appColor,
                              disabledBackgroundColor: appColor.withOpacity(
                                0.5,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: isLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                : Text(
                                    l10n.save,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
