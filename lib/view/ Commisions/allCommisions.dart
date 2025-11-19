import 'package:crm/gloable/gloable.dart';
import 'package:crm/my_widget/Commision/AllCommisions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCommisions extends StatelessWidget {
  const AllCommisions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Commisions'.tr)),
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
                return const AllCommisionsWidget();
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
