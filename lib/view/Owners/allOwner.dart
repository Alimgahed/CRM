import 'package:crm/gloable/Reusable_widget/gloable.dart';
import 'package:crm/my_widget/Owner/AllOwnerWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllOwners extends StatelessWidget {
  const AllOwners({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Owners'.tr)),
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
                return const Allownerwidget();
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
