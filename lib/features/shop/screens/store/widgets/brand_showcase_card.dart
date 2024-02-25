import 'dart:math';

import 'package:az_store/features/shop/controllers/shop/product_controller.dart';
import 'package:az_store/features/shop/models/brand_model.dart';
import 'package:az_store/features/shop/screens/product_details/product_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/shimmer_loader.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'brand_card.dart';

class BrandShowcaseCard extends StatelessWidget {
  const BrandShowcaseCard(
      {super.key, required this.brandModel});
  final BrandModel brandModel;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);
    final productController = ProductController.instance;

    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
        decoration: BoxDecoration(
            border: Border.all(color: KColors.darkerGrey),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BrandCard(showBorder: false, brandModel: brandModel),
            SizedBox(
              height: 8.h,
            ),
            FutureBuilder(
                future: productController.fetchProductsByBrand(brandModel.id), builder: (_, snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShimmerLoader(height: 110.h, width: 110.w, radius: 20,),
                          ShimmerLoader(height: 110.h, width: 110.w, radius: 20,),
                          ShimmerLoader(height: 110.h, width: 110.w, radius: 20,)
                        ]
                    );
                  }
                  if(snapshot.hasError){
                    print(snapshot.error);
                    return const Text("Something went wrong");
                  }
                  final products = snapshot.data!;
                  if (products.isNotEmpty) {
                    return SizedBox(
                      height: 110.h,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            final product = products[index];

                            return GestureDetector(
                              onTap: () => Get.to(()=>ProductDetails(product: product), arguments: {
                                "product": product
                              }),
                              child: Container(
                                  width: 120.w,
                                  height: 110.h,
                                  decoration: BoxDecoration(
                                      color: isDark
                                          ? KColors.darkerGrey
                                          : KColors.lightGrey,
                                      borderRadius: BorderRadius.circular(20)),
                                  padding: const EdgeInsets.all(8),
                                  child: CachedNetworkImage(
                                    imageUrl: product.images[0],
                                    errorWidget: (_, __, ___) =>
                                    const Icon(Icons.error_outline),
                                  )),
                            );
                          },
                          separatorBuilder: (_, __) => SizedBox(
                            width: 16.w,
                          ),
                          itemCount: min(products.length, 3)),
                    );
                  } else {
                    return const Text("No products for this brand yet");
                  }
            }
            )

          ],
        ),
      ),
    );
  }
}
