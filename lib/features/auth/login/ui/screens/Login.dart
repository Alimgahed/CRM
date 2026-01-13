import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/helpers/extesions.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/routing/routes.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/dark_cubit.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/auth/login/cubit/login_cubit.dart';
import 'package:crm/features/auth/login/cubit/login_state.dart';
import 'package:crm/features/auth/login/ui/widgets/emailandpassword.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: const _LoginContent(),
    );
  }
}

class _LoginContent extends StatelessWidget {
  const _LoginContent();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginStateError || current is LoginStateLoaded,
      listener: (context, state) {
        state.whenOrNull(
          error: (msg) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(msg),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 3),
              ),
            );
          },
          loaded: (_) {
            context.pushReplacementNamed(Routes.layout);
          },
        );
      },
      child: const _LoginScaffold(),
    );
  }
}

class _LoginScaffold extends StatelessWidget {
  const _LoginScaffold();

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;

    return Scaffold(
      backgroundColor: isDark ? darkColor : fieldColor,
      body: const SafeArea(child: _LoginBody()),
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const _LoginHeader(),
                heightSpace(30),
                const Emailandpassword(),
                const _ForgotPasswordButton(),
                heightSpace(20),
                const _LoginButton(),
                const Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _LoginHeader extends StatelessWidget {
  const _LoginHeader();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lang = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return Column(
      children: [
        SvgPicture.asset(
          'images/Group.svg',
          width: 100.w,
          height: 100.h,
          colorFilter: isDark
              ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
              : null,
        ),
        heightSpace(10),
        Text(
          lang.aqaria,
          style: TextStyles.size20(
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        heightSpace(5),
        Text(
          lang.realEstateCrmSystem,
          style: TextStyles.size16(color: appColor),
        ),
      ],
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lang = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => context.pushNamed(Routes.forgotPassword),
        child: Text(
          lang.forgotPassword,
          style: TextStyles.size14(
            fontWeight: FontWeight.w400,
            color: isDark ? Colors.white70 : Colors.black87,
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    final lang = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return BlocSelector<LoginCubit, LoginState, bool>(
      selector: (state) => state is LoginStateLoading,
      builder: (context, isLoading) {
        if (isLoading) {
          return SizedBox(
            height: 45.h,
            child: Center(
              child: CircularProgressIndicator(color: appColor, strokeWidth: 2),
            ),
          );
        }

        return CustomButton(
          text: lang.login,
          onPressed: () => _validateAndLogin(context),
          height: 45.h,
          backgroundColor: appColor,
          textColor: Colors.white,
        );
      },
    );
  }

  void _validateAndLogin(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    if (cubit.formKey.currentState?.validate() ?? false) {
      cubit.login();
    }
  }
}
