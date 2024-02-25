import 'package:az_store/common/widgets/k_circular_indicator.dart';
import 'package:az_store/features/auth/controllers/login/login_controller.dart';
import 'package:az_store/features/auth/screens/forget_password/forget_password.dart';
import 'package:az_store/features/auth/screens/signup/signup.dart';
import 'package:az_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.key,
        child: Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
              labelText: "E-Mail", prefixIcon: Icon(Iconsax.sms)),
          cursorColor: KColors.primary,
          validator: KValidator.validateEmail,
          controller: controller.emailCtr,
        ),
        SizedBox(
          height: 16.h,
        ),
        Obx(
          () => TextFormField(
            decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: const Icon(Iconsax.lock),
                suffixIcon: GestureDetector(onTap: controller.togglePassword, child: Icon(controller.showPassword.value ? Iconsax.eye : Iconsax.eye_slash))),
                validator: (value) => KValidator.validateEmptyField(value, "Password"),
            controller: controller.passwordCtr,
            cursorColor: KColors.primary,
            obscureText: !controller.showPassword.value ? true : false,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: Obx(()=> Checkbox(value: controller.rememberMe.value, onChanged: (val)=>controller.toggleRememberMe()))),
                SizedBox(
                  width: 8.w,
                ),
                const Text(KTexts.rememberMe)
              ],
            ),
            TextButton(
                onPressed: () => Get.to(() => const ForgetPassword()),
                child: const Text(KTexts.forgetPassword))
          ],
        ),
        SizedBox(
          height: 32.h,
        ),
        SizedBox(
            width: double.infinity,
            child: Obx(
              () => ElevatedButton(
                  onPressed: controller.signInWithEmailAndPassword,
                  child: controller.isLoading.value ? const KCircularIndicator() :  const Text("Sign In")),
            )),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUp()),
                child: const Text("Create Account"))),
      ],
    ));
  }
}
