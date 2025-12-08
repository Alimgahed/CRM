import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/routing/app_router.dart';
import 'package:crm/crm.dart';
import 'package:flutter/material.dart';

double height = 0.0;
double width = 0.0;

/// Background FCM handler

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();

  runApp(Crm(appRouter: AppRouter()));
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       width = Get.width;
//       height = Get.height;
//     });

//     final LanguageController languageController = Get.put(LanguageController());

//     return GetMaterialApp(
//       title: 'binna',
//       debugShowCheckedModeBanner: false,

//       translations: MyTranslations(),
//       locale: Locale(languageController.currentLanguage ?? 'ar'),
//       supportedLocales: const [Locale('en'), Locale('ar')],
//       localizationsDelegates: const [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       fallbackLocale: Locale(Cache.getdata(key: "lang") ?? "ar"),
//       theme: AppTheme.lightTheme,
//       home: Layout(),
//     );
//   }
// }
