import 'package:az_store/common/widgets/custom_app_bar.dart';
import 'package:az_store/common/widgets/k_circular_indicator.dart';
import 'package:az_store/features/personalization/controllers/profile_controller.dart';
import 'package:az_store/features/personalization/screens/profile/widgets/password_field.dart';
import 'package:az_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthenticateLogin extends StatelessWidget {
  const ReAuthenticateLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProfileController.instance;

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Delete Account",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showReturnBtn: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              const Text(
                  "Please verify your email address and enter your password to securely delete your account."),
              SizedBox(
                height: 32.h,
              ),
              Form(
                key: controller.key,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Email", prefixIcon: Icon(Iconsax.sms)),
                      controller: controller.verifyEmailCtr,
                      validator: KValidator.validateEmail,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    PasswordField(
                        passwordState: controller.showVerifyPassword,
                        labelText: "Password",
                        controller: controller.verifyPwdCtr,
                        validator: (value) => KValidator.validateEmptyField(value, "Password"),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Obx(
                        () => ElevatedButton(
                          onPressed: controller.reAuthenticateEmailAndPassword,
                          child: controller.isLoading.value ? const KCircularIndicator() : const Text("Verify"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
