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
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                buildHeader(context),
                SizedBox(height: 30),
                SizedBox(
                  height: 300, // Space for the overlapping search bar
                  child: TotalsSection(),
                ),
                const SizedBox(height: 340, child: SalesPerformanceStages()),
                const SizedBox(height: 430, child: Clients()),
                const SizedBox(height: 430, child: Users()),
                const SizedBox(height: 100),
              ],
            ),
          );
        },
      ),
    );
  }
}
