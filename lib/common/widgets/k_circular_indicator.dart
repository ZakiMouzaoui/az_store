import 'package:az_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KCircularIndicator extends StatelessWidget {
  const KCircularIndicator({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size ?? 20.h,
        width: size ?? 20.h,
        child: const CircularProgressIndicator(
          strokeWidth: 2,
          color: KColors.white,
        ));
  }
}
