import 'package:az_store/features/shop/controllers/product_details/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../personalization/screens/cart/cart_controller.dart';
import '../../../models/product_model.dart';


class AddToCartBottom extends StatelessWidget {
  const AddToCartBottom({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    final productController = ProductDetailsController.instance;
    final cartController = CartController.instance;

    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: isDark ? KColors.darkerGrey : KColors.lightContainer),
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: ()=>cartController.changeQuantity(add: false),
                icon: const Icon(
                  Iconsax.minus,
                  color: KColors.white,
                ),
                style: IconButton.styleFrom(backgroundColor: KColors.black),
              ),
              SizedBox(
                width: 8.w,
              ),
              Obx(()=> Text("${cartController.selectedProductQuantity}")),
              SizedBox(
                width: 8.h,
              ),
              IconButton(
                onPressed: ()=>cartController.changeQuantity(),
                icon: const Icon(
                  Iconsax.add,
                  color: KColors.white,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: KColors.black,
                ),
              ),
            ],
          ),
          Obx(
            () => ElevatedButton(
              onPressed: productController.isCheckoutEnabled.isTrue && cartController.selectedProductQuantity.value != 0 ? ()=>cartController.addItemToCart(product) : null,
              style: ElevatedButton.styleFrom(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  backgroundColor: KColors.black,
                  side: BorderSide(
                    color: productController.isCheckoutEnabled.isTrue && cartController.selectedProductQuantity.value != 0 ? Colors.transparent : KColors.light
                  )

              ),
              child: Row(
                children: [
                  const Icon(Iconsax.shopping_bag),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Text("Add to cart")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
