import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/shimmer_loader.dart';


class CategoryBanner extends StatelessWidget {
  const CategoryBanner({super.key, required this.imgUrl});

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      imageBuilder: (_,provider) => Container(
        alignment: Alignment.center,
        height: 200.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: provider,
                fit: BoxFit.fill
            )
        ),
      ),
      placeholder: (_, __) => ShimmerLoader(
        height: 200.h,
        width: double.infinity,
        radius: 20,
      ),
    );
  }
}
