import 'package:crm/controller/home/home.dart';
import 'package:crm/my_widget/home_widget/Clients.dart';
import 'package:crm/my_widget/home_widget/Sales_performance_stages.dart';
import 'package:crm/my_widget/home_widget/Users.dart';
import 'package:crm/my_widget/home_widget/header.dart';
import 'package:crm/my_widget/home_widget/totals.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                buildHeader(context),
                SizedBox(height: 30),
                SizedBox(
                  height: 260, // Space for the overlapping search bar
                  child: TotalsSection(),
                ),
                SizedBox(height: 340, child: SalesPerformanceStages()),
                SizedBox(height: 430, child: Clients()),
                SizedBox(height: 430, child: Users()),
              ],
            ),
          );
        },
      ),
    );
  }
}
