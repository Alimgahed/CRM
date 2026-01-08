import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/helpers/extesions.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/routing/routes.dart';
import 'package:crm/Core/services/user_service.dart';
import 'package:crm/features/developers/logic/cubit/developer_cubit.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/more/ui/widgets/more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LocaleCubit>().currentLocale;
    final l10n = AppLocalizations(locale);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            heightSpace(50),

            MoreWidget(
              icon: Icons.business_sharp,
              text: l10n.projectsMenu,
              onTap: () => context.pushNamed(Routes.projects),
            ),

            MoreWidget(
              icon: Icons.apartment,
              text: l10n.unitsMenu,
              onTap: () {},
            ),

            MoreWidget(
              icon: Icons.engineering_outlined,
              text: l10n.developersMenu,
              onTap: () {
                final developerCubit = context.read<DeveloperCubit>();
                context.pushNamed(
                  Routes.allDevelopers,
                  arguments: {'developerCubit': developerCubit},
                );
              },
            ),

            MoreWidget(
              icon: Icons.people_outline_outlined,
              text: l10n.ownersMenu,
              onTap: () => context.pushNamed(Routes.allDevelopers),
            ),

            MoreWidget(
              icon: Icons.monetization_on_outlined,
              text: l10n.commissionsMenu,
              onTap: () => {},
            ),

            MoreWidget(
              icon: Icons.analytics_outlined,
              text: l10n.reportsMenu,
              onTap: () {},
            ),

            MoreWidget(
              icon: Icons.people_alt_outlined,
              text: l10n.usersPermissionsMenu,
              onTap: () {},
            ),

            MoreWidget(
              icon: Icons.import_export_outlined,
              text: l10n.importData,
              onTap: () {},
            ),

            MoreWidget(
              icon: Icons.import_export_outlined,
              text: l10n.exportData,
              onTap: () {},
            ),

            MoreWidget(
              icon: Icons.settings_outlined,
              text: l10n.settings,
              onTap: () {},
            ),

            MoreWidget(
              icon: Icons.help_outline,
              text: l10n.helpCenter,
              onTap: () {},
            ),

            MoreWidget(
              icon: Icons.logout_outlined,
              text: l10n.logout,
              onTap: () async {
                final userService = getIt<UserService>();
                await userService.clearUser();
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
