import 'package:az_store/common/widgets/shimmer_loader.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/colors.dart';


class HorizontalProductShimmer extends StatelessWidget {
  const HorizontalProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: isDark ? KColors.darkerGrey : KColors.lightContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      width: 320.w,
      child: Row(
        children: [
          /// Product thumbnail
          ShimmerLoader(height: double.infinity, width: 140.w),
          SizedBox(width: 8.w,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 8.h, left: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerLoader(height: 10.h, width: 120.w),
                  SizedBox(height: 8.h,),
                  ShimmerLoader(height: 10.h, width: 80.w),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerLoader(height: 15.h, width: 80.w),
                      ShimmerLoader(height: 30.h, width: 30.w, borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(20)
                      ),)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
