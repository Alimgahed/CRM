import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddClientController extends GetxController {
  // Text controllers
  final clientNameController = TextEditingController();
  final assignedToController = TextEditingController();
  final expirationDateController = TextEditingController();
  final taskDescriptionController = TextEditingController();
  final emailController = TextEditingController();

  // Dropdown observables
  final projectName = ''.obs;
  final channel = ''.obs;
  final preferredMethod = ''.obs;
  final clientStatus = ''.obs;
  final taskPriority = ''.obs;

  @override
  void onClose() {
    clientNameController.dispose();
    assignedToController.dispose();
    expirationDateController.dispose();
    taskDescriptionController.dispose();
    emailController.dispose();
    super.onClose();
  }

  // Save client/task
  void saveTask() {
    final task = {
      'clientName': clientNameController.text,
      'assignedTo': assignedToController.text,
      'expirationDate': expirationDateController.text,
      'description': taskDescriptionController.text,
      'email': emailController.text,
      'projectName': projectName.value,
      'priority': taskPriority.value,
      'channel': channel.value,
      'preferredMethod': preferredMethod.value,
      'clientStatus': clientStatus.value,
    };
    debugPrint('✅ Task saved: $task');
    Get.back(); // Close sheet after save
  }
}
