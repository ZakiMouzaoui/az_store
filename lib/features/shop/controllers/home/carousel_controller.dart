import 'package:get/get.dart';

class BannerCarouselController extends GetxController {
  Rx<int> currentIdx = 0.obs;

  void changeIdx(int idx) {
    currentIdx.value = idx;
  }
}
