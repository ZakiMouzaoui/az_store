import 'package:az_store/features/shop/screens/product_reviews/widgets/rating_bar.dart';
import 'package:az_store/features/shop/screens/product_reviews/widgets/rating_indicator.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/review_model.dart';

class OverallProductRating extends StatelessWidget {
  const OverallProductRating({super.key, required this.avgRating, required this.reviews});

  final double avgRating;
  final List<ReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              avgRating.toStringAsFixed(1),
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(5, (index) => RatingBar(rating: 5-index, value: KHelperFunctions.calculateAverageRating(5-index, reviews)))),
            )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            KRatingIndicator(itemSize: 20.w, rating: avgRating,),
            SizedBox(width: 4.w,),
          ],
        ),
      ],
    );
  }
}
