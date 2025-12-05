import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/clients/ui/widgets/ClientsFiliter.dart';
import 'package:crm/features/clients/ui/screens/Clients_add/AddBuyRequest.dart';
import 'package:crm/features/clients/ui/screens/Clients_add/AddChance.dart';
import 'package:crm/features/clients/ui/screens/Clients_add/AddCliRequest.dart';
import 'package:crm/features/clients/ui/screens/Clients_add/DeleteClient.dart';
import 'package:crm/features/clients/ui/screens/Clients_add/RefferTo.dart';
import 'package:crm/features/clients/ui/screens/ContactAction/contact_action.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Clientmore extends StatelessWidget {
  const Clientmore({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const FloatingCloseButton(),

          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.now_widgets_outlined),
                      const SizedBox(width: 8),
                      Text(
                        "More".tr,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  FilterButton(
                    index: 32,
                    label: "Add Chance".tr,
                    onTap: () {
                      Get.back();
                      Get.bottomSheet(
                        FractionallySizedBox(child: const Addchance()),
                        isScrollControlled:
                            true, // Makes it full height if needed
                        backgroundColor: Colors.transparent,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  FilterButton(
                    index: 33,
                    label: "Add Cli Request".tr,
                    onTap: () {
                      Get.back();
                      Get.bottomSheet(
                        FractionallySizedBox(child: const Addclirequest()),
                        isScrollControlled:
                            true, // Makes it full height if needed
                        backgroundColor: Colors.transparent,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  FilterButton(
                    index: 34,
                    label: "Add Buy Request".tr,
                    onTap: () {
                      Get.back();
                      Get.bottomSheet(
                        FractionallySizedBox(
                          heightFactor: 0.9,
                          child: const Addbuyrequest(),
                        ),
                        isScrollControlled:
                            true, // Makes it full height if needed
                        backgroundColor: Colors.transparent,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  FilterButton(
                    index: 35,
                    label: "Refer to another Agent".tr,
                    onTap: () {
                      Get.back();
                      Get.bottomSheet(
                        FractionallySizedBox(
                          // heightFactor: 0.9,
                          child: const ReferToAnotherAgent(),
                        ),
                        isScrollControlled:
                            true, // Makes it full height if needed
                        backgroundColor: Colors.transparent,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  FilterButton(
                    index: 36,
                    label: "Add Action".tr,
                    onTap: () {
                      Get.back();
                      Get.bottomSheet(
                        FractionallySizedBox(
                          // heightFactor: 0.9,
                          child: const ContactAction(),
                        ),
                        isScrollControlled:
                            true, // Makes it full height if needed
                        backgroundColor: Colors.transparent,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  FilterButton(
                    index: 39,
                    label: "Remove Client Data?".tr,
                    onTap: () {
                      Get.back();
                      Get.bottomSheet(
                        FractionallySizedBox(
                          // heightFactor: 0.9,
                          child: const DeleteClient(),
                        ),
                        isScrollControlled:
                            true, // Makes it full height if needed
                        backgroundColor: Colors.transparent,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
