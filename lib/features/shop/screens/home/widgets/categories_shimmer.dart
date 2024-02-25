import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/shimmer_loader.dart';


class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 85.h, child: ListView.separated(shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 10, itemBuilder: (_, __)=>Column(
        children: [
          ShimmerLoader(height: 66.h, width: 66.w, radius: 100,),
          SizedBox(height: 8.h,),
          ShimmerLoader(height: 8.h, width: 50.w)
        ],
      ), separatorBuilder: (_,__)=>SizedBox(width: 16.w,),),);
  }
}
