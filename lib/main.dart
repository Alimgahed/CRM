

import 'package:crm/cache/cache.dart';
import 'package:crm/controller/language/language.dart';
import 'package:crm/gloable/gloable.dart';
import 'package:crm/view/home/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




double height = 0.0;
double width = 0.0;

/// Background FCM handler


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // must come first
  await Cache.init();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      width = Get.width;
      height = Get.height;
    });

    final LanguageController languageController = Get.put(LanguageController());


    return  GetMaterialApp(
        title: 'binna',
        translations: MyTranslations(),
        locale: Locale(languageController.currentLanguage ?? 'ar'),
          fallbackLocale: Locale(Cache.getdata(key: "lang") ?? "ar"),
          theme: ThemeData(
            // Default app color set to white
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Colors.white,
            fontFamily: 'Alexandria',
            colorScheme: ColorScheme.light(
          primary: Colors.white,
          surface: Colors.white,
          onPrimary: Colors.black,
            ),    // fontFamily: GoogleFonts.almarai().fontFamily,
          appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        titleTextStyle: TextStyle(color: appColor, fontSize: 22),
          ),
          progressIndicatorTheme: ProgressIndicatorThemeData(
        color: appColor, // Set CircularProgressIndicator color here
          ),
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Layout()
 
    );
  }
}
