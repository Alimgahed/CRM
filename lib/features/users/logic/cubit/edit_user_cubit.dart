import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/auth/login/data/model/roles_model.dart';
import 'package:crm/features/auth/login/data/model/users_model.dart';
import 'package:crm/features/users/data/repo/add_user_repo.dart';
import 'package:crm/features/users/logic/cubit/users_cubit.dart';
import 'package:crm/features/users/logic/states/edit_user_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUserCubit extends Cubit<EditUserState> {
  final AddUserRepo editUserRepo;
  final UsersCubit usersCubit;

  EditUserCubit({required this.editUserRepo, required this.usersCubit})
    : super(const EditUserState.initial());

  final formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final userPasswordController = TextEditingController();
  final userEmailController = TextEditingController();
  final userPhoneController = TextEditingController();

  int? userLeadId;
  bool? isActive;
  List<Role> userRoles = [];

  bool isEditMode = false;
  int? editingUserId;

  /// Initialize form with existing user data for editing
  void initializeForEdit(UsersModel user) {
    isEditMode = true;
    editingUserId = user.id;

    userNameController.text = user.fullName;
    userEmailController.text = user.email;
    userPhoneController.text = user.phone ?? '';
    userPasswordController.clear();

    userLeadId = user.leaderId;
    isActive = user.isActive ?? false;

    if (user.roles != null && user.roles!.isNotEmpty) {
      userRoles = List.from(user.roles!);
    }
  }

  void addUserRole(Role value) {
    if (!userRoles.any((r) => r.id == value.id)) {
      userRoles.clear();
      userRoles.add(value);
    }
  }

  void setUserLeadId(int value) {
    userLeadId = value;
  }

  void setUserType(bool value) {
    isActive = value;
  }

  /// Edit existing user (for full edit form)
  Future<void> editUser(UsersModel user) async {
    emit(const EditUserState.loading());

    final result = await editUserRepo.addUser(user);

    result.when(
      success: (data) {
        emit(EditUserState.loaded(data));
        // Refresh the users list
        usersCubit.getAllUsers();
        reset();
      },
      error: (e) {
        emit(EditUserState.error(e.error ?? 'Failed to update user'));
      },
    );
  }

  /// Quick toggle for user active status with screen refresh
  Future<void> toggleUserStatus(UsersModel user) async {
    final updatedUser = UsersModel(
      id: user.id,
      fullName: user.fullName,
      email: user.email,
      phone: user.phone,
      passwordHash: user.passwordHash,
      leaderId: user.leaderId,
      roles: user.roles,
      isActive: !(user.isActive ?? false),
      photoUrl: user.photoUrl,
      permissions: user.permissions,
      isDeleted: user.isDeleted,
    );

    final result = await editUserRepo.addUser(updatedUser);

    result.when(
      success: (data) async {
        // Emit loaded state to show success message
        emit(EditUserState.loaded(data));

        // CRITICAL: Await the refresh to ensure UI updates
        await usersCubit.getAllUsers();

        // Reset to initial state after refresh completes
        Future.delayed(const Duration(milliseconds: 100), () {
          if (!isClosed) {
            emit(const EditUserState.initial());
          }
        });
      },
      error: (e) {
        emit(EditUserState.error(e.error ?? 'Failed to toggle status'));
        // Reset error state after showing
        Future.delayed(const Duration(seconds: 2), () {
          if (!isClosed) {
            emit(const EditUserState.initial());
          }
        });
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
    isEditMode = false;
    editingUserId = null;

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
