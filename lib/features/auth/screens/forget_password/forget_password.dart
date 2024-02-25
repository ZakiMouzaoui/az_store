import 'package:az_store/common/widgets/k_circular_indicator.dart';
import 'package:az_store/features/auth/controllers/forgot_password/forgot_password_controller.dart';
import 'package:az_store/utils/constants/text_strings.dart';
import 'package:az_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot Password",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              KTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 64.h,
            ),
            Form(
                key: controller.key,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "E-Mail",
                        prefixIcon: Icon(Iconsax.direct),
                      ),
                      validator: KValidator.validateEmail,
                      controller: controller.emailCtr,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Obx(
                          () => ElevatedButton(
                              onPressed: controller.isLoading.value ? null : () =>
                                 controller.sendResetLink(),
                              child: controller.isLoading.value
                                  ? const KCircularIndicator()
                                  : const Text("Submit")),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
