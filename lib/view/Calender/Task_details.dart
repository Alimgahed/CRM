import 'package:crm/my_widget/Calender_widget/task_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final title = 'Task Details'.tr;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailRow(
                icon: Icons.flag,
                label: 'Priority'.tr,
                valueWidget: Row(
                  children: [
                    const Icon(Icons.flag,),
                    const SizedBox(width: 5),
                    Text('عادية', style: textTheme.bodyMedium),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              DetailRow(
                icon: Icons.calendar_month_outlined,
                label: 'Creation date'.tr,
                valueWidget: Text(
                  '2024-06-10 12:30 PM',
                  style: textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 10),
              DetailRow(
                icon: Icons.person_2_outlined,
                label: 'Assigned to'.tr,
                valueWidget: Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey.shade300,
                      child: const Icon(
                        Icons.person_2_outlined,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text('علي احمد محمد', style: textTheme.bodyMedium),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Task Description'.tr,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  'لدينا مجموعة من الوحدات السكنية المتاحة في الحي الأول بمنطقة التجمع الخامس، وهدفنا ه',
                  style: textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
