import 'package:az_store/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:az_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:az_store/utils/formatters/formatter.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/section_header.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../personalization/screens/cart/cart_controller.dart';


class BillingSummary extends StatelessWidget {
  const BillingSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    final checkoutController = CheckoutController.instance;

    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: KColors.darkGrey),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Subtotal"),
              Text("\$${KFormatter.formatPrice(cartController.totalCartPrice.value)}")
            ],
          ),
          SizedBox(height: 16.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Shipping Fee"),
              Text("\$${KFormatter.formatPrice(checkoutController.shippingFee)}")
            ],
          ),
          SizedBox(height: 16.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Discount"),
              Obx(() => Text("-\$${KFormatter.formatPrice(checkoutController.discountPrice.value)}"))
            ],
          ),
          SizedBox(height: 8.h,),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total", style: Theme.of(context).textTheme.titleSmall,),
              Obx(() => Text("\$${KFormatter.formatPrice(checkoutController.shippingFee+cartController.totalCartPrice.value-checkoutController.discountPrice.value)}", style: Theme.of(context).textTheme.titleSmall,))
            ],
          ),
          SizedBox(height: 8.h,),
          const Divider(),
          SectionHeader(text: "Payment Method", btnText: "Change", onPressed: (){
            KHelperFunctions.showPaymentMethods(context);
          },),
          Obx(
            () => Row(
              children: [
                Container(
                  width: 70.w,
                  height: 35.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: KColors.white,
                    border: isDark ?  null : Border.all(color: KColors.darkGrey)
                  ),
                  child: Image.asset(checkoutController.selectedPaymentMethod.value.image),
                ),
                SizedBox(width: 8.w,),
                Text(checkoutController.selectedPaymentMethod.value.name)
              ],
            ),
          ),
          SizedBox(height: 8.h,),
          const Divider(),
          const BillingAddressSection()
        ],
      ),
    );
  }
}
