import 'package:crm/Core/routing/app_router.dart';
import 'package:crm/Core/routing/routes.dart';
import 'package:crm/Core/theming/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Crm extends StatelessWidget {
  const Crm({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: GetMaterialApp(
        title: 'CRM',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.layout, // ⭐ REQUIRED
      ),
    );
  }
}
