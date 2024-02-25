import 'package:az_store/features/auth/controllers/on_boarding/on_boarding_controller.dart';
import 'package:az_store/features/auth/screens/on_boarding/widgets/on_boarding_dot_navigation.dart';
import 'package:az_store/features/auth/screens/on_boarding/widgets/on_boarding_next_btn.dart';
import 'package:az_store/features/auth/screens/on_boarding/widgets/on_boarding_skip.dart';
import 'package:az_store/features/auth/screens/on_boarding/widgets/on_boarding_widget.dart';
import 'package:az_store/utils/constants/image_strings.dart';
import 'package:az_store/utils/constants/sizes.dart';
import 'package:az_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(KSizes.defaultSpace),
            child: PageView(
              controller: controller.pageController,
              onPageChanged: controller.changePageIdx,
              children: const [
                OnBoardingWidget(
                  img: KImages.onBoardingImage1,
                  title: KTexts.onBoardingTitle1,
                  subtitle: KTexts.onBoardingSubTitle1,
                ),
                OnBoardingWidget(
                  img: KImages.onBoardingImage2,
                  title: KTexts.onBoardingTitle2,
                  subtitle: KTexts.onBoardingSubTitle2,
                ),
                OnBoardingWidget(
                  img: KImages.onBoardingImage3,
                  title: KTexts.onBoardingTitle3,
                  subtitle: KTexts.onBoardingSubTitle3,
                )
              ],
            ),
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextBtn()
        ],
      ),
    );
  }
}
