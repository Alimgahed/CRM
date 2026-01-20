import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/auth/login/data/model/users_model.dart';
import 'package:crm/features/users/data/repo/edit_user_repo.dart';
import 'package:crm/features/users/logic/states/edit_user_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUserCubit extends Cubit<EditUserState> {
  final EditUserRepo editUserRepo;

  EditUserCubit({required this.editUserRepo})
    : super(const EditUserState.initial());

  final formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final userPasswordController = TextEditingController();
  final userEmailController = TextEditingController();
  final userPhoneController = TextEditingController();
  int? userLeadId;
  bool? isActive;
  int? userRolesId;
  void setUserRoleId(int value) {
    userRolesId = value;
  }

  void setUserLeadId(int value) {
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
  Future<void> editUser(int id) async {
    if (!formKey.currentState!.validate()) return;

    emit(const EditUserState.loading());

    final user = UsersModel(
      roles: [],

      isActive: isActive!,
      id: 0,
      fullName: userNameController.text.trim(),
      email: '',
      userType: 0,
      isDeleted: false,
      createdAt: '',
      updatedAt: '',
      companyId: 0,
      permissions: {},
    );

    final result = await editUserRepo.editUser(id, user);

    result.when(
      success: (data) {
        emit(EditUserState.loaded(data));
        reset();
      },
      error: (e) {
        emit(EditUserState.error(e.error!));
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

    emit(const EditUserState.initial());
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
