import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/features/Projects/ui/widgets/allProject.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Allprojects extends StatelessWidget {
  const Allprojects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ReusableHeader(title: 'Projects'.tr),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBarWidget(
              prefixIcon: Icons.search,
              suffixIcon: Icons.filter_list,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const AllprojectWidget();
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
