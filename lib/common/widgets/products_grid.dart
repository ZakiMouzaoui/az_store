import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/shop/models/product_model.dart';
import 'vertical_product_card.dart';


class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key, this.itemCount, required this.products});

  final int? itemCount;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.h,
          crossAxisSpacing: 8.w,
          mainAxisExtent: 280.h
      ),
      itemBuilder: (_,index)=> VerticalProductCard(product: products[index],),
      itemCount: itemCount ?? products?.length ?? 6,
    );
  }
}
