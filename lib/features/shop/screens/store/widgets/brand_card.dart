import 'package:az_store/features/shop/models/brand_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class BrandCard extends StatelessWidget {
  const BrandCard(
      {super.key,
      this.showBorder = true,
      this.onTap,
      this.padding,
      required this.brandModel});

  final bool? showBorder;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final BrandModel brandModel;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border:
                showBorder == true ? Border.all(color: KColors.grey) : null),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (brandModel.icon != null)
              CachedNetworkImage(
                  imageUrl: brandModel.icon!,
                  width: 56.w,
                  color: isDark ? KColors.light : KColors.dark
              )
            else
              const Icon(Icons.error_outline, size: 56,),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                          child: Text(
                        brandModel.name,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge,
                      )),
                      SizedBox(
                        width: 4.w,
                      ),
                      const Icon(
                        Iconsax.verify5,
                        color: KColors.primary,
                        size: 14,
                      )
                    ],
                  ),
                  SizedBox(
                      child: Text(
                    "26 products",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
