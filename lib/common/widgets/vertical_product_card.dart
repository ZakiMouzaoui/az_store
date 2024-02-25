import 'package:az_store/common/widgets/discount_container.dart';
import 'package:az_store/common/widgets/favorite_icon_button.dart';
import 'package:az_store/common/widgets/product_cart_btn.dart';
import 'package:az_store/common/widgets/product_price_column.dart';
import 'package:az_store/features/shop/screens/product_details/product_details.dart';
import 'package:az_store/features/shop/screens/product_reviews/widgets/rating_indicator.dart';
import 'package:az_store/utils/constants/colors.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../features/shop/models/product_model.dart';

class VerticalProductCard extends StatelessWidget {
  const VerticalProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: ()=>Get.to(()=>ProductDetails(product: product), arguments: {
        "product": product
      }),
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: isDark ? KColors.darkerGrey : KColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: KColors.darkGrey.withOpacity(0.1),
              blurRadius: 50,
              spreadRadius: 7,
              offset: const Offset(0, 2)
            )
          ]
        ),
        width: 180.w,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Product thumbnail
                Container(
                  height: 180.h,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: isDark ? KColors.dark : KColors.lightContainer
                  ),
                  child: Stack(
                    children: [
                      Center(child: CachedNetworkImage(
                        imageUrl: product.images[0],
                        errorWidget: (_,__,___)=>const Icon(Icons.error_outline),
                      )),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isDark ? KColors.black.withOpacity(0.3) : null,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          product.discountPercent != 0 ? DiscountContainer(discount: product.discountPercent!,) : const SizedBox.shrink(),
                          FavoriteIconButton(product: product.id,)
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h,),

                /// Product details
                Expanded(
                  child: Padding(padding: EdgeInsets.only(left: 8.w), child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelLarge,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 1.h),
                              child: Row(
                                children: [
                                  Flexible(child: Text(product.brandName, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium,)),
                                  SizedBox(width: 4.w,),
                                  const Icon(Iconsax.verify5, color: KColors.primary, size: 14,),
                                ],
                              ),
                            ),
                          ),
                          product.rating != null ? Padding(padding: EdgeInsets.only(right: 8.w), child: KRatingIndicator(itemSize: 14.h, iconColor: KColors.secondary, rating: product.rating!,)) : const SizedBox.shrink()
                        ],
                      ),

                      const Spacer(),

                          ProductPriceColumn(product: product),

                    ],
                  )),
                ),
              ],
            ),
            ProductCartBtn(product: product,)
          ],
        ),
      ),
    );
  }
}
