import 'package:az_store/utils/constants/colors.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({super.key, required this.height, required this.width, this.radius=15, this.color, this.borderRadius});

  final double height;
  final double width;
  final double radius;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    return Shimmer.fromColors(
        baseColor: isDark ? Colors.grey[850]! : Colors.grey[300]!,
        highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(radius),
            color:  color ?? (isDark ? KColors.darkerGrey: KColors.white)
          ),
        ),
    );
  }
}
