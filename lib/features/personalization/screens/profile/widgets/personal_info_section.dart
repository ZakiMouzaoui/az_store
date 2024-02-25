import 'package:az_store/common/widgets/show_dialog.dart';
import 'package:az_store/features/personalization/controllers/user_controller.dart';
import 'package:az_store/features/personalization/screens/profile/widgets/personal_form.dart';
import 'package:az_store/features/personalization/screens/profile/widgets/profile_info_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/section_header.dart';


class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Obx(
        (){
          final user = controller.userModel.value;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SectionHeader(text: "Personal Information"),
                  IconButton(onPressed: (){
                    showFormDialog(context, const PersonalForm());
                  }, icon: const Icon(Iconsax.edit))
                ],
              ),
              ProfileInfoRow(title: "First Name", value: user.firstName.isNotEmpty ? user.firstName : "N\\A"),
              ProfileInfoRow(title: "Last Name", value: user.lastName.isNotEmpty ? user.lastName : "N\\A"),
              ProfileInfoRow(title: "Phone N°", value: user.phoneNumber.isNotEmpty ? user.phoneNumber : "N\\A"),
            ],
          );
        } ,
    );
  }
}
