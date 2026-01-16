import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/users/data/model/add_user_model.dart';
import 'package:crm/features/users/data/repo/add_user_repo.dart';
import 'package:crm/features/users/logic/states/add_user_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUserCubit extends Cubit<AddUserState> {
  final AddUserRepo addUserRepo;

  AddUserCubit({required this.addUserRepo})
    : super(const AddUserState.initial());

  // ===== Form =====
  final formKey = GlobalKey<FormState>();

  // ===== Controllers =====
  final userNameController = TextEditingController();
  final userPasswordController = TextEditingController();
  final userEmailController = TextEditingController();
  final userPhoneController = TextEditingController();

  // ===== Selected Values =====
  String? userLeadId;
  bool? isActive;
  String? userRolesId;

  // ===== Setters =====
  void setUserRoleId(String value) {
    userRolesId = value;
  }

  void setUserLeadId(String value) {
    userLeadId = value;
  }

  void setUserType(bool value) {
    isActive = value;
  }

  // ===== Validation =====
  String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Invalid email format';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    if (value.trim().length < 10) {
      return 'Phone number must be at least 10 digits';
    }
    return null;
  }

  // ===== Submit =====
  Future<void> addUser() async {
    // Prevent multiple submissions
    if (state is AddUserLoading) return;

    // Validate form first
    if (!formKey.currentState!.validate()) return;

    // Validate required dropdowns

    emit(const AddUserState.loading());

    final user = AddUserModel(
      fullName: userNameController.text.trim(),
      email: userEmailController.text.trim(),
      roleIds: userRolesId!,
      leaderId: userLeadId,
      password: userPasswordController.text.trim(),
      phone: userPhoneController.text.trim(),
      isActive: isActive!,
    );

    final result = await addUserRepo.addUser(user);

    result.when(
      success: (data) {
        emit(AddUserState.loaded(data));
        reset();
      },
      error: (e) {
        emit(AddUserState.error(e.error.toString()));
      },
    );
  }

  void reset() {
    formKey.currentState?.reset();
    userNameController.clear();
    userPasswordController.clear();
    userEmailController.clear();
    userPhoneController.clear();
    userRolesId = null;
    userLeadId = null;
    isActive = null;

    emit(const AddUserState.initial());
  }

  @override
  Future<void> close() {
    userNameController.dispose();
    userPasswordController.dispose();
    userEmailController.dispose();
    userPhoneController.dispose();
    return super.close();
  }
}
