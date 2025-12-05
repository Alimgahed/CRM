import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/calender/screens/ui/Task_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllAppointmentCard extends StatelessWidget {
  final List<AppointmentCard> appointments;

  const AllAppointmentCard({super.key, required this.appointments});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const TaskDetails());
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Appointments".tr,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            ListView.builder(
              shrinkWrap:
                  true, // <-- This makes ListView take only the needed height
              physics:
                  const NeverScrollableScrollPhysics(), // <-- Disable scrolling inside Column
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: appointments[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          // Title + Urgent tag
          Row(
            children: [
              Expanded(
                child: Text(
                  "تحديث صور المشروع",
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                child: Row(
                  children: const [
                    Icon(Icons.flag, color: Colors.white, size: 16),
                    SizedBox(width: 6),
                    Text(
                      "عاجل",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Assigned + Expiration
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Assigned to
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Assigned to'.tr,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: secondaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: EdgeInsets.only(left: index == 2 ? 2 : 4),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          radius: 12,
                          child: Icon(Icons.person, size: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),

              // Expiration Date
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expiration Date'.tr,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: secondaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '2024-07-15 2:00 PM',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
