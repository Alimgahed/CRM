import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/actions/data/repo/add_client_repo.dart';
import 'package:crm/features/actions/logic/add_client_state.dart';
import 'package:crm/features/clients/data/model/leads_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddClientCubit extends Cubit<AddClientState> {
  final AddClientRepo addClientRepo;

  AddClientCubit({required this.addClientRepo})
    : super(const AddClientState.initial());

  // ===== Form =====
  final formKey = GlobalKey<FormState>();

  // ===== Controllers =====
  final clientNameController = TextEditingController();
  final clientNameEnController = TextEditingController();
  final phoneController = TextEditingController();
  final phoneController2 = TextEditingController();
  final jobController = TextEditingController();
  final emailController = TextEditingController();
  final budgetController = TextEditingController();

  // ===== Selected Values =====
  String? projectId;
  String? salesId;
  String? channel;
  String? preferredMethod;
  int? clientStatus;

  // ===== Setters =====
  void setProject(String value) {
    projectId = value;
    emit(state);
  }

  void setSales(String value) {
    salesId = value;
    emit(state);
  }

  void setChannel(String value) {
    channel = value;
    emit(state);
  }

  void setPreferredMethod(String value) {
    preferredMethod = value;
    emit(state);
  }

  void setClientStatus(int value) {
    clientStatus = value;
    emit(state);
  }

  // ===== Validation =====
  String? validate() {
    if (!formKey.currentState!.validate()) {
      return 'Form validation failed';
    }
    if (projectId == null) return 'Please select project';
    if (salesId == null) return 'Please select sales';
    if (channel == null) return 'Please select channel';
    if (preferredMethod == null) return 'Please select preferred contact';
    if (clientStatus == null) return 'Please select client status';
    return null;
  }

  // ===== Submit =====
  Future<void> addClient() async {
    final validationError = validate();
    if (validationError != null) {
      emit(AddClientState.error(validationError));
      return;
    }

    emit(const AddClientState.loading());

    final budget = int.tryParse(budgetController.text.trim()) ?? 0;

    final lead = Lead(
      leadId: null,
      fullName: clientNameController.text.trim(),
      fullNameEn: clientNameEnController.text.trim().isNotEmpty
          ? clientNameEnController.text.trim()
          : clientNameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      secondaryPhone: phoneController2.text.trim(),
      jobTitle: jobController.text.trim(),
      budget: budget,
      assignedToId: salesId,
      preferredContactMethod: preferredMethod!,
      status: clientStatus!,
      leadSourceId: channel!,
      isDeleted: false,
      projectIds: [projectId!],
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
      companyId: null,
    );

    final result = await addClientRepo.addClient(lead);

    result.when(
      success: (data) {
        emit(AddClientState.loaded(data));
        reset();
      },
      error: (e) {
        emit(AddClientState.error(e.error ?? 'Something went wrong'));
      },
    );
  }

  void reset() {
    formKey.currentState?.reset();
    clientNameController.clear();
    clientNameEnController.clear();
    phoneController.clear();
    phoneController2.clear();
    jobController.clear();
    emailController.clear();
    budgetController.clear();

    projectId = null;
    salesId = null;
    channel = null;
    preferredMethod = null;
    clientStatus = null;
    emit(const AddClientState.initial());
  }

  @override
  Future<void> close() {
    clientNameController.dispose();
    clientNameEnController.dispose();
    phoneController.dispose();
    phoneController2.dispose();
    jobController.dispose();
    emailController.dispose();
    budgetController.dispose();
    return super.close();
  }

  final Map<String, String> leadSourceMap = {
    'Facebook': 'GUID_FACEBOOK',
    'Direct': 'GUID_DIRECT',
    'Google': 'GUID_GOOGLE',
    'TikTok': 'GUID_TIKTOK',
    'Snapchat': 'GUID_SNAPCHAT',
    'Youtube': 'GUID_YOUTUBE',
    'Instagram': 'GUID_INSTAGRAM',
  };
}
