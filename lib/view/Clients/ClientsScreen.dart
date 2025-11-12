import 'package:crm/controller/Clients/Clients_controller.dart';
import 'package:crm/my_widget/Clients_widget/ClientsFiliter.dart';
import 'package:crm/my_widget/Clients_widget/Header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ClientsController());

    return const Scaffold(
      body: Column(children: [ClientsHeader(), ClientsFilterSection()]),
    );
  }
}



