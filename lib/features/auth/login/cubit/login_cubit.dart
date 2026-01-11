import 'package:bloc/bloc.dart';
import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/network/api_result.dart';
import 'package:crm/Core/services/user_service.dart';
import 'package:crm/features/auth/login/data/model/login_request_body.dart';
import 'package:crm/features/auth/login/data/repos/login_repo.dart';
import 'package:crm/features/auth/login/cubit/login_state.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  final UserService _userService = getIt<UserService>();

  LoginCubit({required this.loginRepo}) : super(LoginState.initial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    emit(LoginState.loading());

    final requestBody = LoginRequestBody(
      username: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    final result = await loginRepo.login(requestBody);

    result.when(
      success: (data) async {
        await _userService.saveToken(data.accessToken, data.refreshToken);
        await _userService.saveUser(data.user);

        emit(LoginState.loaded(data));
      },
      error: (errorModel) {
        emit(LoginState.error(errorModel.error ?? 'An unknown error occurred'));
      },
    );
  }

  Future<void> logout() async {
    await _userService.clearUser();
    emit(LoginState.initial());
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
