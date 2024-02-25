import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/shimmer_loader.dart';


class ReviewsShimmer extends StatelessWidget {
  const ReviewsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ShimmerLoader(height: 65.h, width: 95.w),
            SizedBox(width: 16.w,),
            Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, __)=>Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ShimmerLoader(height: 12.h, width: 12.w, radius: 20,),
                        SizedBox(width: 12.w,),
                        Expanded(child: ShimmerLoader(
                          height: 12.h,
                          width: double.infinity,
                          radius: 10,
                        ))
                      ],
                    ),
                    separatorBuilder: (_, __) => SizedBox(height: 12.h,), itemCount: 5)
            )
          ],
        ),
        SizedBox(height: 32.h,),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_,__)=>Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ShimmerLoader(height: 40.h, width: 40.w, radius: 40,),
                    SizedBox(width: 8.w),
                    ShimmerLoader(height: 15.h, width: 120.w, radius: 15,)
                  ],
                ),
                SizedBox(height: 16.h,),
                ShimmerLoader(height: 100.h, width: double.infinity, radius: 15,),
              ],
            ),
            separatorBuilder: (_, __) => SizedBox(height: 16.h,),
            itemCount: 3
        ),
      ],
    );
  }
}
