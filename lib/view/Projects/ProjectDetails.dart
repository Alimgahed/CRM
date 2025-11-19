import 'package:crm/my_widget/Property_widget/Projects_widget/ProjectDtails.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ProjectDetailsScreen extends StatelessWidget {
  const ProjectDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Project Details'.tr)),
      body: SingleChildScrollView(child: ProjectDetails()),
    );
  }
}
