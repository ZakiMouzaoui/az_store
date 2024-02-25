import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/constants/colors.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({super.key, required this.rating, required this.value});

  final int rating;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text("$rating")),
        Expanded(
          flex: 11,
          child: LinearProgressIndicator(
            value: value,
            valueColor: const AlwaysStoppedAnimation(KColors.primary),
            backgroundColor: KColors.grey,
            minHeight: 10.h,
            borderRadius: BorderRadius.circular(25),
          ),
        )
      ],
    );
  }
}
