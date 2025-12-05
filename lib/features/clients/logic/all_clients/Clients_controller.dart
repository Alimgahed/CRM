import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientsController extends GetxController {
  final RxInt selectedFilter = 200.obs;
  final searchController = TextEditingController();

  void selectFilter(int index) {
    selectedFilter.value = index;
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
