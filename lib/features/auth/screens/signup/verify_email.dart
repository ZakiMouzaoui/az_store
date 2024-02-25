import 'package:az_store/common/widgets/k_circular_indicator.dart';
import 'package:az_store/features/auth/controllers/signup/verify_email_controller.dart';
import 'package:az_store/features/auth/screens/signup/verify_success.dart';
import 'package:az_store/utils/constants/image_strings.dart';
import 'package:az_store/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=>controller.signOut(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset(KImages.deliveredEmailIllustration, height: 250.h, width: double.infinity,),
                  SizedBox(height: 32.h,),
                  Text(KTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
                  SizedBox(height: 16.h,),
                  Text(email ?? "", style: Theme.of(context).textTheme.labelLarge,),
                  SizedBox(height: 16.h,),
                  Text(KTexts.confirmEmailSubTitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium,),
                  SizedBox(height: 32.h,),
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){
                    Get.to(()=>const VerifySuccess());
                  }, child: const Text("Continue"))),
                  SizedBox(height: 8.h,),
                  Obx(() => TextButton(onPressed: controller.isLoading.value ? null : ()=>controller.resendEmail(), child: controller.isLoading.value ? const KCircularIndicator() : const Text("Resend Email")))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
