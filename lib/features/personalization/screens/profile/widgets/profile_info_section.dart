import 'package:az_store/features/personalization/controllers/user_controller.dart';
import 'package:az_store/features/personalization/screens/profile/widgets/change_password_form.dart';
import 'package:az_store/features/personalization/screens/profile/widgets/profile_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/section_header.dart';
import '../../../../../common/widgets/show_dialog.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Obx(() {
      final user = controller.userModel.value;

      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SectionHeader(text: "Profile Information"),
              IconButton(
                  onPressed: () {
                    showFormDialog(context, const ChangePasswordForm());
                  },
                  icon: const Icon(Iconsax.edit))
            ],
          ),
          ProfileInfoRow(
            title: "User Id",
            value: user.id,
            icon: Iconsax.copy,
            onTap: () async {
              await Clipboard.setData(ClipboardData(text: user.id));
              Fluttertoast.showToast(msg: 'Id copied to clipboard');
            },
          ),
          ProfileInfoRow(title: "Email", value: user.email),
          const ProfileInfoRow(title: "Password", value: "*******"),
        ],
      );
    });
  }
}
