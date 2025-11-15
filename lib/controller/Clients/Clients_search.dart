import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultFilterController extends GetxController {
  /// --- Text Editing Controllers ---
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  /// --- Dropdown Reactive Values ---
  final status = ''.obs;
  final source = ''.obs;
  final project = ''.obs;
  final developer = ''.obs;

  /// --- Apply Filter Action ---
  void applyFilters() {
    final filters = {
      'startDate': startDateController.text,
      'endDate': endDateController.text,
      'status': status.value,
      'source': source.value,
      'project': project.value,
      'developer': developer.value,
    };

    // Print or send to backend
    debugPrint('Filters Applied: $filters');

    // You could trigger a GetX update or call an API here
    Get.back(result: filters);
  }

  /// --- Reset All Filters ---
  void resetFilters() {
    startDateController.clear();
    endDateController.clear();
    status.value = '';
    source.value = '';
    project.value = '';
    developer.value = '';
  }

  @override
  void onClose() {
    // Always dispose of controllers to prevent memory leaks
    startDateController.dispose();
    endDateController.dispose();
    super.onClose();
  }
}
