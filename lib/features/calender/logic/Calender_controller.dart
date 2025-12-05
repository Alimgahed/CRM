// controllers/calendar_controller.dart
import 'package:get/get.dart';

enum CalendarViewType { month, week, day }

class CalendarController extends GetxController {
  final selectedView = CalendarViewType.month.obs;

  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;

  void changeView(CalendarViewType view) {
    if (selectedView.value != view) {
      selectedView.value = view;
    }
  }

  void onDaySelected(DateTime selected, DateTime focused) {
    selectedDay.value = selected;
    focusedDay.value = focused;
  }
}
