import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:crm/features/Projects/ui/widgets/project_details.dart/shareble_widget.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectDetailsCard extends StatelessWidget {
  final Project project;

  const ProjectDetailsCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations(context.watch<LocaleCubit>().currentLocale);

    return ModernCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: l10n.projectInformation),
          heightSpace(12),
          ModernInfoRow(label: l10n.description, value: project.description),
          ModernInfoRow(label: l10n.location, value: project.location),
          ModernInfoRow(
            label: l10n.contactPerson,
            value: project.contactPerson,
          ),
          ModernInfoRow(
            label: l10n.contactNumber,
            value: project.contactNumber,
          ),
          ModernInfoRow(
            label: l10n.projectType,
            value: project.projectType != null
                ? l10n.getProjectType(project.projectType!)
                : null,
          ),
          ModernInfoRow(
            label: l10n.planDescription,
            value: project.planDescription,
          ),
        ],
      ),
    );
  }
}
