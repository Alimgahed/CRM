import 'package:crm/Core/helpers/extesions.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/routing/routes.dart';
import 'package:crm/features/Units/ui/screens/AllUnit.dart';
import 'package:crm/features/commision/ui/screens/allCommisions.dart';
import 'package:crm/features/developers/ui/screens/AllDeveloper.dart';
import 'package:crm/features/more/ui/widgets/more.dart';
import 'package:crm/features/owners/ui/screens/allOwner.dart';
import 'package:crm/features/reports/ui/screens/ReportsHome.dart';
import 'package:crm/features/users/ui/screens/User_managment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            heightSpace(50),
            MoreWidget(
              icon: Icons.business_sharp,
              text: 'Projects'.tr,
              onTap: () {
                context.pushNamed(Routes.projects);
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
                context.pushNamed(Routes.allDevelopers);
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
                // context.pushReplacementNamed(Routes.login);

                // Get.to(() => Login());
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
