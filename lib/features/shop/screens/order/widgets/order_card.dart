import 'package:az_store/features/shop/models/order_model.dart';
import 'package:az_store/features/shop/screens/order/order_details.dart';
import 'package:az_store/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/section_header.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';


class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    return Material(
      color:isDark ? KColors.dark : KColors.light,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: ()=>Get.to(()=>OrderDetails(order: order)),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
              border: Border.all(color: isDark ? KColors.darkerGrey : KColors.grey)
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              /// Order status details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Iconsax.ship),
                      SizedBox(width: 8.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(order.status.name, style: Theme.of(context).textTheme.labelLarge!.apply(
                              color: KColors.primary
                          ),),
                          SectionHeader(text: KFormatter.formatDate(order.orderDate))
                        ],
                      )
                    ],
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34, size: 18,))
                ],
              ),
              SizedBox(height: 16.h,),

              /// Order shipping details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Iconsax.tag),
                        SizedBox(width: 8.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Order", style: Theme.of(context).textTheme.labelLarge!.apply(
                                color: isDark ? KColors.grey : KColors.darkerGrey
                            ),),
                            SectionHeader(text: order.trackingCode)
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                        children: [
                          const Icon(Iconsax.calendar),
                          SizedBox(width: 8.w,),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Shipping date", overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelLarge!.apply(
                                    color: isDark ? KColors.grey : KColors.darkerGrey
                                ),),
                                SectionHeader(text: KFormatter.formatDate(order.deliveryDate))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
