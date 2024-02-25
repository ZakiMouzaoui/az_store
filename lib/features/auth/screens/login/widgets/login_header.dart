import 'package:az_store/utils/constants/colors.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';


class LoginHeader extends StatelessWidget {
  const LoginHeader ({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            isDark ? KImages.darkAppLogo : KImages.lightAppLogo,
            height: 150.h,
          ),
        ),
        Text(
          KTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          KTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
