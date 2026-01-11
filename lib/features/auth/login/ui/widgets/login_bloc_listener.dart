import 'package:crm/Core/helpers/extesions.dart';
import 'package:crm/Core/routing/routes.dart';
import 'package:crm/features/auth/login/cubit/login_cubit.dart';
import 'package:crm/features/auth/login/cubit/login_state.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
     final lang = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

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
            builder: (context) => Center(
              child: CircularProgressIndicator(
                color: isDark ? Colors.white : Colors.blue,
              ),
            ),
          ),
          error: (message) => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
              title: Text(
                lang.loginFailed,
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),
              content: Text(
                message,
                style: TextStyle(
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(lang.ok),
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
      child: const SizedBox.shrink(),
    );
  }
}
