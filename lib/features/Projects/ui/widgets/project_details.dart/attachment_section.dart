import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:crm/features/Projects/ui/widgets/project_details.dart/shareble_widget.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectAttachmentsSection extends StatelessWidget {
  final Project project;

  const ProjectAttachmentsSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final l10n = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    final attachments = project.attachments;
    if (attachments == null || attachments.isEmpty) {
      return const SizedBox.shrink();
    }

    return ModernCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: l10n.attachments),
          heightSpace(12),
          ...attachments.map((a) => AttachmentTile(attachment: a)),
        ],
      ),
    );
  }
}
