import 'package:az_store/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({super.key, required this.tabs});

  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    return Material(
        color: isDark ? KColors.black : KColors.white,
        child: TabBar(isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: KColors.primary,
            unselectedLabelColor: KColors.darkGrey,
            labelColor: isDark ? KColors.white : KColors.primary,
            tabs: tabs,
            padding: EdgeInsets.zero,
          tabAlignment: TabAlignment.start,
        ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(KDeviceUtils.getAppBarHeight());
}
