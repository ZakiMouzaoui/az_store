import 'package:az_store/common/widgets/horizontal_product_shimmer.dart';
import 'package:az_store/features/shop/controllers/shop/product_controller.dart';
import 'package:az_store/features/shop/screens/all_products/all_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/horizontal_product_card.dart';
import '../../../../../common/widgets/section_header.dart';
import '../../../models/category_model.dart';

class CategoryHorizontalProducts extends StatelessWidget {
  const CategoryHorizontalProducts({super.key, required this.categoryModel, this.title});

  final CategoryModel categoryModel;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final productController = ProductController.instance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          text: title ?? categoryModel.name,
          btnText: "View all",
          onPressed: () => productController.viewAllProductsByCategory(categoryModel),
        ),
        FutureBuilder(
            future: productController.fetchProductsByCategory(categoryModel.id),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: 140.h,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (_, __) => const HorizontalProductShimmer(),
                      separatorBuilder: (_, __) => SizedBox(
                            width: 16.w,
                          ),
                      itemCount: 3),
                );
              }
              if(snapshot.hasError){
                return const Center(child: Text("Something went wrong"),);
              }
              final products = snapshot.data!;
              if(products.isEmpty){
                return const Text("No products for this category yet!");
              }
              return SizedBox(
                height: 140.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (_, index){
                      final product = snapshot.data![index];
                      return HorizontalProductCard(product: product);
                    },
                    separatorBuilder: (_, __) => SizedBox(
                          width: 8.w,
                        ),
                    itemCount: snapshot.data!.length),
              );
            }),
      ],
    );
  }
}
