import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showFormDialog(BuildContext context, Widget content) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Padding(
          padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 16.h),
          child: content));
}
