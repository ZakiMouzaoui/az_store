import 'package:az_store/common/widgets/k_circular_indicator.dart';
import 'package:az_store/features/auth/controllers/signup/signup_controller.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:az_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);
    final controller = Get.put(SignUpController());

    return Form(
        key: controller.key,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: "First Name",
                        prefixIcon: Icon(Iconsax.user)),
                    cursorColor: KColors.primary,
                    validator: (value) =>
                        KValidator.validateEmptyField(value, "First name"),
                    controller: controller.firstNameCtr,
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Last Name", prefixIcon: Icon(Iconsax.user)),
                    cursorColor: KColors.primary,
                    validator: (value) =>
                        KValidator.validateEmptyField(value, "Last name"),
                    controller: controller.lastNameCtr,
                  ),
                ),
              ],
            ),
            /*
        SizedBox(
          height: 16.h,
        ),
        TextFormField(
          decoration: const InputDecoration(
              labelText: "Username", prefixIcon: Icon(Iconsax.user_edit)),
          cursorColor: KColors.primary,
        ),
         */
            SizedBox(
              height: 16.h,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: "Email", prefixIcon: Icon(Iconsax.sms)),
              cursorColor: KColors.primary,
              validator: KValidator.validateEmail,
              controller: controller.emailCtr,
            ),
            SizedBox(
              height: 16.h,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Phone Number",
                prefixIcon: Icon(Iconsax.call),
              ),
              cursorColor: KColors.primary,
              validator: KValidator.validatePhoneNumber,
              controller: controller.phoneCtr,
              keyboardType: TextInputType.number,
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
                cursorColor: KColors.primary,
                validator: KValidator.validatePassword,
                controller: controller.passwordCtr,
                obscureText: !controller.showPassword.value,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: Obx(() => Checkbox(
                        side: controller.isFormSubmitted.value ? BorderSide(color: !controller.isChecked.value ? KColors.error : KColors.grey) : null,
                        value: controller.isChecked.value,
                        onChanged: (_) => controller.toggleCheckbox()))),
                SizedBox(
                  width: 8.w,
                ),
                SizedBox(
                  width: KHelperFunctions.screenWidth() * 0.8,
                  child: Text.rich(TextSpan(
                      text: "${KTexts.iAgreeTo} ",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(overflow: TextOverflow.ellipsis),
                      children: [
                        TextSpan(
                            text: KTexts.privacyPolicy,
                            style: Theme.of(context).textTheme.bodySmall!.apply(
                                color: isDark ? KColors.white : KColors.primary,
                                decoration: TextDecoration.underline)),
                        TextSpan(
                            text: " and ",
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                          text: KTexts.termsOfUse,
                          style: Theme.of(context).textTheme.bodySmall!.apply(
                              color: isDark ? KColors.white : KColors.primary,
                              overflow: TextOverflow.ellipsis,
                              decoration: TextDecoration.underline),
                        )
                      ])),
                ),
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            SizedBox(
                width: double.infinity,
                child: Obx(
                  () => ElevatedButton(
                      onPressed: () {
                        controller.signup();
                        },
                      child: controller.isLoading.value ? const KCircularIndicator() : const Text("Create Account")),
                )),
            SizedBox(
              height: 16.h,
            ),
          ],
        ));
  }
}
