
import 'package:crm/features/calender/screens/ui/Calender.dart';
import 'package:crm/features/clients/ui/screens/ClientsScreen.dart';
import 'package:crm/features/more/ui/screens/More.dart';
import 'package:crm/features/home/ui/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';



class LayoutController extends GetxController {
  int currentIndex = 0;
  List<Widget> screens = [
    Home(),    
    ClientsScreen(),


    Calendar(),
    MoreScreen(),
    
  ];
  void change(int index) {
    currentIndex = index;
    update();
  }

 
}
