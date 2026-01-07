import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/helpers/extesions.dart';
import 'package:crm/Core/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/routing/routes.dart';
import 'package:crm/features/Projects/logic/cubit/project_cubit.dart';
import 'package:crm/features/developers/logic/cubit/developer_cubit.dart';
import 'package:crm/features/more/ui/widgets/more.dart';
import 'package:crm/features/Units/ui/screens/AllUnit.dart';
import 'package:crm/features/commision/ui/screens/allCommisions.dart';
import 'package:crm/features/owners/ui/screens/allOwner.dart';
import 'package:crm/features/reports/ui/screens/ReportsHome.dart';
import 'package:crm/features/users/ui/screens/User_managment.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            heightSpace(50),

            // Projects
            MoreWidget(
              icon: Icons.business_sharp,
              text: 'Projects'.tr,
              onTap: () {
                final projectCubit = context.read<ProjectCubit>();
                final developerCubit = context.read<DeveloperCubit>();
                context.pushNamed(
                  Routes.projects,
                  arguments: {
                    'projectCubit': projectCubit,
                    'developerCubit': developerCubit,
                  },
                );
              },
            ),

            // Units
            MoreWidget(
              icon: Icons.apartment,
              text: 'Units'.tr,
              onTap: () => Get.to(() => const AllUnits()),
            ),

            // Developers Companies
            MoreWidget(
              icon: Icons.engineering_outlined,
              text: 'Developers Companies'.tr,
              onTap: () {
                final developerCubit = context.read<DeveloperCubit>();
                context.pushNamed(
                  Routes.allDevelopers,
                  arguments: {'developerCubit': developerCubit},
                );
              },
            ),

            // Owners
            MoreWidget(
              icon: Icons.people_outline_outlined,
              text: 'Owners'.tr,
              onTap: () => Get.to(() => const AllOwners()),
            ),

            // Commissions
            MoreWidget(
              icon: Icons.monetization_on_outlined,
              text: 'Commisions'.tr,
              onTap: () => Get.to(() => const AllCommisions()),
            ),

            // Reports
            MoreWidget(
              icon: Icons.analytics_outlined,
              text: 'Reports'.tr,
              onTap: () => Get.to(() => const Reportshome()),
            ),

            // Users and permissions
            MoreWidget(
              icon: Icons.people_alt_outlined,
              text: 'Users and permissions'.tr,
              onTap: () => Get.to(() => const UserManagement()),
            ),

            // Other static items
            MoreWidget(
              icon: Icons.import_export_outlined,
              text: 'Importing data'.tr,
              onTap: () {},
            ),
            MoreWidget(
              icon: Icons.import_export_outlined,
              text: 'Export data'.tr,
              onTap: () {},
            ),
            MoreWidget(
              icon: Icons.settings_outlined,
              text: 'Settings'.tr,
              onTap: () {},
            ),
            MoreWidget(
              icon: Icons.help_outline,
              text: 'Help Center'.tr,
              onTap: () {},
            ),
            MoreWidget(
              icon: Icons.logout_outlined,
              text: 'Logout'.tr,
              onTap: () async {
                final userService = getIt<UserService>();
                await userService.clearUser();

                // ignore: use_build_context_synchronously
                context.pushNamedAndRemoveUntil(Routes.login);
              },
            ),

            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
