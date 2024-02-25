import 'package:az_store/features/shop/screens/home/home.dart';
import 'package:az_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:az_store/utils/constants/colors.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../features/personalization/screens/settings/settings.dart';
import '../../features/shop/screens/store/store.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    final controller = Get.put(NavigationController());

    return ConnectivityWidgetWrapper(
      message: "You are offline",
      height: 50.h,
      disableInteraction: false,

      child: DoubleBack(
        child: Scaffold(
          bottomNavigationBar: Obx(
            () => NavigationBar(
              elevation: 0,
              selectedIndex: controller.selectedIdx.value,
              onDestinationSelected: (idx) => controller.selectedIdx.value = idx,
              backgroundColor: isDark ? KColors.dark : KColors.light,
              indicatorColor: isDark
                  ? KColors.white.withOpacity(0.1)
                  : KColors.black.withOpacity(0.1),
              destinations: const [
                NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
                NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
                NavigationDestination(
                    icon: Icon(Iconsax.heart), label: "Wishlist"),
                NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
              ],
            ),
          ),
          body: Obx(
            () => controller.screens[controller.selectedIdx.value],
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  Rx<int> selectedIdx = 0.obs;

  final screens = [
    const Home(),
    const Store(),
    const Wishlist(),
    const Settings()
  ];
}
