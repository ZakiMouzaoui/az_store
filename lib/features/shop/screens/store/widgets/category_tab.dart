import 'package:az_store/common/widgets/product_grid_shimmer.dart';
import 'package:az_store/common/widgets/shimmer_loader.dart';
import 'package:az_store/features/shop/controllers/shop/brand_controller.dart';
import 'package:az_store/features/shop/controllers/shop/product_controller.dart';
import 'package:az_store/features/shop/models/category_model.dart';
import 'package:az_store/features/shop/screens/store/widgets/brand_showcase_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/products_grid.dart';
import '../../../../../common/widgets/section_header.dart';
import '../../all_products/all_products.dart';
import 'brand_showcase_card.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> with AutomaticKeepAliveClientMixin{
  /*
  late final brands =
  BrandController.instance.fetchBrandsByCategory(widget.categoryModel.id);

  final productController = ProductController.instance;

  late Future<List<Product>> products;
   */

  @override
  void initState() {
    //products = productController.fetchProductsByBrand(br limit: 6);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final brandController = BrandController.instance;
    final productController = ProductController.instance;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Obx((){
        if(brandController.isLoading.value){
          return ListView.separated(itemBuilder: (_,__)=>const BrandShowCaseShimmer(), separatorBuilder: (_,__)=>SizedBox(height: 16.h,), itemCount: 3);
        }
        final brands = brandController.fetchBrandsByCategory(widget.categoryModel.id);

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) => BrandShowcaseCard(brandModel: brands[index]),
                    separatorBuilder: (_, __) => SizedBox(
                      height: 16.h,
                    ),
                    itemCount: brands.length
                ),
          
                SizedBox(height: 16.h,),

          
                /// Section header

                FutureBuilder(
                    future: productController.fetchProductsByCategory(widget.categoryModel.id),
                    builder: (_,snapshot){
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerLoader(height: 15.h, width: 150.w),
                            SizedBox(height: 16.h,),
                            const ProductsGridShimmer(count: 4,)
                          ],
                        );
                      }
                      if(snapshot.hasError){
                        return const Text("Something went wrong");
                      }
          
                      if (snapshot.data!.isNotEmpty) {
                        return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SectionHeader(
                            text: "You might like",
                            btnText: 'View all',
                            onPressed: ()=>Get.to(()=>AllProducts(title: widget.categoryModel.name)),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          ProductsGrid(products: snapshot.data!,)
                        ],
                      );
                      }
                      return const SizedBox.shrink();
          
                    }
                )

              ]),
        );
      }),
      /*
      FutureBuilder(
        future: products,
        builder: (_,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return ListView.separated(itemBuilder: (_,__)=>const BrandShowCaseShimmer(), separatorBuilder: (_,__)=>SizedBox(height: 16.h,), itemCount: 3);
          }
          if(snapshot.hasError){
            return const Text("Something went wrong", textAlign: TextAlign.center,);
          }

          return ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) => BrandShowcaseCard(brandModel: brands[index], products: productController.filterProductsByBrand(snapshot.data!, brands[index].id),),
                  separatorBuilder: (_, __) => SizedBox(
                    height: 16.h,
                  ),
                  itemCount: brands.length
              ),

              /// Section header
              if (snapshot.data!.isNotEmpty) Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SectionHeader(
                    text: "You might like",
                    btnText: 'View all',
                    onPressed: ()=>Get.to(()=>AllProducts(title: widget.categoryModel.name)),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ProductsGrid(products: snapshot.data!,)
                ],
              ),
          ]);
        },
      )
       */
    );
  }

  @override
  bool get wantKeepAlive => true;
}
