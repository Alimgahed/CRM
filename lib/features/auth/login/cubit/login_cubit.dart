import 'package:bloc/bloc.dart';
import 'package:crm/Core/helpers/shared_preference_contatnt.dart';
import 'package:crm/Core/helpers/shared_preferences.dart';
import 'package:crm/features/auth/login/data/model/login_request_body.dart';
import 'package:crm/features/auth/login/data/repos/login_repo.dart';
import 'package:crm/features/auth/login/cubit/login_state.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit({required this.loginRepo}) : super(LoginState.initial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login(LoginRequestBody loginRequestBody) async {
    if (!formKey.currentState!.validate()) return;

    emit(LoginState.loading());

    final requestBody = LoginRequestBody(
      email: emailController.text,
      password: passwordController.text,
    );

    final result = await loginRepo.login(requestBody);

    result.when(
      success: (data) {
        saveToken(data.token);
        emit(LoginState.loaded(data));
      },
      error: (error) =>
          emit(LoginState.error(error.error ?? 'An unknown error occurred')),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
  Future<void> saveToken(String token) async {
    await SharedPreferencesHelper.setSecureString(SharedPreferenceKeys.userToken, token);
  }
}
