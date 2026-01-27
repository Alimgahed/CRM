import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/helpers/extesions.dart';
import 'package:crm/Core/theming/Colors.dart';
import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/Core/widgets/fields.dart';
import 'package:crm/features/auth/login/data/model/roles_model.dart';
import 'package:crm/features/auth/login/data/model/users_model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/users/data/repo/add_user_repo.dart';
import 'package:crm/features/users/data/repo/roles_repo.dart';
import 'package:crm/features/users/logic/cubit/edit_user_cubit.dart';
import 'package:crm/features/users/logic/cubit/roles_cubit.dart';
import 'package:crm/features/users/logic/cubit/users_cubit.dart';
import 'package:crm/features/users/logic/states/edit_user_states.dart';
import 'package:crm/features/users/logic/states/roles_state.dart';
import 'package:crm/logic/Features/Country_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUser extends StatelessWidget {
  final UsersModel user;
  final List<UsersModel> allUsers;
  final UsersCubit usersCubit; // Add this parameter

  const EditUser({
    super.key,
    required this.user,
    required this.usersCubit, // Required parameter
    required this.allUsers,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => EditUserCubit(
            editUserRepo: getIt<AddUserRepo>(),
            usersCubit: usersCubit, // Use passed parameter
          ),
        ),
        BlocProvider(
          create: (_) => RolesCubit(rolesRepo: getIt<RolesRepo>())..getRoles(),
        ),
        BlocProvider.value(
          value: usersCubit, // Provide the passed UsersCubit
        ),
      ],
      child: BlocConsumer<EditUserCubit, EditUserState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (msg) => showModalBottomSheet(
              context: context,
              isScrollControlled: false,
              backgroundColor: Colors.transparent,
              builder: (_) => SuccessBottomSheet(
                success: false,
                text: l10n.editUser,
                text2: msg,
              ),
            ),
            loaded: (_) {
              context.pop();
              showModalBottomSheet(
                context: context,
                isScrollControlled: false,
                backgroundColor: Colors.transparent,
                builder: (_) => SuccessBottomSheet(
                  success: true,
                  text: l10n.editUser,
                  text2: l10n.userEditedSuccessfully,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          final cubit = context.read<EditUserCubit>();
          cubit.userNameController.text = user.fullName;
          cubit.userEmailController.text = user.email;
          cubit.userPasswordController.text = user.passwordHash!;
          cubit.userLeadId = user.leaderId;
          cubit.isActive = user.isActive;
          cubit.userRoles = user.roles ?? [];
          cubit.userPhoneController.text = user.phone ?? "";
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
                          enabled: !isLoading,
                        ),
                        const SizedBox(height: 10),

                        /// ===== Email =====
                        CustomTextFormField(
                          text: l10n.email,
                          labelText: l10n.writeEmail,
                          controller: cubit.userEmailController,
                          keyboardType: TextInputType.emailAddress,
                          enabled: !isLoading,
                        ),
                        const SizedBox(height: 10),

                        /// ===== Password =====
                        CustomTextFormField(
                          text: l10n.password,
                          labelText: l10n.password,
                          controller: cubit.userPasswordController,
                          obscureText: true,
                          enabled: !isLoading,
                        ),
                        const SizedBox(height: 10),

                        CountryPhoneField(
                          label: l10n.phone,
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

                            return CustomDropdownFormField<Role>(
                              text: l10n.jobTitle,
                              hintText: l10n.jobTitle,
                              labelText: rolesState.maybeWhen(
                                loading: () => l10n.loading,
                                orElse: () => "",
                              ),
                              items: roles
                                  .map(
                                    (Role role) => DropdownMenuItem(
                                      value: role,
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
                                        cubit.addUserRole(val);
                                      }
                                    },
                            );
                          },
                        ),
                        const SizedBox(height: 10),

                        /// ===== Leader =====
                        CustomDropdownFormField<int>(
                          value: cubit.userLeadId,
                          text: l10n.leaderName,
                          hintText: l10n.selectLeaderName,
                          labelText: l10n.leaderName,
                          onChanged: isLoading
                              ? null
                              : (val) {
                                  cubit.setUserLeadId(val ?? 0);
                                },
                          items: allUsers
                              .map(
                                (UsersModel u) => DropdownMenuItem(
                                  value: u.id,
                                  child: Text(u.fullName),
                                ),
                              )
                              .toList(),
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
                        isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : CustomButton(
                                text: l10n.save,
                                onPressed: () => cubit.editUser(
                                  UsersModel(
                                    id: user.id,
                                    fullName: cubit.userNameController.text,
                                    email: cubit.userEmailController.text,
                                    phone: cubit.userPhoneController.text,
                                    passwordHash:
                                        cubit.userPasswordController.text,
                                    leaderId: cubit.userLeadId,
                                    roles: cubit.userRoles,
                                    isActive: cubit.isActive!,
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
