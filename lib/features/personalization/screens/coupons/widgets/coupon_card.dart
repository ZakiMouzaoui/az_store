import 'package:az_store/common/widgets/section_header.dart';
import 'package:az_store/features/personalization/models/order_coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class CouponCard extends StatelessWidget {
  const CouponCard({super.key, required this.coupon});

  final OrderCouponModel coupon;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border:
              Border.all(color: isDark ? KColors.darkerGrey : KColors.grey)),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Iconsax.code),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Code",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SectionHeader(text: coupon.code)
                ],
              )
            ],
          ),
          Row(
            children: [
              const Icon(Iconsax.tag),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order Tracking",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SectionHeader(text: coupon.orderTrackingCode)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
