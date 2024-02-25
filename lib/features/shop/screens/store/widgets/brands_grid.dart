import 'package:az_store/features/shop/screens/all_brands/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/brand_model.dart';
import 'brand_card.dart';


class BrandsGrid extends StatelessWidget {
  const BrandsGrid({super.key, this.itemCount=4, required this.brands});

  final int? itemCount;
  final List<BrandModel> brands;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 16.h,
          mainAxisExtent: 80.h,
        ), itemBuilder: (_,index)=>BrandCard(brandModel: brands[index], onTap: ()=>Get.to(()=>BrandProducts(
      brandModel: brands[index],
    )),));
  }
}
