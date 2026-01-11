import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/routing/app_router.dart';
import 'package:crm/Core/routing/routes.dart';
import 'package:crm/Core/services/user_service.dart';
import 'package:crm/Core/theming/dark_cubit.dart';
import 'package:crm/Core/theming/theme.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Crm extends StatelessWidget {
  const Crm({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    final userService = getIt<UserService>();
    final initialRoute = userService.isLoggedIn ? Routes.layout : Routes.login;

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, __) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => LocaleCubit()),
            BlocProvider(create: (_) => ThemeCubit()),
          ],
          child: BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, localeState) {
              return BlocBuilder<ThemeCubit, ThemeMode>(
                builder: (context, themeMode) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'CRM',

                    locale: Locale(localeState.locale),

                    supportedLocales: const [Locale('en'), Locale('ar')],

                    localizationsDelegates: const [
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],

                    // ✅ Theme configuration
                    theme: AppTheme.lightTheme,
                    darkTheme: AppTheme.darkTheme,
                    themeMode: themeMode,

                    onGenerateRoute: appRouter.generateRoute,
                    initialRoute: initialRoute,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
