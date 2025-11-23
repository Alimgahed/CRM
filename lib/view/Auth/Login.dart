import 'package:crm/gloable/Reusable_widget/buttons.dart';
import 'package:crm/gloable/Reusable_widget/fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// lib/controllers/country_controller.dart

class Login extends StatelessWidget {
  Login({super.key});

  static const double _space = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Login'.tr)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: _space),

            CustomTextFormField(
              text: 'E-mail'.tr,
              iconData: Icons.email,
              labelText: 'Enter E-mail'.tr,
            ),
            const SizedBox(height: _space),

            CustomTextFormField.password(
              // controller: _passwordController,
              labelAboveField: 'Password'.tr,
              hintText: 'Enter Password'.tr,
              validator: (value) {
                if (value == null || value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 8),

            Text('Forgot Password?'.tr, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 12),

            CustomButton(height: 45, text: "Login".tr, onPressed: () {}),
            const SizedBox(height: 14),

            const SizedBox(height: 14),

            // ---- GOOGLE BUTTON ----
          ],
        ),
      ),
    );
  }
}
