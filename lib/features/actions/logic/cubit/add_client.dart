import 'package:crm/Core/helpers/date_format.dart';
import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/actions/data/repo/add_client_repo.dart';
import 'package:crm/features/actions/logic/state/add_client_state.dart';
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

  // ===== Submit =====
  Future<void> addClient() async {
    if (salesId == null ||
        preferredMethod == null ||
        channel == null ||
        projectId == null) {
      emit(const AddClientState.error('Please fill all required fields'));
      return;
    }

    emit(AddClientState.loading());

    final budget = budgetController.parseAsDouble;

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
      assignedToId: salesId!,
      preferredContactMethod: preferredMethod!,
      status: 1,
      leadSourceId: channel!,
      isDeleted: false,
      projectIds: [projectId!],
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
}
