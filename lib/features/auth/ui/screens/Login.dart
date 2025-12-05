import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/Core/widgets/fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// lib/controllers/country_controller.dart

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16.h),

            CustomTextFormField(
              text: 'E-mail'.tr,
              iconData: Icons.email,
              hintText: 'Enter E-mail'.tr,
            ),
            SizedBox(height: 16.h),

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
            SizedBox(height: 14.h),

            SizedBox(height: 14.h),

            // ---- GOOGLE BUTTON ----
          ],
        ),
      ),
    );
  }
}
