import 'package:az_store/common/widgets/cart_items_list.dart';
import 'package:az_store/common/widgets/custom_app_bar.dart';
import 'package:az_store/common/widgets/section_header.dart';
import 'package:az_store/features/shop/models/order_model.dart';
import 'package:az_store/utils/constants/colors.dart';
import 'package:az_store/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../personalization/models/address_model.dart';


class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final shippingAddress = AddressModel.fromJson(order.shippingAddress);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text("Order Details", style: Theme.of(context).textTheme.headlineSmall,),
          showReturnBtn: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  const Text("Status: "),
                  Text(order.status.name.capitalize!, style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: KColors.primary
                  ),)
                ],
              ),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  const Text("Tracking Code: "),
                  Text(order.trackingCode, style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: KColors.primary
                  ),)
                ],
              ),
              Divider(height: 32.h,),
              const SectionHeader(text: "Items"),
              SizedBox(height: 8.h,),
              CartItemsList(cartItems: order.items, editQty: false,),
              Divider(height: 32.h,),
              const SectionHeader(text: "Shipping Address"),
              SizedBox(height: 8.h,),
              Row(
                children: [
                  const Icon(Iconsax.call, size: 18,),
                  SizedBox(width: 8.w,),
                  Text(shippingAddress.phoneNumber)
                ],
              ),
              SizedBox(height: 8.h,),
              Row(
                children: [
                  const Icon(Iconsax.location, size: 18,),
                  SizedBox(width: 8.w,),
                  Flexible(child: Text(shippingAddress.toString(),))
                ],
              ),
              Divider(height: 32.h,),
              const SectionHeader(text: "Billing Summary"),
              SizedBox(height: 8.h,),
              Row(
                children: [
                  const Text("Total Amount: "),
                  Text("\$${KFormatter.formatPrice(order.totalAmount)}", style: Theme.of(context).textTheme.titleMedium,),
                ],
              ),

              if(order.couponCode != null) Column(
                children: [
                  SizedBox(height: 4.h,),
                  Row(
                    children: [
                      const Text("Coupon Used: "),
                      Text(order.couponCode!),
                    ],
                  ),
                  SizedBox(height: 4.h,),
                  Row(
                    children: [
                      const Text("Coupon Discount: "),
                      Text("\$${KFormatter.formatPrice(order.discountAmount!)}", style: Theme.of(context).textTheme.titleMedium,),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: ElevatedButton(
            onPressed: (){},
            child: const Text("Track my order"),
          ),
        ),
      ),
    );
  }
}
