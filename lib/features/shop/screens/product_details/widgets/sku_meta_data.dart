import 'package:az_store/features/shop/models/product_model.dart';
import 'package:az_store/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/section_header.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';


class SkuMetaData extends StatelessWidget {
  const SkuMetaData({super.key, required this.sku});

  final SKU? sku;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: isDark ? KColors.darkerGrey : KColors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: sku != null ? sku!.stock == 0 ?  const Text("Item out of stock") :  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SectionHeader(text: "Variation"),
              SizedBox(width: 16.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Price: ", style: Theme.of(context).textTheme.labelMedium,),
                      Text("\$${KFormatter.formatPrice(sku!.price)}", style: Theme.of(context).textTheme.bodyLarge,)
                    ],
                  ),
                  Row(
                    children: [
                      Text("Status: ", style: Theme.of(context).textTheme.labelMedium,),
                      Text(sku!.stock != 0 ? "In Stock(${sku!.stock} left)" : "Out of Stock", style: Theme.of(context).textTheme.bodyLarge,)
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 16.h,),
          Text(sku!.description, maxLines: 4, overflow: TextOverflow.fade),
        ],
      ) :  const Text("Item out of stock") ,
    );
  }
}
