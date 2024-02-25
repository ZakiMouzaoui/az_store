import 'dart:math';

import 'package:az_store/common/widgets/shimmer_loader.dart';
import 'package:az_store/features/shop/controllers/product_details/product_details_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';


class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    final controller = ProductDetailsController.instance;

    return Obx(
      () => SizedBox(
        width: double.infinity,
        height: 250.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CachedNetworkImage(imageUrl: images[controller.selectedImgIndex.value]),

            Positioned(
                bottom: 0,
                child: Container(
                  height: 80.h,
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.w),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_,index)=>SizedBox(width: 12.w,),
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: ()=>controller.selectedImgIndex(index),
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        height: 80.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          color: isDark ? KColors.dark : KColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: controller.selectedImgIndex.value == index ? Border.all(color: KColors.primary) : null
                        ),
                        child: CachedNetworkImage(
                            imageUrl: images[index],
                            placeholder: (_, __)=>ShimmerLoader(height: 80.h, width: 80.w, radius: 10,),
                        ),
                      ),
                    ), itemCount: min(images.length, 3),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
