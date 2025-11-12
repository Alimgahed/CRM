
import 'package:crm/view/Calender/Calender.dart';
import 'package:crm/view/Clients/ClientsScreen.dart';
import 'package:crm/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';



class LayoutController extends GetxController {
  int currentIndex = 0;
  List<Widget> screens = [
    Home(),    
    ClientsScreen(),


    Calendar(),
    // Dev_Home(),
    // AllReq(),
    // AllCampaigns(),
    // more_Dev(),
  ];
  void change(int index) {
    currentIndex = index;
    update();
  }

 
}
