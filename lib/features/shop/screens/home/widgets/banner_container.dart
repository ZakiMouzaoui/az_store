import 'package:az_store/common/widgets/shimmer_loader.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerContainer extends StatelessWidget {
  const BannerContainer({super.key, required this.imgUrl});

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: KHelperFunctions.screenWidth()-48.w,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              fit: BoxFit.cover,
              placeholder: (_,__)=>const ShimmerLoader(height: double.infinity, width: double.infinity, radius: 20,),
            )));
  }
}
