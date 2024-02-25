import 'package:az_store/features/auth/controllers/on_boarding/on_boarding_controller.dart';
import 'package:az_store/utils/constants/colors.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = KHelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;

    return Positioned(
        bottom: KDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: KSizes.defaultSpace,
        child: Obx(
          ()=> AnimatedSmoothIndicator(
              activeIndex: controller.currentPageIdx.value,// PageController
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 6,
                activeDotColor: isDark ? KColors.light : KColors.dark,
              ), // your preferred effect
              onDotClicked: controller.goToPage),
        ));
  }
}
