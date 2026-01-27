import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/helpers/extesions.dart';
import 'package:crm/Core/theming/Colors.dart';
import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/Core/widgets/fields.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/constant/enums/actioins_enms.dart';
import 'package:crm/features/actions/data/repo/add_action_repo.dart';
import 'package:crm/features/actions/logic/cubit/add_action_cubit.dart';
import 'package:crm/features/actions/logic/state/add_action_state.dart';
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
    return BlocProvider(
      create: (_) => AddActionCubit(addActionRepo: getIt.get<AddActionRepo>()),
      child: _AddActionContent(lead: lead),
    );
  }
}

class _AddActionContent extends StatelessWidget {
  final Lead lead;
  const _AddActionContent({required this.lead});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return BlocConsumer<AddActionCubit, AddActionState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message) => _showResultSheet(
            context,
            appLocalizations,
            success: false,
            message: message,
          ),
          loaded: (_) {
            context.pop();
            _showResultSheet(
              context,
              appLocalizations,
              success: true,
              message: appLocalizations.actionSavedSuccessfully,
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
                      _buildHeader(appLocalizations),
                      const SizedBox(height: 16),
                      _buildActionTypeDropdown(cubit, appLocalizations),
                      const SizedBox(height: 10),
                      _buildConditionalFields(cubit, appLocalizations),
                      _buildDateField(cubit, appLocalizations, context),
                      const SizedBox(height: 12),
                      _buildSubmitButton(cubit, appLocalizations, isLoading),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Header with icon and title
  Widget _buildHeader(AppLocalizations appLocalizations) {
    return Row(
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
    );
  }

  /// Action type dropdown
  Widget _buildActionTypeDropdown(
    AddActionCubit cubit,
    AppLocalizations appLocalizations,
  ) {
    return CustomDropdownFormField<int>(
      labelText: appLocalizations.actionType,
      hintText: appLocalizations.selectActionType,
      value: cubit.actionType,
      items: ActionType.values
          .map(
            (actionType) => DropdownMenuItem<int>(
              value: actionType.value,
              child: Text(
                ActionHelper.getActionType(actionType, appLocalizations),
              ),
            ),
          )
          .toList(),
      onChanged: (value) {
        if (value != null) {
          cubit.setActionType(value);
        }
      },
    );
  }

  /// Conditional fields based on action type
  Widget _buildConditionalFields(
    AddActionCubit cubit,
    AppLocalizations appLocalizations,
  ) {
    final actionTypeEnum = ActionType.fromValue(cubit.actionType);
    if (actionTypeEnum == null) return const SizedBox.shrink();

    // Meeting fields
    if (actionTypeEnum.isMeeting) {
      return Column(
        children: [
          _buildMeetingLocationDropdown(cubit, appLocalizations),
          const SizedBox(height: 10),
          _buildMeetingTypeDropdown(cubit, appLocalizations),
          const SizedBox(height: 10),
        ],
      );
    }

    // Deal or Interested fields
    if (actionTypeEnum.isDeal || actionTypeEnum.isInterested) {
      return Column(
        children: [
          CustomTextFormField(
            labelText: appLocalizations.unitName,
            controller: cubit.unitNameController,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            labelText: appLocalizations.floorNumber,
            controller: cubit.floorNumberController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            labelText: appLocalizations.unitPrice,
            controller: cubit.unitPriceController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
        ],
      );
    }

    // Rental fields
    if (actionTypeEnum.isRental) {
      return Column(
        children: [
          CustomTextFormField(
            labelText: appLocalizations.unitName,
            controller: cubit.unitNameController,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            labelText: appLocalizations.floorNumber,
            controller: cubit.floorNumberController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            labelText: appLocalizations.rentalPrice,
            controller: cubit.rentalPriceController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            labelText: appLocalizations.rentalPeriod,
            controller: cubit.rentalPeriodController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
        ],
      );
    }

    // Cancelled fields
    if (actionTypeEnum.isCancelled) {
      return Column(
        children: [
          CustomTextFormField(
            labelText: appLocalizations.cancelReason,
            controller: cubit.cancelReasonController,
            hintText: appLocalizations.writeCancelReason,
            maxLines: 3,
          ),
          const SizedBox(height: 10),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  /// Meeting location dropdown
  Widget _buildMeetingLocationDropdown(
    AddActionCubit cubit,
    AppLocalizations appLocalizations,
  ) {
    return CustomDropdownFormField<int>(
      value: cubit.meetingLocation,
      labelText: appLocalizations.selectMeetingLocation,
      items: const [
        DropdownMenuItem(value: 1, child: Text('Indoor')),
        DropdownMenuItem(value: 2, child: Text('Outdoor')),
      ],
      onChanged: cubit.setMeetingLocation,
    );
  }

  /// Meeting type dropdown
  Widget _buildMeetingTypeDropdown(
    AddActionCubit cubit,
    AppLocalizations appLocalizations,
  ) {
    return CustomDropdownFormField<int>(
      value: cubit.meetingType,
      labelText: appLocalizations.meetingType,
      items: const [
        DropdownMenuItem(value: 1, child: Text('Online')),
        DropdownMenuItem(value: 2, child: Text('Offline')),
      ],
      onChanged: cubit.setMeetingType,
    );
  }

  /// Date picker field
  Widget _buildDateField(
    AddActionCubit cubit,
    AppLocalizations appLocalizations,
    BuildContext context,
  ) {
    return CustomTextFormField(
      labelText: appLocalizations.actionDate,
      controller: cubit.dateController,
      readOnly: true,
      onTap: () => _selectDate(context, cubit),
    );
  }

  /// Date picker dialog
  Future<void> _selectDate(BuildContext context, AddActionCubit cubit) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      cubit.setDate(picked);
    }
  }

  /// Submit button
  Widget _buildSubmitButton(
    AddActionCubit cubit,
    AppLocalizations appLocalizations,
    bool isLoading,
  ) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return CustomButton(
      text: appLocalizations.save,
      onPressed: () {
        if (cubit.formKey.currentState!.validate()) {
          cubit.saveAction(cubit.buildActionModel(lead.id!));
        }
      },
    );
  }

  /// Show result bottom sheet
  void _showResultSheet(
    BuildContext context,
    AppLocalizations appLocalizations, {
    required bool success,
    required String message,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => SuccessBottomSheet(
        success: success,
        text: appLocalizations.addAction,
        text2: message,
      ),
    );
  }
}
