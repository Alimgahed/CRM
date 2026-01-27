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

  // Form key
  final formKey = GlobalKey<FormState>();

  // Controllers - use lazy initialization to save memory
  TextEditingController? _dateController;
  TextEditingController get dateController =>
      _dateController ??= TextEditingController();

  // Text controllers for conditional fields
  TextEditingController? _unitNameController;
  TextEditingController? _floorNumberController;
  TextEditingController? _unitPriceController;
  TextEditingController? _rentalPriceController;
  TextEditingController? _rentalPeriodController;
  TextEditingController? _cancelReasonController;

  TextEditingController get unitNameController =>
      _unitNameController ??= TextEditingController();
  TextEditingController get floorNumberController =>
      _floorNumberController ??= TextEditingController();
  TextEditingController get unitPriceController =>
      _unitPriceController ??= TextEditingController();
  TextEditingController get rentalPriceController =>
      _rentalPriceController ??= TextEditingController();
  TextEditingController get rentalPeriodController =>
      _rentalPeriodController ??= TextEditingController();
  TextEditingController get cancelReasonController =>
      _cancelReasonController ??= TextEditingController();

  // State variables
  int? actionType;
  int? meetingType;
  int? meetingLocation;
  DateTime? date;

  /// Sets action type and clears related fields
  void setActionType(int value) {
    if (actionType == value) return; // Avoid unnecessary state changes

    actionType = value;

    // Clear dependent fields when action type changes
    meetingType = null;
    meetingLocation = null;

    // Clear text controllers for previous action type
    _clearConditionalFields();

    emit(AddActionState.actionTypeChanged(value));
  }

  /// Sets meeting type - only emits if changed
  void setMeetingType(int? value) {
    if (meetingType == value) return;
    meetingType = value;
    emit(const AddActionState.formChanged());
  }

  /// Sets meeting location - only emits if changed
  void setMeetingLocation(int? value) {
    if (meetingLocation == value) return;
    meetingLocation = value;
    emit(const AddActionState.formChanged());
  }

  /// Sets date with formatted output
  void setDate(DateTime value) {
    date = value;
    dateController.text = _formatDate(value);
    emit(const AddActionState.formChanged());
  }

  /// Formats date to ISO8601 string
  String _formatDate(DateTime dateTime) {
    return dateTime.toUtc().toIso8601String();
  }

  /// Clears conditional field controllers
  void _clearConditionalFields() {
    _unitNameController?.clear();
    _floorNumberController?.clear();
    _unitPriceController?.clear();
    _rentalPriceController?.clear();
    _rentalPeriodController?.clear();
    _cancelReasonController?.clear();
  }

  /// Saves action with validation
  Future<void> saveAction(LeadActionModel action) async {
    if (isClosed) return; // Prevent operations on closed cubit

    emit(const AddActionState.loading());

    final result = await addActionRepo.addAgentAction(action);

    if (isClosed) return; // Check again before emitting

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

  /// Builds LeadActionModel from current state
  LeadActionModel buildActionModel(int leadId) {
    return LeadActionModel(
      actionType: actionType,
      actionDate: date,
      leadId: leadId,
      meetingType: meetingType,
      meetingLocation: meetingLocation,
      unitId: _parseIntOrNull(unitNameController.text),
      unitPrice: _parseIntOrNull(unitPriceController.text),
      rentalCost: _parseIntOrNull(rentalPriceController.text),
      rentalDuration: _parseIntOrNull(rentalPeriodController.text),
      cancelReason: cancelReasonController.text.isNotEmpty
          ? cancelReasonController.text
          : null,
    );
  }

  /// Helper to parse int safely
  int? _parseIntOrNull(String value) {
    if (value.isEmpty) return null;
    return int.tryParse(value);
  }

  /// Resets all form data
  void reset() {
    formKey.currentState?.reset();

    // Clear all controllers
    _dateController?.clear();
    _clearConditionalFields();

    // Reset state
    actionType = null;
    meetingType = null;
    meetingLocation = null;
    date = null;

    emit(const AddActionState.initial());
  }

  @override
  Future<void> close() {
    // Dispose all controllers
    _dateController?.dispose();
    _unitNameController?.dispose();
    _floorNumberController?.dispose();
    _unitPriceController?.dispose();
    _rentalPriceController?.dispose();
    _rentalPeriodController?.dispose();
    _cancelReasonController?.dispose();

    return super.close();
  }
}
