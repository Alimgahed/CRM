import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/auth/login/data/model/roles_model.dart';
import 'package:crm/features/auth/login/data/model/users_model.dart';
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
  int? userLeadId;
  bool? isActive;
  List<Role> userRoles = [];

  // ===== Setters =====
  void addUserRole(Role value) {
    if (!userRoles.any((r) => r.id == value.id)) {
      userRoles.clear();
      userRoles.add(value);
    }
  }

  void setUserLeadId(int value) {
    userLeadId = value;
  }

  void setUserActive(bool value) {
    isActive = value;
  }

  // ===== Validation =====

  // ===== Submit =====
  Future<void> addUser() async {
    // Prevent multiple submissions
    if (state is AddUserLoading) return;

    // Validate form first
    if (!formKey.currentState!.validate()) return;

    // Validate required dropdowns

    emit(const AddUserState.loading());

    final user = UsersModel(
      fullName: userNameController.text,
      email: userEmailController.text,
      phone: userPhoneController.text,
      passwordHash: userPasswordController.text,
      leaderId: userLeadId,
      roles: userRoles,
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
    userRoles = [];
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
