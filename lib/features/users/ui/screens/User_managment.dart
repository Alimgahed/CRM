import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/features/users/ui/widgets/UserMannagment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserManagement extends StatelessWidget {
  const UserManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ReusableHeader(title:'Users and permissions'.tr ,),
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
