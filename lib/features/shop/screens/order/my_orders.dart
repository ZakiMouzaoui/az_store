import 'package:az_store/common/widgets/custom_app_bar.dart';
import 'package:az_store/common/widgets/shimmer_loader.dart';
import 'package:az_store/features/shop/screens/order/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../personalization/screens/order/order_controller.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());

    return Scaffold(
        appBar: CustomAppBar(
          title: Text(
            "My Orders",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          showReturnBtn: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: FutureBuilder(
            future: controller.fetchUserOrders(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ListView.separated(
                    itemBuilder: (_, __) => ShimmerLoader(
                          height: 150.h,
                          width: double.infinity,
                          radius: 20,
                        ),
                    separatorBuilder: (_, __) => SizedBox(
                          height: 16.h,
                        ),
                    itemCount: 3);
              }
              if (snapshot.hasError) {
                return const Center(child: Text("Something went wrong"),);
              }
              final orders = snapshot.data!;

              if(orders.isEmpty){
                return Center(
                  child: Column(
                    children: [
                      Lottie.asset(KImages.emptyWishlist, width: 0.8.sw),
                      const Text(
                        "You haven't order anything yet...",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }

              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (_, index) => OrderCard(order: orders[index],),
                  separatorBuilder: (_, __) => SizedBox(
                        height: 16.h,
                      ),
                  itemCount: orders.length);
            },
          ),
        ));
  }
}
