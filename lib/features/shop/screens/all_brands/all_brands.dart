import 'package:az_store/common/widgets/custom_app_bar.dart';
import 'package:az_store/features/shop/screens/store/widgets/brands_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/brand_model.dart';


class AllBrands extends StatelessWidget {
  const AllBrands({super.key, required this.allBrands});

  final List<BrandModel> allBrands;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("All Brands", style: Theme.of(context).textTheme.headlineSmall,),
        showReturnBtn: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              BrandsGrid(itemCount: allBrands.length, brands: allBrands,),
            ],
          ),
        ),
      ),
    );
  }
}
