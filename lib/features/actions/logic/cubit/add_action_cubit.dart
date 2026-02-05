import 'package:crm/Core/helpers/date_format.dart';
import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/actions/data/model/lead_action_model.dart';
import 'package:crm/features/actions/data/repo/add_action_repo.dart';
import 'package:crm/features/actions/logic/state/add_action_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddActionCubit extends Cubit<AddActionState> {
  final AddActionRepo addActionRepo;

  AddActionCubit({required this.addActionRepo})
    : super(const AddActionState.initial());

  /// Form key
  final formKey = GlobalKey<FormState>();

  /// Controllers
  final dateController = TextEditingController();
  final floorNumberController = TextEditingController();
  final unitPriceController = TextEditingController();
  final rentalPriceController = TextEditingController();
  final rentalPeriodController = TextEditingController();
  final cancelReasonController = TextEditingController();

  /// 🔴 IMPORTANT
  /// selectedActionId   -> backend
  /// selectedActionType -> UI logic (enum)
  int? selectedActionId;
  int? selectedUnitId;
  int? selectedActionType;

  int? meetingType;
  int? meetingLocation;
  DateTime? date;

  /// Called from dropdown
  void setAction({required int actionId, required int actionType}) {
    selectedActionId = actionId;
    selectedActionType = actionType;
    selectedUnitId = null;

    meetingType = null;
    meetingLocation = null;
    _clearConditionalFields();

    emit(const AddActionState.formChanged());
  }

  void setMeetingType(int? value) {
    meetingType = value;
    emit(const AddActionState.formChanged());
  }

  void setMeetingLocation(int? value) {
    meetingLocation = value;
    emit(const AddActionState.formChanged());
  }

  void setDate(DateTime value) {
    date = value;
    dateController.text = DateUtilsHelper.toUtcString(value);
    emit(const AddActionState.formChanged());
  }

  Future<void> saveAction(int leadId) async {
    emit(const AddActionState.loading());

    final result = await addActionRepo.addAgentAction(buildActionModel(leadId));

    result.when(
      success: (data) {
        emit(AddActionState.loaded(data));
        reset();
      },
      error: (e) {
        emit(AddActionState.error(e.error ?? 'Something went wrong'));
      },
    );
  }

  LeadActionModel buildActionModel(int leadId) {
    return LeadActionModel(
      leadId: leadId,
      companyActionId: selectedActionId,
      actionType: selectedActionType,
      actionDate: DateUtilsHelper.toUtcString(date),
      meetingType: meetingType,
      meetingLocation: meetingLocation,
      unitId: selectedUnitId,
      unitPrice: unitPriceController.parseAsDouble,
      rentalCost: rentalPriceController.parseAsDouble,
      rentalDuration: _parseInt(rentalPeriodController.text),
      cancelReason: cancelReasonController.text.isEmpty
          ? null
          : cancelReasonController.text,
    );
  }

  int? _parseInt(String v) => v.isEmpty ? null : int.tryParse(v);

  void _clearConditionalFields() {
    selectedUnitId = null;
    floorNumberController.clear();
    unitPriceController.clear();
    rentalPriceController.clear();
    rentalPeriodController.clear();
    cancelReasonController.clear();
  }

  void reset() {
    formKey.currentState?.reset();

    selectedActionId = null;
    selectedActionType = null;
    meetingType = null;
    meetingLocation = null;
    date = null;

    dateController.clear();
    _clearConditionalFields();

    emit(const AddActionState.initial());
  }

  @override
  Future<void> close() {
    dateController.dispose();
    floorNumberController.dispose();
    unitPriceController.dispose();
    rentalPriceController.dispose();
    rentalPeriodController.dispose();
    cancelReasonController.dispose();
    return super.close();
  }
}
