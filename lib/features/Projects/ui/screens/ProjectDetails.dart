import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:crm/features/Projects/ui/widgets/ProjectDtails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailsScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(project.projectName)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProjectHeader(project: project),
            heightSpace(16),
            ProjectDetailsCard(project: project),
            heightSpace(16),
            ProjectPriceSection(project: project),
            heightSpace(16),
            ProjectDeveloperSection(project: project),
            heightSpace(16),
            ProjectPlansSection(project: project),
            heightSpace(16),
            ProjectStagesSection(project: project),
            heightSpace(16),
            ProjectAttachmentsSection(project: project),
            heightSpace(16),
          ],
        ),
      ),
    );
  }
}
