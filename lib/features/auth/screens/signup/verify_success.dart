import 'package:az_store/common/widgets/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';


class VerifySuccess extends StatelessWidget {
  const VerifySuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
                children: [
                  Lottie.asset(KImages.emailVerifiedLottie, height: 250.h, width: double.infinity,),
                  SizedBox(height: 32.h,),
                  Text(KTexts.yourAccountCreatedTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
                  SizedBox(height: 16.h,),
                  Text(KTexts.yourAccountCreatedSubTitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium,),
                  SizedBox(height: 32.h,),
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed:()=>Get.off(()=>const NavigationMenu()), child: const Text("Continue"))),
                ],
          ),
        ),
      ),
    );
  }
}
