import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/helpers/extesions.dart';
import 'package:crm/Core/theming/Colors.dart';
import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/Core/widgets/fields.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/actions/data/model/company_actions.dart';
import 'package:crm/features/actions/data/model/lead_action_model.dart';
import 'package:crm/features/actions/data/repo/add_action_repo.dart';
import 'package:crm/features/actions/data/repo/company_action_repo.dart';
import 'package:crm/features/actions/logic/cubit/add_action_cubit.dart';
import 'package:crm/features/actions/logic/cubit/all_company_actions_cubit.dart';
import 'package:crm/features/actions/logic/state/add_action_state.dart';
import 'package:crm/features/actions/logic/state/company_actions.dart';
import 'package:crm/features/clients/data/model/leads_model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAction extends StatelessWidget {
  final Lead lead;
  const AddAction({super.key, required this.lead});
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
              AddActionCubit(addActionRepo: getIt.get<AddActionRepo>()),
        ),

        BlocProvider(
          create: (context) => AllCompanyActionsCubit(
            companyActionRepo: getIt.get<CompanyActionRepo>(),
          )..getCompanyActions(),
        ),
      ],
      child: BlocConsumer<AddActionCubit, AddActionState>(
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
                  text: appLocalizations.addAction,
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
                  text: appLocalizations.addAction,
                  text2: appLocalizations.actionSavedSuccessfully,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          final cubit = context.read<AddActionCubit>();
          final isLoading = state is AddActionStateLoading;

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
                            Icon(Icons.add, color: appColor),
                            const SizedBox(width: 8),
                            Text(
                              appLocalizations.addAction,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: appColor,
                              ),
                            ),
                          ],
                        ),
                        BlocBuilder<AllCompanyActionsCubit, CompanyActionState>(
                          builder: (_, state) {
                            final actions = state.maybeWhen(
                              loaded: (actions) => actions,
                              orElse: () => <CompanyActionsModel>[],
                            );

                            final isLoading = state.maybeWhen(
                              loading: () => true,
                              orElse: () => false,
                            );

                            return CustomDropdownFormField<int>(
                              text: appLocalizations.actionType,
                              labelText: appLocalizations.actionType,
                              hintText: appLocalizations.selectActionType,

                              value: cubit.actionType,

                              items: isLoading
                                  ? const []
                                  : actions
                                        .where(
                                          (e) => e.actionType != null,
                                        ) // safety
                                        .map(
                                          (action) => DropdownMenuItem<int>(
                                            value: action.actionType!,
                                            child: Text(action.name ?? ""),
                                          ),
                                        )
                                        .toList(),

                              onChanged: isLoading
                                  ? null
                                  : (val) {
                                      cubit.setActionType(val!);
                                    },
                            );
                          },
                        ),

                        SizedBox(height: 10),
                        if (cubit.actionType == 1)
                          CustomTextFormField(
                            labelText: appLocalizations.unitName,
                          ),
                        SizedBox(height: 10),
                        if (cubit.actionType == 1)
                          CustomTextFormField(
                            labelText: appLocalizations.floorNumber,
                          ),
                        SizedBox(height: 10),
                        if (cubit.actionType == 1)
                          CustomTextFormField(
                            labelText: appLocalizations.unitPrice,
                          ),
                        SizedBox(height: 10),
                        if (cubit.actionType == 6)
                          CustomDropdownFormField(
                            value: 1,
                            labelText: appLocalizations.meetingType,
                            items: [
                              DropdownMenuItem(
                                value: 1,
                                child: Text(appLocalizations.online),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text(appLocalizations.offline),
                              ),
                            ],
                          ),
                        SizedBox(height: 10),

                        if (cubit.actionType == 6)
                          CustomDropdownFormField(
                            value: 1,
                            labelText: appLocalizations.meetingLocation,
                            items: [
                              DropdownMenuItem(
                                value: 1,
                                child: Text(appLocalizations.indoor),
                              ),

                              DropdownMenuItem(
                                value: 2,
                                child: Text(appLocalizations.outdoor),
                              ),
                            ],
                          ),

                        SizedBox(height: 10),
                        CustomTextFormField(
                          labelText: appLocalizations.actionDate,
                          controller: cubit.dateController,
                          iconData: Icons.calendar_today,
                          onTap: () async {
                            cubit.date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now().subtract(
                                const Duration(days: 365),
                              ),
                              lastDate: DateTime(2100),
                            );
                            if (cubit.date != null) {
                              cubit.dateController.text = cubit.date!
                                  .toUtc()
                                  .toIso8601String();
                            }
                          },
                        ),

                        const SizedBox(height: 10),

                        isLoading
                            ? Center(child: CircularProgressIndicator())
                            : CustomButton(
                                text: appLocalizations.save,
                                onPressed: () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    cubit.saveAction(
                                      LeadActionModel(
                                        actionType: cubit.actionType,
                                        actionDate: cubit.date,
                                        leadId: lead.id,
                                      ),
                                    );
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
