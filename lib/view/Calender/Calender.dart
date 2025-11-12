import 'package:crm/controller/Calender/Calender_controller.dart';
import 'package:crm/my_widget/Calender_widget/Appiontments.dart';
import 'package:crm/my_widget/Calender_widget/Calender.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Use lazyPut to avoid keeping multiple controllers alive unnecessarily.
    final controller = Get.put(CalendarController(), permanent: false);

    return Scaffold(
      appBar: AppBar(title: Text("Calendar".tr)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
