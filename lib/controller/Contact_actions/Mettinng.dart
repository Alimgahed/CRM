import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MettingController extends GetxController {
  // Switch value
  RxBool attendance = false.obs;

  // Text controllers for the fields
  late TextEditingController actionDateController;
  late TextEditingController commentController;

  @override
  void onInit() {
    super.onInit();
    actionDateController = TextEditingController();
    commentController = TextEditingController();
  }

  @override
  void onClose() {
    actionDateController.dispose();
    commentController.dispose();
    super.onClose();
  }

  // Toggle switch
  void toggleAttendance(bool value) => attendance.value = value;

  // Save action (placeholder)

}
