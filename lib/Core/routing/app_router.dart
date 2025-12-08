import 'package:crm/features/Projects/data/model/project_response.dart';
import 'package:crm/features/Projects/logic/cubit/project_cubit.dart';
import 'package:crm/features/Projects/ui/screens/Allprojects.dart';
import 'package:crm/features/Projects/ui/screens/ProjectDetails.dart';
import 'package:crm/features/auth/forget_password/ui/forget_password.dart';
import 'package:crm/features/developers/data/models/developers_response.dart';
import 'package:crm/features/developers/logic/cubit/developer_cubit.dart';
import 'package:crm/features/developers/ui/screens/AllDeveloper.dart';
import 'package:crm/features/home/ui/screens/home.dart';
import 'package:crm/features/home/ui/screens/layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/routing/routes.dart';
import 'package:crm/features/Onbordinng/onbording.dart';
import 'package:crm/features/auth/login/cubit/login_cubit.dart';
import 'package:crm/features/auth/login/ui/screens/Login.dart';
import 'package:crm/features/splash_screen/splash.dart';
import 'package:flutter/material.dart';


class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => BlocProvider<LoginCubit>(
              create: (context) => getIt<LoginCubit>(),
              child: const Login(),
            ));
             case Routes.home:
        return MaterialPageRoute(builder: (_) => const Home());
           case Routes.layout:
        return MaterialPageRoute(builder: (_) => const Layout());

          case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
         case Routes.projects:
        return MaterialPageRoute(builder: (_) => 
        BlocProvider<ProjectCubit>(
          create: (context) => getIt<ProjectCubit>()..fetchAllProjects(),
          child: const Allprojects(),
        ));

        case Routes.projectDetails:
  final project = settings.arguments as ProjectResponse;
  return MaterialPageRoute(
    builder: (_) => ProjectDetailsScreen(project: project),
  );
  case Routes.allDevelopers:
  return MaterialPageRoute(
    builder: (_) => BlocProvider<DeveloperCubit>(
      create: (context) => getIt<DeveloperCubit>()..fetchAllDevelopmentCompanies(),
      child: const AllDevelopers(),
    ),
  );
        
        

      // Define your routes here
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
