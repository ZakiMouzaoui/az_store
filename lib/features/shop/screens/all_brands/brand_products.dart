import 'package:az_store/common/widgets/custom_app_bar.dart';
import 'package:az_store/common/widgets/products_grid.dart';
import 'package:az_store/common/widgets/section_header.dart';
import 'package:az_store/common/widgets/sort_drop_down.dart';
import 'package:az_store/features/shop/models/brand_model.dart';
import 'package:az_store/features/shop/screens/store/widgets/brand_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brandModel});

  final BrandModel brandModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(brandModel.name, style: Theme.of(context).textTheme.headlineSmall,),
        showReturnBtn: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              BrandCard(onTap: null, padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h), brandModel: brandModel,),
              SizedBox(height: 32.h,),
              const SectionHeader(text: "Products"),
              SizedBox(height: 16.h,),
              const SortDropDown(),
              SizedBox(height: 16.h,),
              const ProductsGrid(itemCount: 12, products: [],)
            ],
          ),
        ),
      ),
    );
  }
}
