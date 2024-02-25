import 'package:az_store/common/widgets/custom_app_bar.dart';
import 'package:az_store/common/widgets/custom_tab_bar.dart';
import 'package:az_store/common/widgets/search_container.dart';
import 'package:az_store/common/widgets/section_header.dart';
import 'package:az_store/features/shop/controllers/shop/brand_controller.dart';
import 'package:az_store/features/shop/controllers/shop/category_controller.dart';
import 'package:az_store/features/shop/screens/all_brands/all_brands.dart';
import 'package:az_store/features/shop/screens/store/widgets/brands_grid.dart';
import 'package:az_store/features/shop/screens/store/widgets/brands_shimmer.dart';
import 'package:az_store/features/shop/screens/store/widgets/category_tab_bar_view.dart';
import 'package:az_store/utils/constants/colors.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/cart_counter.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);
    final featuredCategories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());

    return RefreshIndicator(
      onRefresh: () async {
        brandController.featuredBrands();
      },
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      child: DefaultTabController(
        length: featuredCategories.length,
        child: Scaffold(
          /// App bar
          appBar: CustomAppBar(
            title: Text(
              "Store",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            actions: [
              CartCounter(iconColor: isDark ? KColors.light : KColors.dark),
              /*
              ElevatedButton(
                  onPressed: brandController.fetchBrands,
                  child: const Text("refresh"))
               */
            ],
          ),

          /// Custom scroll view
          body: NestedScrollView(
              headerSliverBuilder: (_, __) => [
                    SliverAppBar(
                        pinned: true,
                        floating: true,
                        backgroundColor: isDark ? KColors.black : KColors.white,
                        automaticallyImplyLeading: false,
                        expandedHeight: 506.h,
                        flexibleSpace: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 16.h),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              /// Search bar
                              SizedBox(
                                height: 16.h,
                              ),
                              const SearchContainer(
                                text: "Search in store",
                                showBorder: true,
                                hasBackground: false,
                              ),
                              SizedBox(
                                height: 32.h,
                              ),

                              /// Section header
                              SectionHeader(
                                text: "Featured Brands",
                                btnText: "View all",
                                onPressed: () => Get.to(() => AllBrands(
                                      allBrands: brandController.allBrands,
                                    )),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),

                              /// Brands grid
                              Obx(() {
                                if (brandController.isLoading.value) {
                                  return const BrandsShimmer();
                                }
                                return BrandsGrid(
                                  itemCount: 6,
                                  brands: brandController.featuredBrands,
                                );
                              }),

                              SizedBox(
                                height: 32.h,
                              ),
                            ],
                          ),
                        ),

                        /// Tab bar
                        bottom: CustomTabBar(
                            tabs: featuredCategories
                                .map(
                                    (element) => Tab(child: Text(element.name)))
                                .toList()))
                  ],
              body: CategoryTabBarView(categories: featuredCategories)),
        ),
      ),
    );
  }
}
