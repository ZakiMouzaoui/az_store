import 'package:az_store/common/widgets/shimmer_loader.dart';
import 'package:az_store/features/shop/models/category_model.dart';
import 'package:az_store/features/shop/screens/sub_category/sub_category.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';

class VerticalIconText extends StatelessWidget {
  const VerticalIconText(
      {super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: ()=> Get.to(()=>SubCategories(parentCategory: categoryModel,)),
      child: Column(
        children: [
          CircleAvatar(
            radius: 33.h,
            backgroundColor: isDark ? KColors.dark : KColors.light,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: categoryModel.icon,
                  color: !isDark ? KColors.dark : KColors.light,
                  placeholder: (_,__) => ShimmerLoader(
                    height: 80.h,
                    width: 80.w,
                    radius: 100,
                  ),
                  errorWidget: (_,__,___)=>const Icon(
                    Icons.image_not_supported_outlined,
                    size: 48,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Flexible(
            child: Text(
              categoryModel.name,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: KColors.white),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
