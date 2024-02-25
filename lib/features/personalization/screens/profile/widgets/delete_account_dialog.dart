import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';


class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key, required this.onConfirm});

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    return AlertDialog(
      backgroundColor: isDark ? KColors.dark : KColors.light,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text("Confirm Account Deletion"),
      content: const Text("Are you sure you want to delete your account? This action is irreversible."),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
              padding: EdgeInsets.symmetric(horizontal: 16.w)
          ),
          onPressed: onConfirm,
          child: const Text("Confirm"),
        ),
      ],
    );
  }
}
