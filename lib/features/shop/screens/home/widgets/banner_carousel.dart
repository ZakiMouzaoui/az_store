import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'banner_container.dart';

import 'package:az_store/features/shop/controllers/home/carousel_controller.dart';


class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerCarouselController());

    return Column(
      children: [
        CarouselSlider(
          items: const [
            BannerContainer(imgUrl: "https://firebasestorage.googleapis.com/v0/b/az-shop-d7450.appspot.com/o/images%2Fbanners%2Fpromo-banner-1.png?alt=media&token=f54691d5-a38b-47fd-99d1-b73e4a1f492a"),
            BannerContainer(imgUrl: "https://firebasestorage.googleapis.com/v0/b/az-shop-d7450.appspot.com/o/images%2Fbanners%2Fpromo-banner-2.png?alt=media&token=9e919aaf-73f9-4963-b1a1-bc0f144710ec"),
            BannerContainer(imgUrl: "https://firebasestorage.googleapis.com/v0/b/az-shop-d7450.appspot.com/o/images%2Fbanners%2Fpromo-banner-3.png?alt=media&token=2c07c10f-506d-44c7-acf4-ab30f62f6221"),
          ],
          options: CarouselOptions(
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 1.0,
              pauseAutoPlayOnTouch: true,
              onPageChanged: (idx, _)=>controller.changeIdx(idx)
          ),
        ),
        SizedBox(height: 16.h,),
        Obx(
          () => AnimatedSmoothIndicator(
            activeIndex: controller.currentIdx.value,
            count: 3,
            effect: WormEffect(
              dotHeight: 5.h,
              dotWidth: 25.w
            ),
          ),
        )
      ],
    );
  }
}
