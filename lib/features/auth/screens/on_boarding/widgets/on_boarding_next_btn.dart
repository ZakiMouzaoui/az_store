import 'package:az_store/features/auth/controllers/on_boarding/on_boarding_controller.dart';
import 'package:az_store/utils/constants/colors.dart';
import 'package:az_store/utils/constants/sizes.dart';
import 'package:az_store/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingNextBtn extends StatelessWidget {
  const OnBoardingNextBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = KHelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;

    return Positioned(
      bottom: KDeviceUtils.getBottomNavigationBarHeight(),
      right: KSizes.defaultSpace,
      child: ElevatedButton(
        onPressed: controller.nextPage,
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: isDark ? KColors.primary : KColors.dark,
            side: BorderSide.none
        ),
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
