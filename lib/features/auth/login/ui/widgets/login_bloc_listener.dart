import 'package:crm/Core/helpers/extesions.dart';
import 'package:crm/Core/routing/routes.dart';
import 'package:crm/features/auth/login/cubit/login_cubit.dart';
import 'package:crm/features/auth/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) =>
            current is LoginStateLoading ||
            current is LoginStateError ||
            current is LoginStateLoaded,
        listener: (context, state) {
          state.whenOrNull(
            loading: () => showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            ),
            error: (message) => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Login Failed'),
                content: Text(message),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
            loaded: (loginresponse) {
              context.pop();
              context.pushReplacementNamed(Routes.home);
            },
          );
        },
        child: const SizedBox.shrink());
  }
}
