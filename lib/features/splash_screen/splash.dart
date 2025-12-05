import 'package:crm/cache/cache.dart';
import 'package:crm/features/Onbordinng/onbording.dart';
import 'package:crm/features/home/ui/screens/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Delay navigation using GetX (no StatefulWidget needed)
    Future.delayed(const Duration(seconds: 2), () {
      if(Cache.getdata(key: 'onboarding') == true){
        Get.off(() => const Layout());
      } else{      Get.off(() => const OnboardingScreen());


      }
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/Splash screen.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
