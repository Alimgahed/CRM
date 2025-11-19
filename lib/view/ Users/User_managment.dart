import 'package:crm/gloable/gloable.dart';
import 'package:crm/my_widget/Users/UserMannagment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserManagement extends StatelessWidget {
  const UserManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users and permissions'.tr)),
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
                return const UserManagementWidget();
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
