import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer(
      {super.key,
      this.hasBackground = true,
      this.showBorder = false,
      this.icon=Iconsax.search_normal,
      required this.text, this.onTap});

  final bool? hasBackground, showBorder;
  final IconData? icon;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: hasBackground == true
                  ? isDark
                      ? KColors.dark
                      : KColors.light
                  : Colors.transparent,
              border: showBorder == true
                  ? Border.all(color: KColors.grey)
                  : null),
          child: Row(
            children: [
              Icon(
                icon,
                color: KColors.darkGrey,
              ),
              SizedBox(
                width: 16.w,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
      ),
    );
  }
}
