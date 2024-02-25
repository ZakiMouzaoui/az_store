import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfoRow extends StatelessWidget {
  const ProfileInfoRow({super.key, required this.title, required this.value, this.icon, this.padding, this.onTap});

  final String title, value;
  final IconData? icon;
  final double? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
            children: [
              Expanded(flex: 3, child: Text(title, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis,)),
              Expanded(flex: 5, child: Text(value, style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis, )),
              Expanded(child: icon != null ? Icon(icon, size: 18,) : const SizedBox.shrink())
            ],
        ),
      ),
    );
  }
}
