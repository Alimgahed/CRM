import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addclirequestcontroller extends GetxController {
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
