import 'package:crm/features/clients/logic/Contact_actions/Call.dart';
import 'package:crm/features/clients/logic/Contact_actions/Cancel.dart';
import 'package:crm/features/clients/logic/Contact_actions/DealController.dart';
import 'package:crm/features/clients/logic/Contact_actions/FollowUp.dart';
import 'package:crm/features/clients/logic/Contact_actions/Mettinng.dart';
import 'package:crm/features/clients/logic/Contact_actions/Rent.dart';
import 'package:get/get.dart';

class ContactActionsController extends GetxController {
  final actionType = 0.obs;

  void changeActionType(int newType) {
    // Don't do anything if selecting the same type
    if (actionType.value == newType) return;

    // Clean up previous controllers BEFORE switching
    _cleanupControllers(actionType.value);

    // Update action type
    actionType.value = newType;

    // Add a small delay to ensure cleanup completes
  }

  void _cleanupControllers(int previousType) {
    switch (previousType) {
      case 0:
        // Delete CallController if it exists
        if (Get.isRegistered<CallController>(tag: 'call_controller')) {
          Get.delete<CallController>(tag: 'call_controller', force: true);
        }
        break;

      case 1:
        // Delete FollowUpController if it exists
        if (Get.isRegistered<FollowUpController>(tag: 'followup_controller')) {
          Get.delete<FollowUpController>(
            tag: 'followup_controller',
            force: true,
          );
        }
        break;

      case 2:
        if (Get.isRegistered<MettingController>(tag: 'meeting_controller')) {
          Get.delete<MettingController>(tag: 'meeting_controller', force: true);
        }
        // Add MeetingController cleanup if needed
        break;

      case 3:
        if (Get.isRegistered<DealController>(tag: 'Deal_controller')) {
          Get.delete<DealController>(tag: 'Deal_controller', force: true);
        }
        // Add DealController cleanup if needed
        break;
      case 4:
        if (Get.isRegistered<RentController>(tag: 'Rent_controller')) {
          Get.delete<RentController>(tag: 'Rent_controller', force: true);
        }
        // Add DealController cleanup if needed
        break;
      case 7:
        if (Get.isRegistered<CancelController>(tag: 'Cancel_controller')) {
          Get.delete<CancelController>(tag: 'Cancel_controller', force: true);
        }
        // Add DealController cleanup if needed
        break;

      // Add other cases as needed for other action types
      default:
    }
  }

  @override
  void onClose() {
    // Clean up all possible controllers when this screen is closed
    _cleanupAllControllers();
    super.onClose();
  }

  void _cleanupAllControllers() {
    // Clean up CallController
    if (Get.isRegistered<CallController>(tag: 'call_controller')) {
      Get.delete<CallController>(tag: 'call_controller', force: true);
    }

    // Clean up FollowUpController
    if (Get.isRegistered<FollowUpController>(tag: 'followup_controller')) {
      Get.delete<FollowUpController>(tag: 'followup_controller', force: true);
    }
    if (Get.isRegistered<FollowUpController>(tag: 'Deal_controller')) {
      Get.delete<FollowUpController>(tag: 'Deal_controller', force: true);
    }
    if (Get.isRegistered<FollowUpController>(tag: 'Meeting_controller')) {
      Get.delete<FollowUpController>(tag: 'Meeting_controller', force: true);
    }
    if (Get.isRegistered<FollowUpController>(tag: 'Cancel_controller')) {
      Get.delete<FollowUpController>(tag: 'Cancel_controller', force: true);
    }
  }
}
