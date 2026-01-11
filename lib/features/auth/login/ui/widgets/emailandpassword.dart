import 'package:crm/Core/widgets/fields.dart';
import 'package:crm/features/auth/login/cubit/login_cubit.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// OPTIMIZATION 1: Make StatelessWidget - no state needed
class Emailandpassword extends StatelessWidget {
  const Emailandpassword({super.key});

  @override
  Widget build(BuildContext context) {
    // OPTIMIZATION 2: Read cubit once (not watching for changes)
    final cubit = context.read<LoginCubit>();
    
    // OPTIMIZATION 3: Cache localization with select
    final lang = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return Form(
      key: cubit.formKey,
      // OPTIMIZATION 4: AutovalidateMode for better UX
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          // OPTIMIZATION 5: Add key for widget identity (prevents unnecessary rebuilds)
          CustomTextFormField(
            key: const ValueKey('email_field'),
            controller: cubit.emailController,
            text: lang.email,
            iconData: Icons.email,
            hintText: lang.enterEmail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            // OPTIMIZATION 6: Proper email validation
            validator: (value) {
              if (value == null || value.isEmpty) {
                return lang.enterEmail;
              }
              // Simple email regex
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value)) {
                return lang.invalidEmail;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextFormField.password(
            key: const ValueKey('password_field'),
            controller: cubit.passwordController,
            labelAboveField: lang.password,
            hintText: lang.enterPassword,
            textInputAction: TextInputAction.done,
            // OPTIMIZATION 7: Submit form on done
            onFieldSubmitted: (_) => _submitForm(context),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return lang.enterPassword;
              }
              if (value.length < 8) {
                return lang.passwordMustBeAtLeast8CharactersLong;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  void _submitForm(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    if (cubit.formKey.currentState?.validate() ?? false) {
      cubit.login();
    }
  }
}