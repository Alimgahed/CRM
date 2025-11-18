import 'package:crm/gloable/gloable.dart';
import 'package:crm/my_widget/Projects_widget/allProject.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Allprojects extends StatelessWidget {
  const Allprojects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Projects'.tr)),
      body: Column(
        children: [
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
