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
      child: _EditClientsBody(lead: lead),
    );
  }
}

class _EditClientsBody extends StatefulWidget {
  final Lead lead;
  const _EditClientsBody({required this.lead});

  @override
  State<_EditClientsBody> createState() => _EditClientsBodyState();
}

class _EditClientsBodyState extends State<_EditClientsBody> {
  late final AddClientCubit _cubit;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<AddClientCubit>();
    _initializeCubitData();
  }

  void _initializeCubitData() {
    if (_isInitialized) return;

    _cubit.leadId = widget.lead.id;
    _cubit.channel = widget.lead.leadSourceId;
    _cubit.clientStatus = widget.lead.status;
    _cubit.salesId = widget.lead.assignedToId;
    _cubit.preferredMethod = widget.lead.preferredContactMethod;
    _cubit.clientNameController.text = widget.lead.fullName ?? '';
    _cubit.clientNameEnController.text = widget.lead.fullNameEn ?? '';
    _cubit.phoneController.text = widget.lead.phone ?? '';
    _cubit.phoneController2.text = widget.lead.secondaryPhone ?? '';
    _cubit.jobController.text = widget.lead.jobTitle ?? '';
    _cubit.emailController.text = widget.lead.email ?? '';
    _cubit.budgetController.text = widget.lead.budget.toString();
    _cubit.selectedProjects = widget.lead.projectIds ?? [];
    _cubit.attachments = widget.lead.attachments ?? [];
    _cubit.contracts = widget.lead.contracts ?? [];

    _isInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return BlocConsumer<AddClientCubit, AddClientState>(
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
        final isLoading = state is AddClientStateLoading;

        return Form(
          key: _cubit.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const FloatingCloseButton(),
                _EditClientsContent(
                  cubit: _cubit,
                  isLoading: isLoading,
                  appLocalizations: appLocalizations,
                  lead: widget.lead,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _EditClientsContent extends StatelessWidget {
  final AddClientCubit cubit;
  final bool isLoading;
  final AppLocalizations appLocalizations;
  final Lead lead;

  const _EditClientsContent({
    required this.cubit,
    required this.isLoading,
    required this.appLocalizations,
    required this.lead,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: isDark ? darkColor : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(isDark),
          const SizedBox(height: 16),
          _buildClientNameField(),
          const SizedBox(height: 10),
          _buildClientNameEnField(),
          const SizedBox(height: 10),
          _SalesDropdown(
            cubit: cubit,
            appLocalizations: appLocalizations,
            isLoading: isLoading,
          ),
          const SizedBox(height: 10),
          _ProjectsDropdown(
            cubit: cubit,
            appLocalizations: appLocalizations,
            lead: lead,
          ),
          const SizedBox(height: 10),
          _buildPhoneField(),
          const SizedBox(height: 10),
          _buildSecondaryPhoneField(),
          const SizedBox(height: 10),
          _buildJobField(),
          const SizedBox(height: 10),
          _buildEmailField(),
          const SizedBox(height: 10),
          _buildBudgetField(),
          const SizedBox(height: 10),
          _LeadSourceDropdown(
            cubit: cubit,
            appLocalizations: appLocalizations,
            isLoading: isLoading,
            isDark: isDark,
          ),
          const SizedBox(height: 10),
          _buildPreferredMethodDropdown(isDark),
          const SizedBox(height: 20),
          _buildSaveButton(),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isDark) {
    return Row(
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
    );
  }

  Widget _buildClientNameField() {
    return CustomTextFormField(
      text: appLocalizations.clientName,
      labelText: appLocalizations.enterClientNameHere,
      controller: cubit.clientNameController,
    );
  }

  Widget _buildClientNameEnField() {
    return CustomTextFormField(
      text: appLocalizations.clientNameen,
      labelText: appLocalizations.enterClientNameHere,
      controller: cubit.clientNameEnController,
    );
  }

  Widget _buildPhoneField() {
    return CountryPhoneField(
      label: appLocalizations.phone,
      hintText: appLocalizations.writePhoneNumber,
      country: appLocalizations.selectCountry,
      phoneController: cubit.phoneController,
    );
  }

  Widget _buildSecondaryPhoneField() {
    return CountryPhoneField(
      useValidator: false,
      label: appLocalizations.secondaryPhone,
      hintText: appLocalizations.writeOtherPhoneNumber,
      country: appLocalizations.selectCountry,
      phoneController: cubit.phoneController2,
    );
  }

  Widget _buildJobField() {
    return CustomTextFormField(
      text: appLocalizations.jobTitle,
      labelText: appLocalizations.writeJob,
      controller: cubit.jobController,
    );
  }

  Widget _buildEmailField() {
    return CustomTextFormField(
      text: appLocalizations.email,
      labelText: appLocalizations.writeEmail,
      controller: cubit.emailController,
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildBudgetField() {
    return CustomTextFormField.number(
      labelAboveField: appLocalizations.budget,
      labelText: appLocalizations.budget,
      controller: cubit.budgetController,
    );
  }

  Widget _buildPreferredMethodDropdown(bool isDark) {
    return CustomDropdownFormField<String>(
      text: appLocalizations.preferredMethodOfContact,
      labelText: appLocalizations.selectPreferredMethodOfContact,
      value: cubit.preferredMethod,
      items: [
        DropdownMenuItem(value: 'phone', child: Text(appLocalizations.phone)),
        DropdownMenuItem(value: 'email', child: Text(appLocalizations.email)),
        DropdownMenuItem(
          value: 'whatsapp',
          child: Text(appLocalizations.whatsapp),
        ),
        DropdownMenuItem(value: 'sms', child: Text(appLocalizations.sms)),
      ],
      onChanged: isLoading
          ? null
          : (val) {
              cubit.setPreferredMethod(val ?? '');
            },
    );
  }

  Widget _buildSaveButton() {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : CustomButton(
            text: appLocalizations.save,
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.addClient();
              }
            },
          );
  }
}

class _SalesDropdown extends StatelessWidget {
  final AddClientCubit cubit;
  final AppLocalizations appLocalizations;
  final bool isLoading;

  const _SalesDropdown({
    required this.cubit,
    required this.appLocalizations,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      buildWhen: (previous, current) {
        // Only rebuild when state actually changes
        return previous != current;
      },
      builder: (_, usersState) {
        final users = usersState.maybeWhen(
          loaded: (users) => users,
          orElse: () => <UsersModel>[],
        );

        final isLoadingUsers = usersState.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return CustomDropdownFormField<int>(
          text: appLocalizations.salesName,
          labelText: appLocalizations.sales,
          hintText: appLocalizations.selectSalesName,
          value: cubit.salesId,
          items: isLoadingUsers
              ? [
                  DropdownMenuItem<int>(
                    value: null,
                    child: Text(appLocalizations.loading),
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
          onChanged: isLoadingUsers
              ? null
              : (val) {
                  if (val != null) {
                    cubit.setSales(val);
                  }
                },
        );
      },
    );
  }
}

class _ProjectsDropdown extends StatefulWidget {
  final AddClientCubit cubit;
  final AppLocalizations appLocalizations;
  final Lead lead;

  const _ProjectsDropdown({
    required this.cubit,
    required this.appLocalizations,
    required this.lead,
  });

  @override
  State<_ProjectsDropdown> createState() => _ProjectsDropdownState();
}

class _ProjectsDropdownState extends State<_ProjectsDropdown> {
  bool _isProjectsInitialized = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectCubit, ProjectsState>(
      buildWhen: (previous, current) {
        // Only rebuild when state actually changes
        return previous != current;
      },
      builder: (context, projectState) {
        final projectsList = projectState.maybeWhen(
          loaded: (projects) => projects,
          orElse: () => <Project>[],
        );

        if (projectState is ProjectsStateLoading) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.appLocalizations.project,
                style: TextStyles.size14(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              const Center(child: CircularProgressIndicator()),
            ],
          );
        }

        if (projectState is ProjectsStateError) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.appLocalizations.project,
                style: TextStyles.size14(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                'Error loading projects',
                style: TextStyles.size14(color: Colors.red),
              ),
            ],
          );
        }

        final dropdownItems = projectsList.map((project) {
          final isArabic = context.read<LocaleCubit>().isArabic;
          final label = isArabic
              ? project.projectName ?? ''
              : project.projectNameEn ?? project.projectName ?? '';

          return DropdownItem<int>(label: label, value: project.id!);
        }).toList();

        final initialIds = widget.lead.projectIds ?? [];

        if (initialIds.isNotEmpty &&
            !_isProjectsInitialized &&
            dropdownItems.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!_isProjectsInitialized) {
              widget.cubit.projectController.selectWhere(
                (item) => initialIds.contains(item.value),
              );
              widget.cubit.selectedProjects = List.from(initialIds);
              setState(() {
                _isProjectsInitialized = true;
              });
            }
          });
        }

        return AppMultiDropdown<int>(
          label: widget.appLocalizations.project,
          hint: projectsList.isEmpty
              ? 'No projects available'
              : widget.appLocalizations.selectProject,
          controller: widget.cubit.projectController,
          items: dropdownItems,
          enabled: projectsList.isNotEmpty,
          onSelectionChange: (selectedIds) {
            widget.cubit.setProjects(selectedIds);
          },
          prefixIcon: Icons.business,
          maxSelections: 5,
        );
      },
    );
  }
}

class _LeadSourceDropdown extends StatelessWidget {
  final AddClientCubit cubit;
  final AppLocalizations appLocalizations;
  final bool isLoading;
  final bool isDark;

  const _LeadSourceDropdown({
    required this.cubit,
    required this.appLocalizations,
    required this.isLoading,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadsSourceCubit, LeadsSourceState>(
      buildWhen: (previous, current) {
        // Only rebuild when state actually changes
        return previous != current;
      },
      builder: (context, userState) {
        final List<LeadSource> sourcesList = userState.maybeWhen(
          loaded: (source) => source,
          orElse: () => [],
        );

        return CustomDropdownFormField<int>(
          text: appLocalizations.sales,
          labelText: userState.maybeWhen(
            loading: () => appLocalizations.loading,
            orElse: () => appLocalizations.channel,
          ),
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
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
