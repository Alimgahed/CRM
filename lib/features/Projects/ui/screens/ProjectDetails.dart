import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/features/Projects/data/model/project_response.dart';
import 'package:crm/features/Projects/ui/widgets/ProjectDtails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final ProjectResponse project;

  const ProjectDetailsScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.projectName ?? "Project Details"),
      ),
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
            ProjectMediaSection(project: project),
            heightSpace(16),
            ProjectAttachmentsSection(project: project),
            heightSpace(16),
          ],
        ),
      ),
    );
  }}