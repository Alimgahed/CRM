import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/helpers/extesions.dart';
import 'package:crm/Core/theming/Colors.dart';
import 'package:crm/Core/widgets/fields.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:crm/features/Projects/data/repo/projects_repo.dart';
import 'package:crm/features/Projects/logic/cubit/project_cubit.dart';
import 'package:crm/features/Projects/logic/cubit/project_states.dart';
import 'package:crm/features/actions/logic/add_client.dart';
import 'package:crm/features/actions/logic/add_client_state.dart';
import 'package:crm/features/actions/data/repo/add_client_repo.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/users/data/model/users_model.dart';
import 'package:crm/features/users/data/repo/user_repo.dart';
import 'package:crm/features/users/logic/cubit/users_cubit.dart';
import 'package:crm/features/users/logic/states/users_states.dart';
import 'package:crm/logic/Features/Country_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddClient extends StatelessWidget {
  const AddClient({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AddClientCubit(addClientRepo: getIt.get<AddClientRepo>()),
        ),
        BlocProvider(
          create: (context) =>
              ProjectCubit(projectsRepo: getIt.get<ProjectsRepo>())
                ..fetchAllProjects(),
        ),
        BlocProvider(
          create: (context) =>
              UsersCubit(userRepo: getIt.get<UserRepo>())..getAllUsers(1, 20),
        ),
      ],
      child: BlocConsumer<AddClientCubit, AddClientState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              // Show loading dialog
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => Center(
                  child: CircularProgressIndicator(
                    color: isDark ? Colors.white : Colors.blue,
                  ),
                ),
              );
            },
            error: (message) {
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: isDark
                      ? const Color(0xFF1E1E1E)
                      : Colors.white,
                  title: Text(
                    appLocalizations.error,
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  content: Text(
                    message,
                    style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black87,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(appLocalizations.ok),
                    ),
                  ],
                ),
              );
            },
            loaded: (loginresponse) {
              // Dismiss loading dialog first
              context.pop();

              // Show success dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: isDark
                      ? const Color(0xFF1E1E1E)
                      : Colors.white,
                  title: Text(
                    appLocalizations.success,
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  content: Text(
                    appLocalizations.success,
                    style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black87,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close success dialog
                        Navigator.of(context).pop(); // Close add client sheet
                      },
                      child: Text(appLocalizations.ok),
                    ),
                  ],
                ),
              );
            },
          );
        },
        builder: (context, state) {
          final cubit = context.read<AddClientCubit>();
          final isLoading = state is AddClientStateLoading;

          return Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const FloatingCloseButton(),

                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: isDark ? darkColor : Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person_add, color: appColor),
                            const SizedBox(width: 8),
                            Text(
                              appLocalizations.createNewClient,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: appColor,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Client Name (Arabic/Default)
                        CustomTextFormField(
                          text: appLocalizations.clientName,
                          labelText: appLocalizations.enterClientNameHere,
                          controller: cubit.clientNameController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Client name is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),

                        // Client Name (English)
                        CustomTextFormField(
                          text: appLocalizations.clientNameen,
                          labelText: appLocalizations.enterClientNameHere,
                          controller: cubit.clientNameEnController,
                        ),
                        const SizedBox(height: 10),

                        // Project Priority
                        // Project Selection Dropdown
                        BlocBuilder<ProjectCubit, ProjectsState>(
                          builder: (context, projectState) {
                            // Extract the list of projects from the state
                            final List<Project> projectsList = projectState
                                .maybeWhen(
                                  loaded: (projects) => projects,
                                  orElse: () => [],
                                );

                            return CustomDropdownFormField<String>(
                              text: appLocalizations.project,
                              labelText: projectState.maybeWhen(
                                loading: () => appLocalizations.loading,
                                orElse: () => appLocalizations.selectProject,
                              ),
                              value: cubit.projectId,
                              // Disable dropdown while loading
                              onChanged:
                                  (projectState is ProjectsStateLoading) ||
                                      isLoading
                                  ? null
                                  : (val) {
                                      cubit.setProject(val ?? '');
                                    },
                              items: projectsList
                                  .fold<List<Project>>([], (list, element) {
                                    if (!list.any(
                                      (p) => p.projectId == element.projectId,
                                    )) {
                                      list.add(element);
                                    }
                                    return list;
                                  })
                                  .map((project) {
                                    return DropdownMenuItem<String>(
                                      value: project.projectId.toString(),
                                      child: Text(
                                        context
                                                    .read<LocaleCubit>()
                                                    .currentLocale ==
                                                'ar'
                                            ? project.projectName
                                            : project.projectNameEn,
                                        style: TextStyle(
                                          color: isDark
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    );
                                  })
                                  .toList(),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        BlocBuilder<UsersCubit, UsersState>(
                          builder: (context, userState) {
                            final List<User> usersList = userState.maybeWhen(
                              loaded: (users) => users,
                              orElse: () => [],
                            );

                            return CustomDropdownFormField<String>(
                              text: appLocalizations.sales,
                              labelText: userState.maybeWhen(
                                loading: () => appLocalizations.loading,
                                orElse: () => appLocalizations.selectSalesName,
                              ),

                              // Disable dropdown while loading
                              onChanged: (userState is Loading) || isLoading
                                  ? null
                                  : (val) {
                                      cubit.setSales(val ?? '');
                                    },
                              value: cubit.salesId,
                              items: usersList.map((user) {
                                return DropdownMenuItem<String>(
                                  value: user.userId,
                                  child: Text(
                                    user.fullName!,
                                    style: TextStyle(
                                      color: isDark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        ),
                        const SizedBox(height: 10),

                        // Primary Phone
                        CountryPhoneField(
                          hintText: appLocalizations.writePhoneNumber,
                          country: appLocalizations.selectCountry,
                          phoneController: cubit.phoneController,
                        ),
                        const SizedBox(height: 10),

                        // Secondary Phone (Optional)
                        CountryPhoneField(
                          hintText: appLocalizations.writeOtherPhoneNumber,
                          country: appLocalizations.selectCountry,
                          phoneController: cubit.phoneController2,
                        ),
                        const SizedBox(height: 10),

                        // Job Title
                        CustomTextFormField(
                          text: appLocalizations.jobTitle,
                          labelText: appLocalizations.writeJob,
                          controller: cubit.jobController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Job title is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),

                        // Email
                        CustomTextFormField(
                          text: appLocalizations.email,
                          labelText: appLocalizations.writeEmail,
                          controller: cubit.emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Email is required';
                            }
                            if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),

                        // Budget
                        CustomTextFormField(
                          text: appLocalizations.budget,
                          labelText: appLocalizations.budget,
                          controller: cubit.budgetController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value != null && value.trim().isNotEmpty) {
                              if (int.tryParse(value.trim()) == null) {
                                return 'Please enter a valid number';
                              }
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),

                        CustomDropdownFormField<String>(
                          text: appLocalizations.channel,
                          items: cubit.leadSourceMap.entries
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e.value, // ✅ GUID
                                  child: Text(e.key), // user sees name
                                ),
                              )
                              .toList(),
                          onChanged: (val) {
                            cubit.setChannel(val ?? '');
                          },
                          labelText: '',
                        ),

                        const SizedBox(height: 10),

                        // Preferred Contact Method
                        CustomDropdownFormField<String>(
                          text: appLocalizations.preferredMethodOfContact,
                          labelText:
                              appLocalizations.selectPreferredMethodOfContact,
                          value: cubit.preferredMethod,
                          items: [
                            DropdownMenuItem(
                              value: 'Phone',
                              child: Text(appLocalizations.phone),
                            ),
                            DropdownMenuItem(
                              value: 'Email',
                              child: Text(appLocalizations.email),
                            ),
                            DropdownMenuItem(
                              value: 'whatsapp',
                              child: Text(appLocalizations.whatsapp),
                            ),
                            DropdownMenuItem(
                              value: 'sms',
                              child: Text(appLocalizations.sms),
                            ),
                          ],
                          onChanged: isLoading
                              ? null
                              : (val) {
                                  cubit.setPreferredMethod(val ?? '');
                                },
                        ),
                        const SizedBox(height: 10),

                        // Client Status
                        CustomDropdownFormField<int>(
                          text: appLocalizations.clientStatus,
                          labelText: appLocalizations.selectClientStatus,
                          value: cubit.clientStatus ?? 1,
                          items: [
                            DropdownMenuItem(
                              value: 1,
                              child: Text(appLocalizations.active),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text(appLocalizations.inactive),
                            ),
                          ],
                          onChanged: isLoading
                              ? null
                              : (val) {
                                  cubit.setClientStatus(val ?? 1);
                                },
                        ),

                        const SizedBox(height: 20),

                        // Save Button
                        CustomButton(
                          text: appLocalizations.save,
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {
                              cubit.addClient();
                            }
                          },
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
