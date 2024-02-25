import 'package:az_store/common/widgets/cart_items_list.dart';
import 'package:az_store/common/widgets/custom_app_bar.dart';
import 'package:az_store/features/shop/screens/checkout/checkout.dart';
import 'package:az_store/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/widgets/navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../personalization/screens/cart/cart_controller.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final isDark = KHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: Obx(
          () => Text(
            "Cart (${cartController.totalCartItems.value})",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        showReturnBtn: true,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Obx(() {
            if (cartController.cartItems.isEmpty) {
              return Container(
                alignment: Alignment.center,
                height: 0.75.sh,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(KImages.emptyCart, width: 0.8.sw),
                    SizedBox(
                      height: 16.h,
                    ),
                    const Text(
                      "Whoops, your cart is empty...",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SizedBox(
                        width: 200.w,
                        child: OutlinedButton(
                            onPressed: () =>
                                Get.offAll(() => const NavigationMenu()),
                            style: OutlinedButton.styleFrom(
                                backgroundColor: KColors.black,
                                side: isDark
                                    ? const BorderSide(color: KColors.grey)
                                    : BorderSide.none),
                            child: Text(
                              "Let's fill it",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(color: KColors.white),
                            )))
                  ],
                ),
              );
            } else {
              return CartItemsList(cartItems: cartController.cartItems);
            }
          })),
      bottomNavigationBar: Obx(() {
        if (cartController.cartItems.isNotEmpty) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const Checkout()),
                    child: Obx(() => Text(
                        "Checkout \$${KFormatter.formatPrice(cartController.totalCartPrice.value)}")),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: cartController.clearCart,
                    child: const Text("Clear Cart"),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
