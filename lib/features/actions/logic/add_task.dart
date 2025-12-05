import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTaskController extends GetxController {
  // Text controllers
  late TextEditingController assignedToController;
  late TextEditingController expirationDateController;
  late TextEditingController taskDescriptionController;

  // Dropdown values
  var taskPriority = RxnString();

  @override
  void onInit() {
    super.onInit();
    assignedToController = TextEditingController();
    expirationDateController = TextEditingController();
    taskDescriptionController = TextEditingController();
  }

  @override
  void onClose() {
    assignedToController.dispose();
    expirationDateController.dispose();
    taskDescriptionController.dispose();
    super.onClose();
  }

  // Optional: Save task logic
  void saveTask() {
    final task = {
      'assignedTo': assignedToController.text,
      'expirationDate': expirationDateController.text,
      'description': taskDescriptionController.text,
      'priority': taskPriority.value,
    };
    print('Task saved: $task');
  }
}
