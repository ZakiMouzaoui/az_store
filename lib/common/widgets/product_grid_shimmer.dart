import 'package:az_store/common/widgets/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';

class ProductsGridShimmer extends StatelessWidget {
  const ProductsGridShimmer({super.key, this.count});

  final int? count;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: count ?? 6,
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 280.h,
        mainAxisSpacing: 8.h,
        crossAxisSpacing: 8.w,
      ),
      itemBuilder: (_, __) => Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            color: isDark ? KColors.darkerGrey : KColors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: KColors.darkGrey.withOpacity(0.1),
                  blurRadius: 50,
                  spreadRadius: 7,
                  offset: const Offset(0, 2))
            ]),
        width: 180.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Product thumbnail
            ShimmerLoader(
              height: 180.h,
              width: double.infinity,
              radius: 20,
            ),
            SizedBox(
              height: 8.h,
            ),

            /// Product details
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerLoader(
                        height: 10.h,
                        width: 120.w,
                        radius: 5,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      ShimmerLoader(
                        height: 10.h,
                        width: 100.w,
                        radius: 5,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShimmerLoader(
                            height: 15.h,
                            width: 100.w,
                            radius: 5,
                          ),
                          ShimmerLoader(
                            height: 30.h,
                            width: 30.w,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(20)
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
