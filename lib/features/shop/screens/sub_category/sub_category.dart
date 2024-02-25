import 'package:az_store/common/widgets/custom_app_bar.dart';
import 'package:az_store/features/shop/controllers/shop/category_controller.dart';
import 'package:az_store/features/shop/models/category_model.dart';
import 'package:az_store/features/shop/screens/sub_category/widgets/category_banner.dart';
import 'package:az_store/features/shop/screens/sub_category/widgets/category_horizontal_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key, required this.parentCategory});

  final CategoryModel parentCategory;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    final categories = controller.fetchSubCategories(parentCategory.id);

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          parentCategory.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showReturnBtn: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              /// Category banner
              CategoryBanner(imgUrl: parentCategory.promoBanner!),
              SizedBox(
                height: 32.h,
              ),

              /// Sub-categories
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  itemBuilder: (_,index) => CategoryHorizontalProducts(categoryModel: categories[index]),
                  separatorBuilder: (_, __) => SizedBox(height: 16.h,),
              ),
              SizedBox(height: 16.h,),

              /// For others
              if(parentCategory.id == "1") CategoryHorizontalProducts(title: "Others", categoryModel: parentCategory)
            ],
          ),
        ),
      ),
    );
  }
}
