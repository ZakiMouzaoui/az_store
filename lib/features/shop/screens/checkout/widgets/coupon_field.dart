import 'package:az_store/common/widgets/k_circular_indicator.dart';
import 'package:az_store/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';


class CouponField extends StatelessWidget {
  const CouponField({super.key});

  @override
  Widget build(BuildContext context) {
    final checkoutController = CheckoutController.instance;

    return TextFormField(
      onChanged: checkoutController.onCouponChanged,
      controller: checkoutController.couponCtr,
      decoration: InputDecoration(
          hintText: "Have a promo code? Enter here",
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: SizedBox(
              width: 80.w,
              child: Obx(
                  () => ElevatedButton(
                  onPressed: checkoutController.couponCode.value.isEmpty || checkoutController.couponLoading.isTrue || checkoutController.discountPrice.value > 0 ? null : checkoutController.applyCoupon,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: KColors.darkerGrey,
                      side: const BorderSide(color: Colors.transparent),
                      padding: EdgeInsets.symmetric(horizontal: 12.w)
                  ),
                  child: checkoutController.couponLoading.isTrue ? const KCircularIndicator() : const Text("Apply"),
                ),
              ),
            ),
          )
      ),
    );
  }
}
