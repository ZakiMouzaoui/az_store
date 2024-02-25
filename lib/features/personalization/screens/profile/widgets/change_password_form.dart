import 'package:az_store/common/widgets/k_circular_indicator.dart';
import 'package:az_store/features/personalization/controllers/profile_controller.dart';
import 'package:az_store/features/personalization/screens/profile/widgets/password_field.dart';
import 'package:az_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/section_header.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProfileController.instance;

    return Form(
      key: controller.key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(text: "Change Password"),
          SizedBox(
            height: 32.h,
          ),
          PasswordField(
            passwordState: controller.showCurrentPassword,
            labelText: "Current Password",
            validator: (value) =>
                KValidator.validateEmptyField(value, "Current password"),
            controller: controller.oldPwdCtr,
          ),
          SizedBox(
            height: 16.h,
          ),
          PasswordField(
            passwordState: controller.showNewPassword,
            labelText: "New Password",
            validator: KValidator.validatePassword,
            controller: controller.newPwdCtr,
          ),
          SizedBox(
            height: 16.h,
          ),
          PasswordField(
              passwordState: controller.showConfirmationPassword,
              labelText: "Confirm Password",
              validator: (value) => KValidator.validateConfirmationPassword(
                  value, controller.newPwdCtr.text),
              controller: controller.confirmPwdCtr),
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
              width: double.infinity,
              child: Obx(
                  ()=> ElevatedButton(
                    onPressed: controller.changePassword,
                    child: controller.isLoading.value ? const KCircularIndicator() : const Text('Save')),
              ))
        ],
      ),
    );
  }
}
