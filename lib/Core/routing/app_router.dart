import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:crm/features/Units/data/models/unit_model.dart';
import 'package:crm/features/Units/logic/cubit/unit_cubit.dart';
import 'package:crm/features/Units/ui/screens/AllUnit.dart';
import 'package:crm/features/Units/ui/screens/UnitDetails.dart';
import 'package:crm/features/home/logic/cubit/layout_cubit.dart';
import 'package:crm/features/owners/logic/cubit/owner_cubit.dart';
import 'package:crm/features/owners/ui/screens/allOwner.dart';
import 'package:crm/features/statistics/logic/statistics_cubit.dart';
import 'package:crm/features/tasks/logic/cubit/task_cubit.dart';
import 'package:crm/features/tasks/ui/screens/alltasks_screen.dart';
import 'package:crm/features/users/logic/cubit/users_cubit.dart';
import 'package:crm/features/users/ui/screens/User_managment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm/Core/routing/routes.dart';
import 'package:crm/features/Projects/logic/cubit/project_cubit.dart';
import 'package:crm/features/Projects/ui/screens/Allprojects.dart';
import 'package:crm/features/Projects/ui/screens/ProjectDetails.dart';
import 'package:crm/features/developers/logic/cubit/developer_cubit.dart';
import 'package:crm/features/developers/ui/screens/AllDeveloper.dart';
import 'package:crm/features/home/ui/screens/layout.dart';
import 'package:crm/features/auth/login/ui/screens/Login.dart';
import 'package:crm/features/auth/forget_password/ui/forget_password.dart';
import 'package:crm/features/Onbordinng/onbording.dart';
import 'package:crm/features/splash_screen/splash.dart';

class AppRouter {
  Route generateRoute(RouteSettings? settings) {
    switch (settings?.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.login:
        return MaterialPageRoute(builder: (_) => const Login());

      case Routes.layout:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<LayoutCubit>()),

              BlocProvider(
                create: (_) => getIt<StatisticsCubit>()..getStatistics(),
              ),
            ],
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
      case Routes.unitDetails:
        final unit = settings!.arguments as Unit;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<OwnerCubit>()..getAllOwners(),
            child: UnitDetailsScreen(unit: unit),
          ),
        );

      case Routes.allDevelopers:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<DeveloperCubit>()..fetchAllDevelopmentCompanies(),
            child: const AllDevelopers(),
          ),
        );
      case Routes.usersmanamgment:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<UsersCubit>()..getAllUsers(),
            child: const UserManagement(),
          ),
        );
      case Routes.units:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<UnitCubit>()..getUnits(),
            child: const Allunit(),
          ),
        );
      case Routes.allOwners:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<OwnerCubit>()..getAllOwners(),
            child: const AllOwners(),
          ),
        );
      case Routes.allTasks:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<TaskCubit>()..getAllTasks(),
            child: const AllTasksScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings?.name}')),
          ),
        );
    }
  }
}
