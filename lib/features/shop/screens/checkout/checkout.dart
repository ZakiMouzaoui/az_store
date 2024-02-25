import 'package:az_store/common/widgets/cart_items_list.dart';
import 'package:az_store/common/widgets/custom_app_bar.dart';
import 'package:az_store/common/widgets/k_circular_indicator.dart';
import 'package:az_store/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:az_store/features/shop/screens/checkout/widgets/billing_summary.dart';
import 'package:az_store/features/shop/screens/checkout/widgets/coupon_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../personalization/screens/cart/cart_controller.dart';


class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final checkoutController = Get.put(CheckoutController());
    final cartController = CartController.instance;

    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Checkout", style: Theme.of(context).textTheme.headlineSmall,),
        showReturnBtn: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [

              /// Cart items
              CartItemsList(editQty: false, cartItems: cartController.cartItems),
              SizedBox(height: 32.h,),

              /// Coupon field
              const CouponField(),
              SizedBox(height: 16.h,),

              /// Checkout summary
             const BillingSummary()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Obx(
            () => ElevatedButton(
            onPressed: checkoutController.isCheckoutEnabled.isTrue ?  checkoutController.confirmPayment : null,
            child: checkoutController.isOrderLoading.isTrue ? const KCircularIndicator() : const Text("Confirm"),
          ),
        ),
      ),
    );
  }
}
