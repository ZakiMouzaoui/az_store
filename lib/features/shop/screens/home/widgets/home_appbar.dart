import 'package:az_store/common/widgets/shimmer_loader.dart';
import 'package:az_store/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/cart_counter.dart';
import '../../../../../common/widgets/custom_app_bar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            KTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: KColors.grey),
          ),


          Obx(
            (){
              if(controller.isProfileLoading.value){
                return Padding(padding: EdgeInsets.only(top: 8.h), child: ShimmerLoader(height: 15.h, width: 150.w));
              }
              return Text(
                controller.userModel.value.displayName,
                style: Theme.of(context).textTheme.headlineSmall!.apply(
                    color: KColors.white
                ),
              );
            }
          )
        ],
      ),
      actions: const [
        CartCounter(iconColor: KColors.white)
      ],
    );
  }
}
