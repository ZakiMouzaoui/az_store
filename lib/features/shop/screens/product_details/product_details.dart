import 'package:az_store/common/widgets/custom_app_bar.dart';
import 'package:az_store/common/widgets/favorite_icon_button.dart';
import 'package:az_store/common/widgets/section_header.dart';
import 'package:az_store/features/shop/controllers/product_details/product_details_controller.dart';
import 'package:az_store/features/shop/screens/product_details/widgets/add_to_cart_bottom.dart';
import 'package:az_store/features/shop/screens/product_details/widgets/poduct_rating_share.dart';
import 'package:az_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:az_store/features/shop/screens/product_details/widgets/product_description.dart';
import 'package:az_store/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:az_store/features/shop/screens/product_details/widgets/product_variation.dart';
import 'package:az_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:az_store/utils/constants/colors.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);
    final productDetailsCtr = ProductDetailsController.instance;
    productDetailsCtr.initSKUs();

    return PopScope(
      onPopInvoked: (_)async{
        productDetailsCtr.reset();
      },
      child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              color: isDark ? KColors.darkerGrey : KColors.light,
              child: Column(
                children: [
                  /// Appbar
                  CustomAppBar(
                    showReturnBtn: true,
                    actions: [FavoriteIconButton(product: product.id,)],
                  ),

                  /// Product image slider
                  ProductImageSlider(images: product.images,),
                  SizedBox(
                    height: 8.h,
                  ),

                  /// Product details
                  Container(
                    padding: EdgeInsets.only(
                        left: 16.w, right: 16.w, top: 8.h, bottom: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                        color: isDark ? KColors.black : KColors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Product rating and sharing
                        ProductRatingShare(rating: product.rating, totalReviews: product.totalReviews!,),
                        SizedBox(
                          height: 8.h,
                        ),

                        /// Product meta data
                        ProductMetaData(product: product,),
                        SizedBox(height: 24.h,),

                        /// Product variations
                        if (product.productAttributeModels.isNotEmpty) Padding(padding: EdgeInsets.only(bottom: 24.h), child: ProductVariation(product: product)),

                        /// Product description
                        const SectionHeader(text: "Description"),
                        SizedBox(
                          height: 8.h,
                        ),
                        ProductDescription(description: product.description,),
                        SizedBox(
                          height: 16.h,
                        ),

                        /// Checkout button
                        SizedBox(
                          width: double.infinity,
                          child: Obx(
                              () => ElevatedButton(
                                onPressed: productDetailsCtr.isCheckoutEnabled.value ? () {} : null, child: const Text("Checkout")),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),

                        /// Reviews
                        const Divider(),
                        SizedBox(
                          height: 8.h,
                        ),
                        SectionHeader(
                          text: "Reviews(${product.totalReviews})",
                          btnText: product.totalReviews != 0 ? "View all" : null,
                          onPressed: ()=>Get.to(()=>ProductReviews(productId: product.id, avgRating: product.rating!,)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: AddToCartBottom(product: product,)),
    );
  }
}
