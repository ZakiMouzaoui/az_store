import 'package:az_store/utils/constants/colors.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SettingMenuTile extends StatelessWidget {
  const SettingMenuTile({super.key, required this.title, required this.subtitle, required this.leadingIcon, this.onTap, this.trailing});

  final String title;
  final String subtitle;
  final IconData leadingIcon;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    return Material(
      color: isDark ? KColors.dark : KColors.light,
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 16.w),
        onTap: onTap,
        title: Text(title, style: Theme.of(context).textTheme.titleMedium,),
        subtitle: Text(subtitle,style: Theme.of(context).textTheme.labelMedium,),
        leading: Icon(leadingIcon, color: KColors.primary,),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        trailing: trailing,
      ),
    );
  }
}
