import 'package:az_store/common/widgets/custom_app_bar.dart';
import 'package:az_store/features/shop/controllers/review/review_controller.dart';
import 'package:az_store/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:az_store/features/shop/screens/product_reviews/widgets/review_card.dart';
import 'package:az_store/features/shop/screens/product_reviews/widgets/reviews_shimmer.dart';
import 'package:az_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key, required this.productId, required this.avgRating});

  final String productId;
  final double avgRating;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewController());

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Reviews and Ratings"),
        showReturnBtn: true,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: ListView(
            shrinkWrap: true,
            children: [
              const Text(KTexts.reviewsTitle),
              SizedBox(
                height: 32.h,
              ),
              FutureBuilder(
                  future: controller.fetchProductReviews(productId),
                  builder: (_, snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const ReviewsShimmer();
                    }
                    if(snapshot.hasError){
                      print(snapshot.error);
                      return const Center(child: Text("Something went wrong"),);
                    }
                    final reviews = snapshot.data!;
                    return Column(
                      children: [
                        OverallProductRating(avgRating: avgRating, reviews: reviews,),
                        SizedBox(
                          height: 32.h,
                        ),

                        /// Reviews cards
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) => ReviewCard(review: reviews[index],),
                            separatorBuilder: (_, __) => SizedBox(height: 16.h,),
                            itemCount: reviews.length,
                        )
                      ],
                    );
                  }
              ),
            ],
          ),
        ),
    );
  }
}
