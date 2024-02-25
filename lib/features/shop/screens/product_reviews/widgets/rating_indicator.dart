import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';

class KRatingIndicator extends StatelessWidget {
  const KRatingIndicator ({super.key, required this.itemSize, this.iconColor, required this.rating});

  final double itemSize;
  final Color? iconColor;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemPadding: EdgeInsets.zero,
      itemBuilder: (_, __) => Icon(
        Iconsax.star1,
        color: iconColor ?? KColors.primary,
      ),
      rating: rating,
      itemSize: itemSize,
      unratedColor: KColors.grey,
    );
  }
}
