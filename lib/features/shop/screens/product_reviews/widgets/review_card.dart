import 'package:az_store/features/shop/models/review_model.dart';
import 'package:az_store/features/shop/screens/product_reviews/widgets/rating_indicator.dart';
import 'package:az_store/utils/formatters/formatter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/kread_more.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                review.userPicture.isEmpty ? const CircleAvatar(
                  backgroundImage: AssetImage(KImages.defaultAvatar),
                ) : CachedNetworkImage(
                    imageUrl: review.userPicture,
                    errorWidget: (_,__,___)=>const Icon(Icons.error_outline),
                    imageBuilder: (_, provider)=>CircleAvatar(
                     backgroundImage: provider,
                    ),

                )  ,
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  review.userName,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            const Icon(Icons.more_vert_rounded)
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            KRatingIndicator(
              itemSize: 15.w,
              rating: review.rating,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              KFormatter.formatDate(review.createdAt),
              style: Theme.of(context).textTheme.labelLarge,
            )
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        if (review.comment!.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                review.comment ?? "",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(
                height: 16.h,
              ),
              if (review.reply!.isNotEmpty)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isDark ? KColors.darkerGrey : KColors.grey,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "AZ-Store",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      KReadMoreText(
                          style: Theme.of(context).textTheme.labelLarge,
                          text: review.reply!)
                    ],
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
