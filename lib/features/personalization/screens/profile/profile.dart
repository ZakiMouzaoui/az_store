import 'package:az_store/common/widgets/custom_app_bar.dart';
import 'package:az_store/features/personalization/controllers/profile_controller.dart';
import 'package:az_store/features/personalization/screens/profile/widgets/personal_info_section.dart';
import 'package:az_store/features/personalization/screens/profile/widgets/profile_info_section.dart';
import 'package:az_store/features/personalization/screens/profile/widgets/profile_picture_section.dart';
import 'package:az_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      appBar: CustomAppBar(
        showReturnBtn: true,
        title: Text("Profile", style: Theme.of(context).textTheme.headlineSmall,),
        actions: [
          IconButton(onPressed: controller.logout, icon: const Icon(Iconsax.logout), tooltip: 'Logout',)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ProfilePictureSection(),
                  const Divider(),
                  SizedBox(height: 8.h,),
                  const ProfileInfoSection(),
                  SizedBox(height: 8.h,),
                  const Divider(),
                  SizedBox(height: 8.h,),
                  const PersonalInfoSection(),
                  SizedBox(height: 8.h,),
                  const Divider(),
                  TextButton(onPressed: controller.showDeleteAccountDialog, child: Text("Delete Account", style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: KColors.error
                  ),))
                ],
          ),
        ),
      ),
    );
  }
}
