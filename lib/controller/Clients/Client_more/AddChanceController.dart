import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addchancecontroller extends GetxController {
  // Text controllers
  late TextEditingController expecteddClosureDateController;
  late TextEditingController expectedpriceController;

  // Dropdown values

  @override
  void onInit() {
    super.onInit();
    expecteddClosureDateController = TextEditingController();
    expectedpriceController = TextEditingController();
  }

  @override
  void onClose() {
    expecteddClosureDateController.dispose();
    expectedpriceController.dispose();
    super.onClose();
  }
}
