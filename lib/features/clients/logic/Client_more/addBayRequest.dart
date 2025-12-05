import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddbayrequestController extends GetxController {
  // ---------- TEXT FIELDS ----------
  late TextEditingController bathroomsController;
  late TextEditingController roomsController;
  late TextEditingController floorController;
  late TextEditingController landAreaController;
  late TextEditingController priceController;

  // ---------- DROPDOWNS ----------
  RxString governorate = ''.obs;
  RxString unitType = ''.obs;
  RxString purposeOfPurchase = ''.obs;
  RxString finishingType = ''.obs;
  RxString parking = ''.obs;
  RxString paymentMethod = ''.obs;
  RxString interfaceType = ''.obs;

  @override
  void onInit() {
    super.onInit();

    bathroomsController = TextEditingController();
    roomsController = TextEditingController();
    floorController = TextEditingController();
    landAreaController = TextEditingController();
    priceController = TextEditingController();
  }

  @override
  void onClose() {
    bathroomsController.dispose();
    roomsController.dispose();
    floorController.dispose();
    landAreaController.dispose();
    priceController.dispose();
    super.onClose();
  }
}
