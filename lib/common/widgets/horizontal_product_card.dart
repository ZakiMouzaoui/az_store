import 'package:az_store/common/widgets/product_price_column.dart';
import 'package:az_store/features/shop/screens/product_details/product_details.dart';
import 'package:az_store/features/shop/screens/product_reviews/widgets/rating_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../features/shop/models/product_model.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';
import 'discount_container.dart';
import 'favorite_icon_button.dart';


class HorizontalProductCard extends StatelessWidget {
  const HorizontalProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap:()=> Get.to(()=>ProductDetails(product: product), arguments: {
        "product": product
      }),
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: isDark ? KColors.darkerGrey : KColors.lightContainer,
            borderRadius: BorderRadius.circular(20),
        ),
        width: 320.w,
        child: Row(
          children: [
            /// Product thumbnail
            Container(
              width: 140.w,
                //padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: isDark ? KColors.dark : KColors.lightContainer
                ),
                child: Stack(
                  children: [
                    Center(child: CachedNetworkImage(
                      imageUrl: product.images[0],
                      errorWidget: (_,__,___)=> const Icon(Icons.error_outline),
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (product.discountPercent != 0)  DiscountContainer(discount: product.discountPercent!) else const Spacer()  ,
                            FavoriteIconButton(padding: 8, product: product.id,)
                          ],
                      ),
                    ),
                  ],
                ),
              ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 8.h, left: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelLarge,),
                    SizedBox(height: 4.h,),
                    Row(
                      children: [
                        Text(product.brandName, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium,),
                        SizedBox(width: 4.w,),
                        const Icon(Iconsax.verify5, color: KColors.primary, size: 14,),
                      ],
                    ),
                    SizedBox(height: 4.h,),
                    if(product.rating != null)  KRatingIndicator(itemSize: 15.h, iconColor: KColors.secondary, rating: product.rating!,),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductPriceColumn(product: product),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: KColors.black,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(20)),
                          ),
                          child: const Icon(Iconsax.add, color: KColors.white,),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
