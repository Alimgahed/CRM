import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:crm/features/home/logic/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm/Core/routing/routes.dart';
import 'package:crm/features/Projects/logic/cubit/project_cubit.dart';
import 'package:crm/features/Projects/ui/screens/Allprojects.dart';
import 'package:crm/features/Projects/ui/screens/ProjectDetails.dart';
import 'package:crm/features/developers/logic/cubit/developer_cubit.dart';
import 'package:crm/features/developers/ui/screens/AllDeveloper.dart';
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
          builder: (_) => BlocProvider(
            create: (context) => getIt<LayoutCubit>(),
            child: const Layout(),
          ),
        );

      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());

      case Routes.projects:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProjectCubit>()..fetchAllProjects(),
            child: const Allprojects(),
          ),
        );

      // In your routes file
      case Routes.projectDetails:
        final project = settings!.arguments as Project;
        return MaterialPageRoute(
          builder: (_) => ProjectDetailsScreen(project: project),
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
