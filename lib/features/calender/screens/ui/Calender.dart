import 'package:crm/features/calender/logic/Calender_controller.dart';
import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/features/calender/screens/widgets/Appiontments.dart';
import 'package:crm/features/calender/screens/widgets/Calender.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Use lazyPut to avoid keeping multiple controllers alive unnecessarily.
    final controller = Get.put(CalendarController(), permanent: false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ReusableHeader(title: "Calendar".tr),
              const SizedBox(height: 10),
              ToggleButton(controller: controller),
              const SizedBox(height: 10),
              CalendarView(controller: controller),
              const SizedBox(height: 10),
              AllAppointmentCard(
                appointments: const [
                  AppointmentCard(),
                  AppointmentCard(),
                  AppointmentCard(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
