import 'package:az_store/common/widgets/k_circular_indicator.dart';
import 'package:az_store/features/personalization/controllers/profile_controller.dart';
import 'package:az_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/section_header.dart';

class PersonalForm extends StatelessWidget {
  const PersonalForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProfileController.instance;

    return Form(
      key: controller.key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SectionHeader(text: "Personal Information"),
          SizedBox(
            height: 32.h,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "First Name", prefixIcon: Icon(Iconsax.user)),
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
                  validator: (value) =>
                      KValidator.validateEmptyField(value, "Last name"),
                  controller: controller.lastNameCtr,
                ),
              )
            ],
          ),

          /*
          SizedBox(height: 16.h,),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Phone Number",
                prefixIcon: Icon(Iconsax.call)
            ),
            initialValue: user.phoneNumber,
          ),
           */
          SizedBox(
            height: 16.h,
          ),
          if(controller.phoneNumberCtr.text.isEmpty) Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Phone Number",
                    prefixIcon: Icon(Iconsax.call)
                ),
                validator: (value) => KValidator.validateEmptyField(value, "Phone Number"),
                keyboardType: TextInputType.phone,
                controller: controller.phoneNumberCtr,
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
          SizedBox(
              width: double.infinity,
              child: Obx(() => ElevatedButton(
                  onPressed: controller.changePersonalInfo,
                  child: controller.isLoading.value
                      ? const KCircularIndicator()
                      : const Text('Save'))))
        ],
      ),
    );
  }
}
