import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key, required this.title, required this.subtitle, required this.img,
  });

  final String title;
  final String subtitle;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(img, width: KHelperFunctions.screenWidth()*0.8, height: KHelperFunctions.screenHeight()*0.6,),
        Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
        const SizedBox(height: KSizes.spaceBtwItems,),
        Text(subtitle, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,)
      ],
    );
  }
}