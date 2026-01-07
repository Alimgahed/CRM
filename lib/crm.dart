import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/routing/app_router.dart';
import 'package:crm/Core/routing/routes.dart';
import 'package:crm/Core/services/user_service.dart';
import 'package:crm/Core/theming/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Crm extends StatelessWidget {
  const Crm({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    // ⭐ Check if user is logged in
    final userService = getIt<UserService>();
    final initialRoute = userService.isLoggedIn ? Routes.layout : Routes.login;

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'CRM',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: initialRoute, // ⭐ Dynamic based on login status
      ),
    );
  }
}
