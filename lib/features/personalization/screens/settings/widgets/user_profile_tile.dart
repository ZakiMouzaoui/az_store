import 'package:az_store/features/personalization/controllers/user_controller.dart';
import 'package:az_store/features/personalization/screens/profile/profile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/shimmer_loader.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Obx(
      () {
        if(controller.isProfileLoading.value){
          return CircleAvatar(
            backgroundColor: KColors.light,
            radius: 30,
            child: ShimmerLoader(
              height: 80.h, width: 80.w, radius: 100,
            ),
          );
        }
        final imgUrl = controller.userModel.value.profilePicture;

        return ListTile(
          contentPadding: EdgeInsets.only(left: 16.w, right: 8.w),
          leading: imgUrl.isNotEmpty ? CircleAvatar(
            radius: 30,
            backgroundColor: KColors.light,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (_, provider)=>ShimmerLoader(height: 80.h, width: 80.w, radius: 100,),
                errorWidget: (_,__,___)=>const Icon(Icons.error_outline),
              ),
            ),
          ) : const CircleAvatar(
            backgroundImage: AssetImage(KImages.defaultAvatar),
            backgroundColor: KColors.light,
            radius: 30,
          ),
          title: Text(
            controller.userModel.value.displayName,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: KColors.white),
          ),
          subtitle: Text(
            controller.userModel.value.email,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: KColors.white),
          ),
          trailing: IconButton(
              onPressed: () => Get.to(() => const Profile()),
              icon: const Icon(
                Iconsax.edit,
                color: KColors.light,
              )),
        );
      }
    );
  }
}
