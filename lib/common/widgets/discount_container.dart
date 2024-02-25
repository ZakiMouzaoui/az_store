import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/colors.dart';


class DiscountContainer extends StatelessWidget {
  const DiscountContainer({super.key, required this.discount});

  final int discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 8.w, vertical: 4.h
      ),
      decoration: BoxDecoration(
          color: KColors.secondary,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Text("-$discount%", style: Theme.of(context).textTheme.labelLarge!.apply(
          color: KColors.black
      ),),
    );
  }
}
