import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/Core/widgets/fields.dart';
import 'package:crm/Core/widgets/gloable.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ReusableHeader(title: 'Forget Password'),
          heightSpace(30),
          Text(
            'Please enter your email address to reset your password',
            style: TextStyles.size14(),
            textAlign: TextAlign.center,
          ),
          heightSpace(20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
              hintText: 'Email Address',
              keyboardType: TextInputType.emailAddress,
              iconData: Icons.email,
            ),
          )
        ],
      ),
    );
  }
}
