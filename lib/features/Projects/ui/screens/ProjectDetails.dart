import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/features/Projects/ui/widgets/ProjectDtails.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ProjectDetailsScreen extends StatelessWidget {
  const ProjectDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReusableHeader(title: 'Project Details'.tr),
            ProjectDetails(),
          ],
        ),
      ),
    );
  }
}
