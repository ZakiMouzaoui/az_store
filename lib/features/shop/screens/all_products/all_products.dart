import 'package:az_store/common/widgets/custom_app_bar.dart';
import 'package:az_store/common/widgets/products_grid.dart';
import 'package:az_store/common/widgets/shimmer_loader.dart';
import 'package:az_store/common/widgets/sort_drop_down.dart';
import 'package:az_store/features/shop/controllers/product/all_products_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/widgets/product_grid_shimmer.dart';
import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.future, this.query});

  final String title;
  final Query? query;
  final Future<List<Product>>? future;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showReturnBtn: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Obx((){
            if(controller.isLoading.value){
              return Column(
                children: [
                  ShimmerLoader(height: 65.h, width: double.infinity, radius: 15,),
                  SizedBox(height: 32.h,),
                  const ProductsGridShimmer(),
                ],
              );
            }
            if(controller.fetchedProducts.isEmpty){
              return const Center(child: Text("No products found"),);
            }
            return Column(
              children: [
                SortDropDown(),
                SizedBox(
                  height: 32.h,
                ),
                ProductsGrid(products: controller.fetchedProducts),
              ],
            );
          }),
        )
      ),
    );
  }
}
