import 'package:crm/features/clients/logic/all_clients/Clients_controller.dart';
import 'package:crm/features/clients/ui/widgets/ClientCard.dart';
import 'package:crm/features/clients/ui/widgets/ClientsFiliter.dart';
import 'package:crm/features/clients/ui/widgets/Header.dart';
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
