import 'package:crm/Core/routing/routes.dart';
import 'package:crm/features/Onbordinng/onbording.dart';
import 'package:crm/features/auth/ui/screens/Login.dart';
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
        return MaterialPageRoute(builder: (_) => const Login());
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
