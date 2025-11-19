import 'package:crm/gloable/Reusable_widget/gloable.dart';
import 'package:crm/my_widget/Property_widget/Unit_Widget/Units.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllUnits extends StatelessWidget {
  const AllUnits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Units'.tr)),
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
                return const UnitsWidget();
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
