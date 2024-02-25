import 'package:az_store/common/widgets/shimmer_loader.dart';
import 'package:az_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BrandShowCaseShimmer extends StatelessWidget {
  const BrandShowCaseShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: KColors.darkerGrey)
      ),
      child: Column(
        children: [
          Row(
            children: [
              ShimmerLoader(height: 56.h, width: 56.w, radius: 100,),
              SizedBox(width: 8.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerLoader(height: 10.h, width: 60.w),
                  SizedBox(height: 8.h,),
                  ShimmerLoader(height: 10.h, width: 80.w),
                ],
              ),


            ],
          ),
          SizedBox(height: 8.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerLoader(height: 110.h, width: 110.w, radius: 20,),
                ShimmerLoader(height: 110.h, width: 110.w, radius: 20,),
                ShimmerLoader(height: 110.h, width: 110.w, radius: 20,)
              ]
          )
        ],
      ),
    );
  }
}
