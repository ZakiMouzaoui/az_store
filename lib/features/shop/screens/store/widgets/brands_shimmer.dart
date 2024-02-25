import 'package:az_store/common/widgets/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BrandsShimmer extends StatelessWidget {
  const BrandsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 16.h,
        mainAxisExtent: 80.h,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ShimmerLoader(height: 80.h, width: 56.w, radius: 20,);
      },
    );
  }
}
