import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/helpers/extesions.dart';
import 'package:crm/Core/theming/Colors.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/Core/widgets/fields.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:crm/features/Projects/data/repo/projects_repo.dart';
import 'package:crm/features/Projects/logic/cubit/project_cubit.dart';
import 'package:crm/features/Projects/logic/cubit/project_states.dart';
import 'package:crm/features/actions/logic/cubit/add_client.dart';
import 'package:crm/features/actions/logic/state/add_client_state.dart';
import 'package:crm/features/actions/data/repo/add_client_repo.dart';
import 'package:crm/features/auth/login/data/model/users_model.dart';
import 'package:crm/features/clients/data/model/lead_source.dart';
import 'package:crm/features/clients/data/model/leads_model.dart';
import 'package:crm/features/clients/data/repo/lead_soure.dart';
import 'package:crm/features/clients/logic/cubit/leads_source_cubit.dart';
import 'package:crm/features/clients/logic/states/leads_source_state.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/users/data/repo/user_repo.dart';
import 'package:crm/features/users/logic/cubit/users_cubit.dart';
import 'package:crm/features/users/logic/states/users_states.dart';
import 'package:crm/logic/Features/Country_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

class EditClients extends StatelessWidget {
  final Lead lead;
  const EditClients({super.key, required this.lead});

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
              UsersCubit(usersRepo: getIt.get<UserRepo>())..getAllUsers(),
        ),
        BlocProvider(
          create: (context) =>
              LeadsSourceCubit(leadSourceRepo: getIt.get<LeadSourceRepo>())
                ..fetchAllLeads(),
        ),
      ],
      child: BlocConsumer<AddClientCubit, AddClientState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () {},
            error: (message) {
              showModalBottomSheet(
                context: context,
                isScrollControlled: false,
                backgroundColor: Colors.transparent,
                builder: (_) => SuccessBottomSheet(
                  success: false,
                  text: appLocalizations.editClient,
                  text2: message,
                ),
              );
            },
            loaded: (done) {
              context.pop();
              showModalBottomSheet(
                context: context,
                isScrollControlled: false,
                backgroundColor: Colors.transparent,
                builder: (_) => SuccessBottomSheet(
                  success: true,
                  text: appLocalizations.editClient,
                  text2: appLocalizations.clientEditedSuccessfully,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          final cubit = context.read<AddClientCubit>();
          cubit.leadId = lead.id;
          cubit.channel = lead.leadSourceId;
          cubit.clientStatus = lead.status;
          cubit.salesId = lead.assignedToId;
          cubit.preferredMethod = lead.preferredContactMethod;
          cubit.clientNameController.text = lead.fullName ?? '';
          cubit.clientNameEnController.text = lead.fullNameEn ?? '';
          cubit.phoneController.text = lead.phone ?? '';
          cubit.phoneController2.text = lead.secondaryPhone ?? '';
          cubit.jobController.text = lead.jobTitle ?? '';
          cubit.emailController.text = lead.email ?? '';
          cubit.budgetController.text = lead.budget.toString();
          cubit.selectedProjects = lead.projectIds ?? [];
          cubit.attachments = lead.attachments ?? [];
          cubit.contracts = lead.contracts ?? [];
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
                        ),
                        const SizedBox(height: 10),

                        // Client Name (English)
                        CustomTextFormField(
                          text: appLocalizations.clientNameen,
                          labelText: appLocalizations.enterClientNameHere,
                          controller: cubit.clientNameEnController,
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
                              text: appLocalizations.salesName,
                              labelText: appLocalizations.sales,
                              hintText: appLocalizations.selectSalesName,
                              value: cubit.salesId,
                              items: isLoading
                                  ? [
                                      DropdownMenuItem<int>(
                                        value: null,
                                        child: Text(
                                          appLocalizations.loading,
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
                                        cubit.setSales(val);
                                      }
                                    },
                            );
                          },
                        ),

                        const SizedBox(height: 10),
                        BlocBuilder<ProjectCubit, ProjectsState>(
                          builder: (context, projectState) {
                            final projectsList = projectState.maybeWhen(
                              loaded: (projects) {
                                return projects;
                              },
                              orElse: () {
                                return <Project>[];
                              },
                            );

                            // Show loading indicator while projects are loading
                            if (projectState is ProjectsStateLoading) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    appLocalizations.project,
                                    style: TextStyles.size14(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ],
                              );
                            }

                            // Show error message if there's an error
                            if (projectState is ProjectsStateError) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    appLocalizations.project,
                                    style: TextStyles.size14(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Error loading projects',
                                    style: TextStyles.size14(color: Colors.red),
                                  ),
                                ],
                              );
                            }

                            // Create dropdown items
                            final dropdownItems = projectsList.map((project) {
                              final isArabic = context
                                  .read<LocaleCubit>()
                                  .isArabic;
                              final label = isArabic
                                  ? project.projectName ?? ''
                                  : project.projectNameEn ??
                                        project.projectName ??
                                        '';

                              print(
                                'Creating dropdown item: id=${project.id}, label=$label',
                              );

                              return DropdownItem<int>(
                                label: label,
                                value: project.id!, // must be non-null
                              );
                            }).toList();

                            print(
                              'Dropdown items count: ${dropdownItems.length}',
                            );
                            final initialIds = lead.projectIds ?? [];

                            if (initialIds.isNotEmpty) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                // This matches the IDs from the 'lead' model to the items in the dropdown
                                cubit.projectController.selectWhere(
                                  (item) => initialIds.contains(item.value),
                                );
                                // Sync the cubit list as well
                                cubit.selectedProjects = List.from(initialIds);
                              });
                            }
                            return AppMultiDropdown<int>(
                              label: appLocalizations.project,
                              hint: projectsList.isEmpty
                                  ? 'No projects available'
                                  : appLocalizations.selectProject,
                              controller: cubit.projectController,
                              items: dropdownItems,
                              enabled: projectsList
                                  .isNotEmpty, // Disable if no projects
                              onSelectionChange: (selectedIds) {
                                cubit.setProjects(selectedIds); // pass int list
                              },
                              prefixIcon: Icons.business,
                              maxSelections: 5,
                            );
                          },
                        ),

                        const SizedBox(height: 10),

                        // Primary Phone
                        CountryPhoneField(
                          label: appLocalizations.phone,
                          hintText: appLocalizations.writePhoneNumber,
                          country: appLocalizations.selectCountry,
                          phoneController: cubit.phoneController,
                        ),
                        const SizedBox(height: 10),

                        // Secondary Phone (Optional)
                        CountryPhoneField(
                          useValidator: false,
                          label: appLocalizations.secondaryPhone,
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
                        ),
                        const SizedBox(height: 10),

                        CustomTextFormField(
                          text: appLocalizations.email,
                          labelText: appLocalizations.writeEmail,
                          controller: cubit.emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),

                        CustomTextFormField.number(
                          labelAboveField: appLocalizations.budget,
                          labelText: appLocalizations.budget,

                          controller: cubit.budgetController,
                          // validator: (value) {
                          //   if (value != null && value.trim().isNotEmpty) {
                          //     if (int.tryParse(value.trim()) == null) {
                          //       return 'Please enter a valid number';
                          //     }
                          //   }
                          //   return null;
                          // },
                        ),
                        const SizedBox(height: 10),

                        BlocBuilder<LeadsSourceCubit, LeadsSourceState>(
                          builder: (context, userState) {
                            final List<LeadSource> sourcesList = userState
                                .maybeWhen(
                                  loaded: (source) => source,
                                  orElse: () => [],
                                );

                            return CustomDropdownFormField<int>(
                              text: appLocalizations.sales,
                              labelText: userState.maybeWhen(
                                loading: () => appLocalizations.loading,
                                orElse: () => appLocalizations.channel,
                              ),

                              // Disable dropdown while loading
                              onChanged: (userState is Loading) || isLoading
                                  ? null
                                  : (val) {
                                      cubit.setChannel(val!);
                                    },
                              value: cubit.channel,
                              items: sourcesList.map((source) {
                                return DropdownMenuItem<int>(
                                  value: source.id,
                                  child: Text(
                                    source.sourceName,
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

                        // Preferred Contact Method
                        CustomDropdownFormField<String>(
                          text: appLocalizations.preferredMethodOfContact,
                          labelText:
                              appLocalizations.selectPreferredMethodOfContact,
                          value: cubit.preferredMethod,
                          items: [
                            DropdownMenuItem(
                              value: 'phone',
                              child: Text(appLocalizations.phone),
                            ),
                            DropdownMenuItem(
                              value: 'email',
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

                        // Client Status
                        const SizedBox(height: 20),

                        // Save Button
                        isLoading
                            ? Center(child: CircularProgressIndicator())
                            : CustomButton(
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
