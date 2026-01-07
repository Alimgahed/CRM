import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/routing/routes.dart';
import 'package:crm/features/Projects/data/model/project_response.dart';
import 'package:crm/features/Projects/logic/cubit/project_cubit.dart';
import 'package:crm/features/Projects/ui/screens/Allprojects.dart';
import 'package:crm/features/Projects/ui/screens/ProjectDetails.dart';
import 'package:crm/features/developers/logic/cubit/developer_cubit.dart';
import 'package:crm/features/developers/ui/screens/AllDeveloper.dart';
import 'package:crm/features/home/logic/cubit/layout_cubit.dart';
import 'package:crm/features/home/ui/screens/home.dart';
import 'package:crm/features/home/ui/screens/layout.dart';
import 'package:crm/features/auth/login/ui/screens/Login.dart';
import 'package:crm/features/auth/forget_password/ui/forget_password.dart';
import 'package:crm/features/Onbordinng/onbording.dart';
import 'package:crm/features/splash_screen/splash.dart';

class AppRouter {
  Route generateRoute(RouteSettings? settings) {
    final args = settings?.arguments;

    switch (settings?.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.login:
        return MaterialPageRoute(builder: (_) => const Login());

      case Routes.home:
        return MaterialPageRoute(builder: (_) => Home());

      case Routes.layout:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<LayoutCubit>()),
              BlocProvider(
                create: (_) => getIt<ProjectCubit>()..fetchAllProjects(),
              ),
              BlocProvider(
                create: (_) =>
                    getIt<DeveloperCubit>()..fetchAllDevelopmentCompanies(),
              ),
            ],
            child: const Layout(),
          ),
        );

      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());

      case Routes.projects:
        if (args is Map<String, dynamic>) {
          return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider.value(value: args['projectCubit'] as ProjectCubit),
                BlocProvider.value(
                  value: args['developerCubit'] as DeveloperCubit,
                ),
              ],
              child: const Allprojects(),
            ),
          );
        }
        throw Exception(
          'Projects route requires arguments: projectCubit and developerCubit',
        );

      case Routes.projectDetails:
        if (args is Map<String, dynamic> && args['project'] != null) {
          return MaterialPageRoute(
            builder: (_) =>
                ProjectDetailsScreen(project: args['project'] as Project),
          );
        }
        throw Exception(
          'ProjectDetails route requires a ProjectResponse as argument',
        );

      case Routes.allDevelopers:
        if (args is Map<String, dynamic>) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: args['developerCubit'] as DeveloperCubit,
              child: const AllDevelopers(),
            ),
          );
        }
        throw Exception('AllDevelopers route requires developerCubit argument');

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings?.name}')),
          ),
        );
    }
  }
}
