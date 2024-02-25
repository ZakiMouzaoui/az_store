import 'package:az_store/data/repositories/auth/auth_repository.dart';
import 'package:az_store/features/auth/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  late final PageController pageController;
  Rx<int> currentPageIdx = 0.obs;

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  void goToPage(int page) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      pageController.animateToPage(page,
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
      currentPageIdx.value = page;
    });
  }

  void changePageIdx(int page) {
    currentPageIdx.value = page;
  }

  void nextPage() {
    if (currentPageIdx.value < 2) {
      goToPage(currentPageIdx.value + 1);
    } else {
      AuthRepository.instance.completeOnBoarding();
      Get.offAll(() => const Login());
    }
  }

  void skipPages() {
    pageController.jumpToPage(2);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
