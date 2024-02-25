import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';


class FormDivider extends StatelessWidget {
  const FormDivider({super.key, required this.dividerText});

  final String dividerText;
  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 0.5,
            color: isDark ? KColors.darkGrey : KColors.grey,
            indent: 50.w,
            endIndent: 5.w,
          ),
        ),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium,),
        Expanded(
          child: Divider(
            thickness: 0.5,
            color: isDark ? KColors.darkGrey : KColors.grey,
            indent: 5.w,
            endIndent: 50.w,
          ),
        ),
      ],
    );
  }
}
