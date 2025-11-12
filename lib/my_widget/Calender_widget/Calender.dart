import 'package:crm/constant/colors.dart';
import 'package:crm/controller/Calender/Calender_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class ToggleButton extends StatelessWidget {
  final CalendarController controller;
  const ToggleButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          _CalendarButton(
            controller: controller,
            label: "Month".tr,
            type: CalendarViewType.month,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          _CalendarButton(
            controller: controller,
            label: "Week".tr,
            type: CalendarViewType.week,
            borderRadius: BorderRadius.zero,
          ),
          _CalendarButton(
            controller: controller,
            label: "Day".tr,
            type: CalendarViewType.day,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}

class _CalendarButton extends StatelessWidget {
  final CalendarController controller;
  final String label;
  final CalendarViewType type;
  final BorderRadius borderRadius;

  const _CalendarButton({
    required this.controller,
    required this.label,
    required this.type,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    // Only rebuild when `selectedView` changes.
    return Expanded(
      child: Obx(() {
        final isSelected = controller.selectedView.value == type;
        return GestureDetector(
          onTap: () => controller.changeView(type),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? appColor : Colors.white,
              borderRadius: borderRadius,

              border: Border.all(color: Colors.grey.shade100),
            ),
            alignment: Alignment.center,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.white : secondaryTextColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class CalendarView extends StatelessWidget {
  final CalendarController controller;
  const CalendarView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.selectedView.value) {
        case CalendarViewType.month:
          return _MonthCalendar(controller: controller);
        case CalendarViewType.week:
          return WeekCalendar(controller: controller);
        case CalendarViewType.day:
          return _DayCalendar(controller: controller);
      }
    });
  }
}

class _MonthCalendar extends StatelessWidget {
  final CalendarController controller;
  const _MonthCalendar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: TableCalendar(
          locale: 'ar',
          focusedDay: controller.focusedDay.value,
          firstDay: DateTime.utc(2000, 1, 1),
          lastDay: DateTime.utc(2100, 12, 31),
          selectedDayPredicate: (day) {
            // لو اليوم هو المحدد يظهر بلون التحديد
            return isSameDay(controller.selectedDay.value, day);
          },
          calendarFormat: CalendarFormat.month,
          rowHeight: 33,
          daysOfWeekHeight: 30,
          headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
            titleTextStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          calendarStyle: CalendarStyle(
            // todayDecoration: BoxDecoration(
            //   // لو اليوم الحالي هو نفسه اليوم المحدد، نخلي لون اليوم عادي
            //   // color: isSameDay(controller.selectedDay.value, DateTime.now())
            //   //     ? Colors.white
            //   //     : Colors.black.withOpacity(0.6),
            //   // shape: BoxShape.circle,
            // ),
            selectedDecoration: const BoxDecoration(
              color: appColor,
              shape: BoxShape.circle,
            ),
            selectedTextStyle: const TextStyle(color: Colors.white),
            todayTextStyle: TextStyle(
              color: isSameDay(controller.selectedDay.value, DateTime.now())
                  ? Colors.black
                  : Colors.white,
            ),
          ),
          onDaySelected: (selectedDay, focusedDay) {
            controller.onDaySelected(selectedDay, focusedDay);
          },
        ),
      ),
    );
  }
}

class WeekCalendar extends StatelessWidget {
  final CalendarController controller;
  const WeekCalendar({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    // Get the week starting from Monday
    List<DateTime> weekDays = List.generate(7, (index) {
      final startOfWeek = controller.focusedDay.value.subtract(
        Duration(days: controller.focusedDay.value.weekday - 1),
      );
      return startOfWeek.add(Duration(days: index));
    });

    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: weekDays.map((day) {
            bool isSelected = isSameDay(day, controller.selectedDay.value);
            return GestureDetector(
              onTap: () =>
                  controller.onDaySelected(day, controller.focusedDay.value),
              child: Container(
                width: 60, // fixed width for each day
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? appColor : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? appColor : Colors.grey.shade300,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      // Day name like Mon, Tue in Arabic
                      DateFormat.E('ar').format(day),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      // Date number
                      day.day.toString(),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}

class _DayCalendar extends StatelessWidget {
  final CalendarController controller;
  const _DayCalendar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
