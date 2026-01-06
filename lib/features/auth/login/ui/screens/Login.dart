import 'package:crm/Core/helpers/extesions.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/routing/routes.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/auth/login/cubit/login_cubit.dart';
import 'package:crm/features/auth/login/cubit/login_state.dart';
import 'package:crm/features/auth/login/data/model/login_request_body.dart';
import 'package:crm/features/auth/login/ui/widgets/emailandpassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        // Handle Side Effects INSIDE builder
        WidgetsBinding.instance.addPostFrameCallback((_) {
          state.whenOrNull(
            error: (msg) {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Login Failed"),
                  content: Text(msg),
                ),
              );
            },
            loaded: (_) {
              context.pushReplacementNamed(Routes.layout);
            },
          );
        });

        return Scaffold(
          backgroundColor: Colors.white,
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          heightSpace(40),
                          SvgPicture.asset(
                            'images/Group.svg',
                            width: 100.w,
                            height: 100.h,
                          ),
                          heightSpace(10),
                          Text("AQARIA", style: TextStyles.size20()),
                          heightSpace(5),
                          Text(
                            'Real Estate CRM System',
                            style: TextStyles.size16(color: appColor),
                          ),
                          heightSpace(20),

                          const Emailandpassword(),

                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () =>
                                  context.pushNamed(Routes.forgotPassword),
                              child: Text(
                                "Forgot Password?",
                                style: TextStyles.size14(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          heightSpace(10),

                          /// ------------------------
                          /// LOGIN BUTTON
                          /// ------------------------
                          if (state is LoginStateLoading)
                            const CircularProgressIndicator()
                          else
                            CustomButton(
                              text: "Login",
                              onPressed: () => validateLogin(context),
                              height: 45.h,
                            ),

                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void validateLogin(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    if (cubit.formKey.currentState!.validate()) {
      cubit.login(
        LoginRequestBody(
          email: cubit.emailController.text,
          password: cubit.passwordController.text,
        ),
      );
    }
  }
}
