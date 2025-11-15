import 'package:crm/controller/Clients/Clients_controller.dart';
import 'package:crm/my_widget/Clients_widget/ClientCard.dart';
import 'package:crm/my_widget/Clients_widget/ClientsFiliter.dart';
import 'package:crm/my_widget/Clients_widget/Header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ClientsController(), permanent: false);

    return Scaffold(
      body: GetBuilder<ClientsController>(
        init: ClientsController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ClientsHeader(),
                ClientsFilterSection(),
                ClientsListScreen(),
                const SizedBox(height: 50),
              ],
            ),
          );
        },
      ),
    );
  }
}
