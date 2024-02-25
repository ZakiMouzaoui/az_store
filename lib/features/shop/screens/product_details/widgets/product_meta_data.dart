import 'package:az_store/utils/formatters/formatter.dart';
import 'package:az_store/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/discount_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../models/product_model.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if(product.discountPercent != 0)  Padding(padding: EdgeInsets.only(right: 16.w), child: DiscountContainer(discount: product.discountPercent!,)),

            /// Product price
            Row(
              children: [
                if (product.discountPercent != 0) Row(
                  children: [
                    Text("\$${KFormatter.formatPrice(product.price)}",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(decoration: TextDecoration.lineThrough)),
                    SizedBox(
                      width: 8.w,
                    ),
                  ],
                ),

                Text(
                  "\$${KPricingCalculator.getSalePrice(product.discountPercent!, product.price)}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 16.h,
        ),

        /// Product name
        Text(
          product.name,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: 16.h,
        ),

        /// Stock status
        Text.rich(TextSpan(
            text: "status: ",
            style: Theme.of(context).textTheme.bodySmall,
            children: [
              TextSpan(
                  text: product.stock != 0 ? "In Stock" : "Out of Stock",
                  style: Theme.of(context).textTheme.titleMedium)
            ])),
        SizedBox(
          height: 16.h,
        ),

        /// Product brand
        Row(
          children: [
            Text(
              product.brandName,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            SizedBox(
              width: 8.w,
            ),
            const Icon(
              Iconsax.verify5,
              color: KColors.primary,
              size: 14,
            ),
            SizedBox(width: 8.w,),
          ],
        ),
      ],
    );
  }
}
