import 'package:az_store/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/shop/models/product_model.dart';
import '../../utils/formatters/formatter.dart';

class ProductPriceColumn extends StatelessWidget {
  const ProductPriceColumn({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        product.discountPercent != 0
            ? Text("\$${KFormatter.formatPrice(product.price)}",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(decoration: TextDecoration.lineThrough))
            : const SizedBox.shrink(),
        Padding(
            padding:
                EdgeInsets.only(bottom: product.discountPercent != 0 ? 0 : 4.h),
            child: Text(
              "\$${KPricingCalculator.getSalePrice(product.discountPercent!, product.price)}",
              style: Theme.of(context).textTheme.bodyLarge,
            )),
      ],
    );
  }
}
