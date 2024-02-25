import 'package:az_store/features/shop/models/product_model.dart';
import 'package:az_store/features/shop/screens/product_details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../features/personalization/screens/cart/cart_controller.dart';
import '../../utils/constants/colors.dart';

class ProductCartBtn extends StatelessWidget {
  const ProductCartBtn({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final cartCtr = CartController.instance;

    return Positioned(
        bottom: 0,
        right: 0,
        child: InkWell(
          onTap: (){
            if(product.skus.isEmpty){
              cartCtr.addItemToCart(product, addOne: true, singleVariant: true);
            }
            else{
              Get.to(()=>ProductDetails(product: product),arguments: {
                "product": product
              });
            }
          },
          child:Obx(() {
              final qty = cartCtr.getProductQuantityInCart(product.id);
              return Container(
                padding: const EdgeInsets.all(5),
                width: 35.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: qty != 0 ? KColors.primary : KColors.black,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(20)),
                ),
                child: qty != 0
                    ? Text("$qty", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: KColors.white
                ),)
                    : const Icon(
                        Iconsax.add,
                        color: KColors.white,
                      ),
              );
            },
          ),
        ));
  }
}
