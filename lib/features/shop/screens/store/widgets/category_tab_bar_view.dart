import 'package:az_store/features/shop/controllers/shop/brand_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/category_model.dart';
import 'brand_showcase_shimmer.dart';
import 'category_tab.dart';

class CategoryTabBarView extends StatelessWidget {
  const CategoryTabBarView({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;

    return TabBarView(
        children: categories
            .map((category) => Obx(() => brandController.isLoading.value
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (_, __) => const BrandShowCaseShimmer(),
                      separatorBuilder: (_, __) => SizedBox(
                        height: 16.h,
                      ),
                    ),
                  )
                : CategoryTab(categoryModel: category)))
            .toList());
  }
}
