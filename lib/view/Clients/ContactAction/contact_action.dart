import 'package:crm/controller/Contact_actions/Contact_actions.dart';
import 'package:crm/gloable/Reusable_widget/fields.dart';
import 'package:crm/gloable/Reusable_widget/buttons.dart';
import 'package:crm/my_widget/Contact_actions_view/Call.dart';
import 'package:crm/my_widget/Contact_actions_view/Cancel.dart';
import 'package:crm/my_widget/Contact_actions_view/Deal.dart';
import 'package:crm/my_widget/Contact_actions_view/Follow_up.dart';
import 'package:crm/my_widget/Contact_actions_view/Metting.dart';
import 'package:crm/my_widget/Contact_actions_view/Rent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactAction extends StatelessWidget {
  const ContactAction({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContactActionsController());

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // -------- HEADER --------
                Row(
                  children: [
                    const Icon(Icons.add_box_outlined),
                    const SizedBox(width: 8),
                    Text(
                      'Add Action'.tr,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // ---------- Action Dropdown ----------
                CustomDropdownFormField<int>(
                  text: 'Action'.tr,
                  labelText: 'Action'.tr,
                  // value: -1,
                  items: [
                    DropdownMenuItem(value: 0, child: Text('Call'.tr)),
                    DropdownMenuItem(value: 1, child: Text('Follow up'.tr)),
                    DropdownMenuItem(value: 2, child: Text('Meeting'.tr)),
                    DropdownMenuItem(value: 3, child: Text('Deal'.tr)),
                    DropdownMenuItem(value: 4, child: Text('Rent'.tr)),
                    DropdownMenuItem(value: 5, child: Text('Hold'.tr)),
                    DropdownMenuItem(value: 6, child: Text('Reserve'.tr)),
                    DropdownMenuItem(value: 7, child: Text('Cancel'.tr)),
                  ],
                  onChanged: (val) {
                    if (val != null) {
                      controller.changeActionType(val);
                    }
                  },
                ),
                const SizedBox(height: 10),

                // Dynamic content based on action type
                Obx(() => _buildActionWidget(controller.actionType.value)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionWidget(int actionType) {
    switch (actionType) {
      case 0:
        return const CallScreen();
      case 1:
        return const FollowUpScreen();
      case 2:
        return const MeetingScreen();
      case 3:
        return const DealScreen();
      case 4:
        return const RentScreen();
      case 7:
        return const CancelScreen();
      default:
        return const SizedBox();
    }
  }
}
