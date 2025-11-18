import 'package:crm/my_widget/More_widget.dart/more.dart';
import 'package:crm/view/Projects/Allprojects.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('More')),
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
                // Handle tap
              },
            ),
            MoreWidget(
              icon: Icons.engineering_outlined,
              text: 'Developers Companies'.tr,
              onTap: () {
                // Handle tap
              },
            ),
            MoreWidget(
              icon: Icons.people_outline_outlined,
              text: 'Owners'.tr,
              onTap: () {
                // Handle tap
              },
            ),
            MoreWidget(
              icon: Icons.analytics_outlined,
              text: 'Reports'.tr,
              onTap: () {
                // Handle tap
              },
            ),
            MoreWidget(
              icon: Icons.people_alt_outlined,
              text: 'Users and permissions'.tr,
              onTap: () {
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
