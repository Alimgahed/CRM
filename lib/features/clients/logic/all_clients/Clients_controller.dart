import 'package:get/get.dart';

class ClientsController extends GetxController {
  final RxInt selectedFilter = 200.obs;

  void selectFilter(int index) {
    selectedFilter.value = index;
  }
}
