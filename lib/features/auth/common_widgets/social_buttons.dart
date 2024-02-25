import 'package:az_store/features/auth/controllers/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: KColors.grey)),
          child: IconButton(
              onPressed: ()=>controller.singInWithGoogle(),
              icon: Image.asset(
                KImages.google,
                width: 32.w,
              )),
        ),
        SizedBox(
          width: 16.w,
        ),
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: KColors.grey)),
          child: IconButton(
              onPressed: controller.singInWithFacebook,
              icon: Image.asset(
                KImages.facebook,
                width: 32.w,
              )),
        )
      ],
    );
  }
}
