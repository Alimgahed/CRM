import 'package:crm/controller/Clients/Client_more/addBayRequest.dart';
import 'package:crm/gloable/Reusable_widget/fields.dart';
import 'package:crm/gloable/Reusable_widget/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addbuyrequest extends StatelessWidget {
  const Addbuyrequest({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddbayrequestController());

    return SingleChildScrollView(
      child: Column(
        children: [
          const FloatingCloseButton(),

          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -------- HEADER --------
                  Row(
                    children: [
                      const Icon(Icons.add_box_outlined),
                      const SizedBox(width: 8),
                      Text(
                        'Add Buy Request'.tr,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // ---------- Governorate ----------
                  CustomDropdownFormField<String>(
                    text: 'Governorate'.tr,
                    labelText: 'Governorate'.tr,
                    value: controller.governorate.value.isEmpty
                        ? null
                        : controller.governorate.value,
                    items: const [
                      DropdownMenuItem(value: 'low', child: Text('Low')),
                      DropdownMenuItem(value: 'medium', child: Text('Medium')),
                      DropdownMenuItem(value: 'high', child: Text('High')),
                    ],
                    onChanged: (val) =>
                        controller.governorate.value = val ?? '',
                  ),

                  const SizedBox(height: 10),

                  // ---------- Unit Type ----------
                  CustomDropdownFormField<String>(
                    text: 'Unit Type'.tr,
                    labelText: 'Unit Type'.tr,
                    value: controller.unitType.value.isEmpty
                        ? null
                        : controller.unitType.value,
                    items: const [
                      DropdownMenuItem(value: 'low', child: Text('Low')),
                      DropdownMenuItem(value: 'medium', child: Text('Medium')),
                      DropdownMenuItem(value: 'high', child: Text('High')),
                    ],
                    onChanged: (val) => controller.unitType.value = val ?? '',
                  ),

                  const SizedBox(height: 10),

                  // ---------- Purpose of purchase ----------
                  CustomDropdownFormField<String>(
                    text: 'Purpose of purchase'.tr,
                    labelText: 'Purpose of purchase'.tr,
                    value: controller.purposeOfPurchase.value.isEmpty
                        ? null
                        : controller.purposeOfPurchase.value,
                    items: const [
                      DropdownMenuItem(value: 'low', child: Text('Low')),
                      DropdownMenuItem(value: 'medium', child: Text('Medium')),
                      DropdownMenuItem(value: 'high', child: Text('High')),
                    ],
                    onChanged: (val) =>
                        controller.purposeOfPurchase.value = val ?? '',
                  ),

                  const SizedBox(height: 10),

                  // ---------- Number of bathrooms ----------
                  CustomTextFormField(
                    text: 'Number of bathrooms'.tr,
                    labelText: 'Number of bathrooms'.tr,
                    controller: controller.bathroomsController,
                  ),

                  const SizedBox(height: 10),

                  // ---------- Number of Rooms ----------
                  CustomTextFormField(
                    text: 'Number of Rooms'.tr,
                    labelText: 'Number of Rooms'.tr,
                    controller: controller.roomsController,
                  ),

                  const SizedBox(height: 10),

                  // ---------- Finishing Type ----------
                  CustomDropdownFormField<String>(
                    text: 'Finishing Type'.tr,
                    labelText: 'Finishing Type'.tr,
                    value: controller.finishingType.value.isEmpty
                        ? null
                        : controller.finishingType.value,
                    items: const [
                      DropdownMenuItem(value: 'low', child: Text('Low')),
                      DropdownMenuItem(value: 'medium', child: Text('Medium')),
                      DropdownMenuItem(value: 'high', child: Text('High')),
                    ],
                    onChanged: (val) =>
                        controller.finishingType.value = val ?? '',
                  ),

                  const SizedBox(height: 10),

                  // ---------- Parking ----------
                  CustomDropdownFormField<String>(
                    text: 'Parking'.tr,
                    labelText: 'Parking'.tr,
                    value: controller.parking.value.isEmpty
                        ? null
                        : controller.parking.value,
                    items: const [
                      DropdownMenuItem(value: 'low', child: Text('Low')),
                      DropdownMenuItem(value: 'medium', child: Text('Medium')),
                      DropdownMenuItem(value: 'high', child: Text('High')),
                    ],
                    onChanged: (val) => controller.parking.value = val ?? '',
                  ),

                  const SizedBox(height: 10),

                  // ---------- Floor ----------
                  CustomTextFormField(
                    text: 'Floor'.tr,
                    labelText: 'Floor'.tr,
                    controller: controller.floorController,
                  ),

                  const SizedBox(height: 10),

                  // ---------- Payment Method ----------
                  CustomDropdownFormField<String>(
                    text: 'Payment Method'.tr,
                    labelText: 'Payment Method'.tr,
                    value: controller.paymentMethod.value.isEmpty
                        ? null
                        : controller.paymentMethod.value,
                    items: const [
                      DropdownMenuItem(
                        value: 'credit_card',
                        child: Text('Credit Card'),
                      ),
                      DropdownMenuItem(value: 'paypal', child: Text('PayPal')),
                      DropdownMenuItem(
                        value: 'bank_transfer',
                        child: Text('Bank Transfer'),
                      ),
                    ],
                    onChanged: (val) =>
                        controller.paymentMethod.value = val ?? '',
                  ),

                  const SizedBox(height: 10),

                  // ---------- Land area ----------
                  CustomTextFormField(
                    text: 'Land area'.tr,
                    labelText: 'Land area'.tr,
                    controller: controller.landAreaController,
                  ),

                  const SizedBox(height: 10),

                  // ---------- Interface ----------
                  CustomDropdownFormField<String>(
                    text: 'Interface'.tr,
                    labelText: 'Interface'.tr,
                    value: controller.interfaceType.value.isEmpty
                        ? null
                        : controller.interfaceType.value,
                    items: const [
                      DropdownMenuItem(value: 'north', child: Text('North')),
                      DropdownMenuItem(value: 'south', child: Text('South')),
                      DropdownMenuItem(value: 'east', child: Text('East')),
                      DropdownMenuItem(value: 'west', child: Text('West')),
                    ],
                    onChanged: (val) =>
                        controller.interfaceType.value = val ?? '',
                  ),

                  const SizedBox(height: 10),

                  // ---------- Price ----------
                  CustomTextFormField(
                    text: 'Price'.tr,
                    labelText: 'Price'.tr,
                    controller: controller.priceController,
                  ),

                  const SizedBox(height: 20),

                  // ---------- Save Button ----------
                  CustomButton(
                    text: "Save".tr,
                    onPressed: () {
                      Get.snackbar("Saved", "Buy Request Saved!");
                    },
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
