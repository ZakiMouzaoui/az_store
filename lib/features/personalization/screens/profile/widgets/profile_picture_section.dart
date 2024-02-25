import 'package:az_store/common/widgets/shimmer_loader.dart';
import 'package:az_store/features/personalization/controllers/profile_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../controllers/user_controller.dart';


class ProfilePictureSection extends StatelessWidget {
  const ProfilePictureSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final profileController = ProfileController.instance;

    return Column(
      children: [
        Obx((){
          if(profileController.isProfileImgLoading.value){
            return ShimmerLoader(height: 80.h, width: 80.w, radius: 100,);
          }
          final imgUrl = controller.userModel.value.profilePicture;
          if(imgUrl.isNotEmpty){
            return CircleAvatar(radius: 40,child: ClipOval(

              child: CachedNetworkImage(
                imageUrl: imgUrl,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (_, provider)=>ShimmerLoader(height: 80.h, width: 80.w, radius: 100,),
                errorWidget: (_,__,___)=>const Icon(Icons.error_outline),
              ),
            ),);
          }
          else{
            return const CircleAvatar(backgroundImage: AssetImage(KImages.defaultAvatar), radius: 40,);
          }
        }),
        SizedBox(height: 16.h,),
        TextButton(onPressed: profileController.changeProfilePicture, child: const Text("Change Profile Picture")),
      ],
    );
  }
}
