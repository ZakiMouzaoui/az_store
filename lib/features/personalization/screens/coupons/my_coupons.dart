import 'package:az_store/common/widgets/custom_app_bar.dart';
import 'package:az_store/common/widgets/shimmer_loader.dart';
import 'package:az_store/features/personalization/controllers/coupon_controller.dart';
import 'package:az_store/features/personalization/screens/coupons/widgets/coupon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/constants/image_strings.dart';


class MyCoupons extends StatelessWidget {
  const MyCoupons ({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CouponController());

    return Scaffold(
      appBar: CustomAppBar(
        title: Text("My Coupons", style: Theme.of(context).textTheme.headlineSmall,),
        showReturnBtn: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: FutureBuilder(
          future: controller.fetchMyCoupons(),
          builder: (_, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return ListView.separated(
                  itemBuilder: (_,__) => ShimmerLoader(
                      height: 80.h,
                      width: double.infinity,
                      radius: 20,
                  ),
                  separatorBuilder: (_, __)=>SizedBox(height: 16.h,),
                  itemCount: 3
              );
            }
            if(snapshot.hasError){
              return const Center(
                child: Text("Something went wrong"),
              );
            }
            final coupons = snapshot.data!;
            if(coupons.isEmpty){
              return Center(
                child: Column(
                  children: [
                    Lottie.asset(KImages.emptyWishlist, width: 0.8.sw),
                    const Text(
                      "You haven't used any coupon yet...",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }
            return ListView.separated(
                itemBuilder: (_,index)=>CouponCard(coupon: coupons[index],),
                separatorBuilder: (_, __)=>SizedBox(height: 16.h,),
                itemCount: coupons.length
            );
          },
        ),
      ),
    );
  }
}
