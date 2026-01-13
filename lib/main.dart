import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/routing/app_router.dart';
import 'package:crm/crm.dart';
import 'package:flutter/material.dart';

double height = 0.0;
double width = 0.0;

/// Background FCM handler

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();

  runApp(Crm(appRouter: AppRouter()));
}
