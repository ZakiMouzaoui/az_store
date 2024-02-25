import 'package:az_store/features/personalization/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class PasswordField extends StatelessWidget {
  const PasswordField({super.key, required this.passwordState, required this.labelText, this.validator, required this.controller});

  final Rx<bool> passwordState;
  final String labelText;
  final String? Function(String? val)? validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final profileController = ProfileController.instance;

    return Obx(
      () => TextFormField(
        decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: const Icon(Iconsax.lock),
            suffixIcon: GestureDetector(
                onTap: () => profileController.togglePassword(passwordState),
                child: Icon(passwordState.value
                    ? Iconsax.eye
                    : Iconsax.eye_slash))),
        obscureText: !passwordState.value ? true : false,
        validator: validator,
        controller: controller,
      ),
    );
  }
}
