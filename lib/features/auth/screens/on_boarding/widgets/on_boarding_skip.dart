import 'package:az_store/features/auth/controllers/on_boarding/on_boarding_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';


class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(top: 56, right: KSizes.defaultSpace, child: GestureDetector(onTap: controller.skipPages, child: const Text("Skip")));
  }
}
