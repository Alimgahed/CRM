import 'package:get/get.dart';

class ImageController extends GetxController {
  var currentIndex = 0.obs;
  late List<String> images;

  void initImages(List<String> imgs, int startIndex) {
    images = imgs;
    currentIndex.value = startIndex;
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
