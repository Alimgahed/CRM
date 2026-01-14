import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/actions/data/repo/add_client_repo.dart';
import 'package:crm/features/actions/logic/add_client_state.dart';
import 'package:crm/features/clients/data/model/leads_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddClientCubit extends Cubit<AddClientState> {
  final AddClientRepo addClientRepo;

  AddClientCubit({required this.addClientRepo})
    : super(AddClientState.initial());

  // Form Key for validation
  final formKey = GlobalKey<FormState>();

  // Text Controllers
  final clientNameController = TextEditingController();
  final clientNameEnController = TextEditingController();
  final assignedToController = TextEditingController();
  final expirationDateController = TextEditingController();
  final phoneController = TextEditingController();
  final phoneController2 = TextEditingController();
  final taskDescriptionController = TextEditingController();
  final emailController = TextEditingController();
  final budgetController = TextEditingController();

  // State fields
  String projectName = '';
  String channel = '';
  String preferredMethod = '';
  String clientStatus = '';
  String taskPriority = '';

  /// Update project name and rebuild UI
  void updateProjectName(String value) {
    projectName = value;
    emit(state);
  }

  /// Update channel and rebuild UI
  void updateChannel(String value) {
    channel = value;
    emit(state);
  }

  /// Update preferred method and rebuild UI
  void updatePreferredMethod(String value) {
    preferredMethod = value;
    emit(state);
  }

  /// Update client status and rebuild UI
  void updateClientStatus(String value) {
    clientStatus = value;
    emit(state);
  }

  /// Update task priority and rebuild UI
  void updateTaskPriority(String value) {
    taskPriority = value;
    emit(state);
  }

  /// Validate form fields
  String? validateForm() {
    // First validate using FormKey
    if (formKey.currentState != null && !formKey.currentState!.validate()) {
      return 'Please fill all required fields correctly';
    }

    if (taskPriority.isEmpty) {
      return 'Please select a project';
    }
    if (channel.isEmpty) {
      return 'Please select a channel';
    }
    if (preferredMethod.isEmpty) {
      return 'Please select preferred contact method';
    }
    if (clientStatus.isEmpty) {
      return 'Please select client status';
    }

    return null;
  }

  /// Add a new client
  Future<void> addClient(BuildContext context) async {
    emit(AddClientState.loading());

    int? budget;
    if (budgetController.text.trim().isNotEmpty) {
      budget = int.tryParse(budgetController.text.trim());
    }

    final requestBody = Lead(
      leadId: '',
      fullName: clientNameController.text.trim(),
      fullNameEn: clientNameEnController.text.trim().isNotEmpty
          ? clientNameEnController.text.trim()
          : clientNameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      secondaryPhone: phoneController2.text.trim(),
      jobTitle: taskDescriptionController.text.trim(),
      budget: budget ?? 0,
      preferredContactMethod: preferredMethod,
      status: _mapStatusToInt(clientStatus),
      leadSourceId: channel,
      isDeleted: false,
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
      companyId: '',
    );

    final result = await addClientRepo.addClient(requestBody);

    result.when(
      success: (data) {
        emit(AddClientState.loaded(data));
        resetForm();
      },
      error: (errorModel) {
        emit(
          AddClientState.error(errorModel.error ?? 'An unknown error occurred'),
        );
      },
    );
  }

  /// Map status string to integer
  int _mapStatusToInt(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return 1;
      case 'inactive':
        return 0;
      default:
        return 1;
    }
  }

  /// Reset all form fields
  void resetForm() {
    formKey.currentState?.reset();

    clientNameController.clear();
    clientNameEnController.clear();
    assignedToController.clear();
    expirationDateController.clear();
    taskDescriptionController.clear();
    phoneController.clear();
    phoneController2.clear();
    emailController.clear();
    budgetController.clear();

    projectName = '';
    channel = '';
    preferredMethod = '';
    clientStatus = '';
    taskPriority = '';

    emit(AddClientState.initial());
  }

  @override
  Future<void> close() {
    clientNameController.dispose();
    clientNameEnController.dispose();
    assignedToController.dispose();
    expirationDateController.dispose();
    taskDescriptionController.dispose();
    phoneController.dispose();
    phoneController2.dispose();
    emailController.dispose();
    budgetController.dispose();

    return super.close();
  }
}
