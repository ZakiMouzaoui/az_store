import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../features/personalization/screens/cart/cart_controller.dart';
import '../../features/shop/screens/cart/cart.dart';
import '../../utils/constants/colors.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({super.key, required this.iconColor, this.textColor});

  final Color iconColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    return Stack(
      children: [
        IconButton(onPressed: ()=>Get.to(()=>const Cart()), icon: Icon(Iconsax.shopping_bag, color: iconColor,)),
        Positioned(
          right: 5.w,
          top: 3.h,
          child: Container(
            alignment: Alignment.center,
            width: 15.w,
            height: 15.h,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color:  KColors.black
            ),
            child: Obx(()=> Text("${controller.totalCartItems.value}", style: Theme.of(context).textTheme.labelLarge!.apply(fontSizeFactor: 0.8, color: KColors.white),)),
          ),
        )
      ],
    );
  }
}