import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';


class ProductRatingShare extends StatelessWidget {
  const ProductRatingShare({super.key, this.rating, required this.totalReviews});

  final double? rating;
  final int totalReviews;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            children: [
              const Icon(Iconsax.star5, color: KColors.secondary,),
              if(rating != null) Row(
                children: [
                  SizedBox(width: 8.w,),
                  Text(rating!.toStringAsFixed(1), style: Theme.of(context).textTheme.bodyLarge,),
                  Text("($totalReviews)")
                ],
              ) else const Flexible(child: Text(" No reviews for this product", maxLines: 1, overflow: TextOverflow.ellipsis,))
            ],
          ),
        ),
        IconButton(onPressed: (){}, icon: const Icon(Icons.share))
      ],
    );
  }
}
