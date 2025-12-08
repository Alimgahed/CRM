import 'package:crm/Core/widgets/fields.dart';
import 'package:crm/features/auth/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Emailandpassword extends StatefulWidget {
  const Emailandpassword({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EmailandpasswordState createState() => _EmailandpasswordState();
}

class _EmailandpasswordState extends State<Emailandpassword> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: cubit.emailController,
            text: 'E-mail',
            iconData: Icons.email,
            hintText: 'Enter E-mail',
            validator: (value) {
              // if (value == null || value.isEmpty) {
              //   return 'Please enter email';
              // }
              // if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              //   return 'Enter a valid email';
              // }
              // return null;
            },
          ),
          SizedBox(height: 16),
          CustomTextFormField.password(
            controller: cubit.passwordController,
            labelAboveField: 'Password',
            hintText: 'Enter Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
