import 'package:az_store/common/widgets/product_grid_shimmer.dart';
import 'package:az_store/common/widgets/search_container.dart';
import 'package:az_store/common/widgets/section_header.dart';
import 'package:az_store/features/shop/controllers/shop/product_controller.dart';
import 'package:az_store/features/shop/screens/home/widgets/banner_carousel.dart';
import 'package:az_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:az_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:az_store/common/widgets/products_grid.dart';
import 'package:az_store/utils/constants/colors.dart';
import 'package:az_store/utils/constants/image_strings.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    final productController = Get.put(ProductController());

    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              color: KColors.primary,
            ),
            Positioned(
              top: -100.h,
              right: -250.w,
              child: Container(
                height: 400.h,
                width: 400.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: KColors.white.withOpacity(0.1)),
              ),
            ),
            Positioned(
              top: 150.h,
              right: -250.w,
              child: Container(
                height: 400.h,
                width: 400.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: KColors.white.withOpacity(0.1)),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  /// App bar
                  const HomeAppBar(),
                  SizedBox(
                    height: 32.h,
                  ),

                  /// Search bar
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: const SearchContainer(text: "Search in store"),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),

                  /// Popular categories
                  const HomeCategories(),
                  SizedBox(
                    height: 16.h,
                  ),

                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                        color: isDark ? KColors.black : KColors.light),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Banner carousel
                        const BannerCarousel(),
                        SizedBox(
                          height: 24.h,
                        ),

                        /// Products grid
                        SectionHeader(
                          text: "Popular Products",
                          btnText: "View all",
                          textColor: isDark ? KColors.light : KColors.dark,
                          btnTextColor:
                              isDark ? KColors.white : KColors.primary,
                          onPressed: productController.viewAllFeaturedProducts,
                        ),

                        FutureBuilder(
                            future: productController.fetchFeaturedProducts(limit: 6),
                            builder: (_, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const ProductsGridShimmer();
                              }
                              if (snapshot.hasError) {
                                print(snapshot.error);
                                return Column(
                                  children: [
                                    const Text("Something went wrong"),
                                    Lottie.asset(KImages.somethingWentWrong,
                                        height: 200.h, width: double.infinity),
                                  ],
                                );
                              }
                              return ProductsGrid(
                                products: snapshot.data!,
                              );
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
