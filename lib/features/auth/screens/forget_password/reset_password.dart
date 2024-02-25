import 'package:az_store/features/auth/screens/forget_password/forget_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../login/login.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()=>Get.offAll(()=>const Login()), icon: const Icon(CupertinoIcons.clear))
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(KImages.deliveredEmailIllustration, height: 250.h, width: double.infinity,),
              SizedBox(height: 32.h,),
              Text(KTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              SizedBox(height: 16.h,),
              Text(email ?? "", style: Theme.of(context).textTheme.labelLarge,),
              SizedBox(height: 16.h,),
              Text(KTexts.changeYourPasswordSubTitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium,),
              SizedBox(height: 32.h,),
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=>Get.offAll(()=>const Login()), child: const Text("Done"))),
              SizedBox(height: 16.h,),
              TextButton(onPressed: ()=>Get.off(()=>const ForgetPassword()), child: const Text("Resend Email"))
            ],
          ),
        ),
      ),
    );
  }
}
