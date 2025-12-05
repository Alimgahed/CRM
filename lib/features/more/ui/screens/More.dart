import 'package:crm/features/more/ui/widgets/more.dart';
import 'package:crm/features/commision/ui/screens/allCommisions.dart';
import 'package:crm/features/users/ui/screens/User_managment.dart';
import 'package:crm/features/auth/ui/screens/Login.dart';
import 'package:crm/features/developers/ui/screens/AllDeveloper.dart';
import 'package:crm/features/owners/ui/screens/allOwner.dart';
import 'package:crm/features/Projects/ui/screens/Allprojects.dart';
import 'package:crm/features/reports/ui/screens/ReportsHome.dart';
import 'package:crm/features/Units/ui/screens/AllUnit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('More'.tr)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MoreWidget(
              icon: Icons.business_sharp,
              text: 'Projects'.tr,
              onTap: () {
                Get.to(() => const Allprojects());
              },
            ),
            MoreWidget(
              icon: Icons.apartment,
              text: 'Units'.tr,
              onTap: () {
                Get.to(() => const AllUnits());
              },
            ),
            MoreWidget(
              icon: Icons.engineering_outlined,
              text: 'Developers Companies'.tr,
              onTap: () {
                Get.to(() => const AllDevelopers());

                // Handle tap
              },
            ),
            MoreWidget(
              icon: Icons.people_outline_outlined,
              text: 'Owners'.tr,
              onTap: () {
                Get.to(() => const AllOwners());
              },
            ),
            MoreWidget(
              icon: Icons.monetization_on_outlined,
              text: 'Commisions'.tr,
              onTap: () {
                Get.to(() => const AllCommisions());
              },
            ),
            MoreWidget(
              icon: Icons.analytics_outlined,
              text: 'Reports'.tr,
              onTap: () {
                Get.to(() => const Reportshome());
                // Handle tap
              },
            ),
            MoreWidget(
              icon: Icons.people_alt_outlined,
              text: 'Users and permissions'.tr,
              onTap: () {
                Get.to(() => const UserManagement());
                // Handle tap
              },
            ),
            MoreWidget(
              icon: Icons.import_export_outlined,
              text: 'Importing data'.tr,
              onTap: () {
                // Handle tap
              },
            ),
            MoreWidget(
              icon: Icons.import_export_outlined,
              text: 'Export data'.tr,
              onTap: () {
                // Handle tap
              },
            ),
            MoreWidget(
              icon: Icons.settings_outlined,
              text: 'Settings'.tr,
              onTap: () {
                // Handle tap
              },
            ),
            MoreWidget(
              icon: Icons.help_outline,
              text: 'Help Center'.tr,
              onTap: () {
                // Handle tap
              },
            ),
            MoreWidget(
              icon: Icons.logout_outlined,
              text: 'Logout'.tr,
              onTap: () {
                Get.to(() => Login());
                // Handle tap
              },
            ),

            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
