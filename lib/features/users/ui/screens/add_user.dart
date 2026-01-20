import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/theming/Colors.dart';
import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/Core/widgets/fields.dart';
import 'package:crm/features/auth/login/data/model/roles_model.dart';
import 'package:crm/features/auth/login/data/model/users_model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/users/data/model/role.dart';
import 'package:crm/features/users/data/model/users_model.dart';
import 'package:crm/features/users/data/repo/add_user_repo.dart';
import 'package:crm/features/users/data/repo/roles_repo.dart';
import 'package:crm/features/users/data/repo/user_repo.dart';
import 'package:crm/features/users/logic/cubit/add_user_cubit.dart';
import 'package:crm/features/users/logic/cubit/roles_cubit.dart';
import 'package:crm/features/users/logic/cubit/users_cubit.dart';
import 'package:crm/features/users/logic/states/add_user_states.dart';
import 'package:crm/features/users/logic/states/roles_state.dart';
import 'package:crm/features/users/logic/states/users_states.dart' hide Loading;
import 'package:crm/logic/Features/Country_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUser extends StatelessWidget {
  const AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AddUserCubit(addUserRepo: getIt<AddUserRepo>()),
        ),
        BlocProvider(
          create: (_) => RolesCubit(rolesRepo: getIt<RolesRepo>())..getRoles(),
        ),
        BlocProvider(
          create: (_) => UsersCubit(userRepo: getIt<UserRepo>())..getAllUsers(),
        ),
      ],
      child: BlocConsumer<AddUserCubit, AddUserState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (msg) => showModalBottomSheet(
              context: context,
              isScrollControlled: false,
              backgroundColor: Colors.transparent,
              builder: (_) => SuccessBottomSheet(
                success: false,
                text: l10n.newUser,
                text2: msg,
              ),
            ),
            loaded: (_) {
              showModalBottomSheet(
                context: context,
                isScrollControlled: false,
                backgroundColor: Colors.transparent,
                builder: (_) => SuccessBottomSheet(
                  success: true,
                  text: l10n.newUser,
                  text2: l10n.userAddedSuccessfully,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          final cubit = context.read<AddUserCubit>();
          final isLoading = state is AddUserLoading;

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

                        /// ===== Phone =====
                        CountryPhoneField(
                          hintText: l10n.writePhoneNumber,
                          phoneController: cubit.userPhoneController,
                          country: l10n.selectCountry,
                        ),
                        const SizedBox(height: 10),

                        /// ===== Roles =====
                        BlocBuilder<RolesCubit, RolesState>(
                          builder: (_, rolesState) {
                            final roles = rolesState.maybeWhen(
                              loaded: (roles) => roles,
                              orElse: () => <Role>[],
                            );

                            final isRolesLoading = rolesState.maybeWhen(
                              loading: () => true,
                              orElse: () => false,
                            );

                            return CustomDropdownFormField<Role>(
                              text: l10n.jobTitle,
                              labelText: l10n.writeJob,
                              value: null,
                              items: isRolesLoading
                                  ? [
                                      DropdownMenuItem<Role>(
                                        value: null,
                                        child: Text(l10n.loading),
                                      ),
                                    ]
                                  : roles
                                        .map(
                                          (role) => DropdownMenuItem<Role>(
                                            value: role,
                                            child: Text(role.roleName ?? '-'),
                                          ),
                                        )
                                        .toList(),
                              onChanged: isRolesLoading
                                  ? null
                                  : (val) {
                                      if (val != null) {
                                        cubit.addUserRole(
                                          val,
                                        ); // add to list instead of overwrite
                                      }
                                    },
                            );
                          },
                        ),

                        const SizedBox(height: 10),

                        BlocBuilder<UsersCubit, UsersState>(
                          builder: (_, usersState) {
                            final users = usersState.maybeWhen(
                              loaded: (users) => users,
                              orElse: () => <UsersModel>[],
                            );

                            final isLoading = usersState.maybeWhen(
                              loading: () => true,
                              orElse: () => false,
                            );

                            return CustomDropdownFormField<int>(
                              text: l10n.sales,
                              labelText: l10n.selectSalesName,
                              items: isLoading
                                  ? [
                                      DropdownMenuItem<int>(
                                        value: null,
                                        child: Text(
                                          l10n.loading,
                                        ), // Show "Loading..." text
                                      ),
                                    ]
                                  : users
                                        .map(
                                          (u) => DropdownMenuItem<int>(
                                            value: u.id,
                                            child: Text(u.fullName),
                                          ),
                                        )
                                        .toList(),
                              onChanged: isLoading
                                  ? null
                                  : (val) {
                                      if (val != null) {
                                        cubit.setUserLeadId(val);
                                      }
                                    },
                            );
                          },
                        ),

                        const SizedBox(height: 10),

                        /// ===== User Type =====
                        CustomDropdownFormField<int>(
                          text: l10n.status,
                          labelText: l10n.status,
                          items: [
                            DropdownMenuItem(
                              value: 1,
                              child: Text(l10n.active),
                            ),
                            DropdownMenuItem(
                              value: 2,
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
                            onPressed: isLoading ? null : () => cubit.addUser(),
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
