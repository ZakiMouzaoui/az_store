import 'package:az_store/common/widgets/custom_app_bar.dart';
import 'package:az_store/features/personalization/controllers/settings_controller.dart';
import 'package:az_store/features/personalization/screens/address/user_addresses.dart';
import 'package:az_store/features/personalization/screens/coupons/my_coupons.dart';
import 'package:az_store/features/personalization/screens/settings/widgets/setting_menu_tile.dart';
import 'package:az_store/features/personalization/screens/settings/widgets/user_profile_tile.dart';
import 'package:az_store/features/shop/screens/order/my_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/section_header.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../shop/screens/cart/cart.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    final settingsController = SettingsController.instance;

    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              color: KColors.primary,
            ),
            Positioned(
              top: -100.h,
              right: -250.w,
              child: Container(
                height: 400.h,
                width: 400.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: KColors.white.withOpacity(0.1)),
              ),
            ),
            Positioned(
              top: 150.h,
              right: -250.w,
              child: Container(
                height: 400.h,
                width: 400.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: KColors.white.withOpacity(0.1)),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  /// Appbar
                  CustomAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: KColors.white),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),

                  /// User profile tile
                  const UserProfileTile(),
                  SizedBox(
                    height: 24.h,
                  ),

                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                        color: isDark ? KColors.dark : KColors.light),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Account settings
                        SectionHeader(
                          text: "Account Settings",
                          textColor: isDark ? KColors.white : KColors.black,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        SettingMenuTile(
                          title: "My Addresses",
                          subtitle: "Set shopping delivery address",
                          leadingIcon: Iconsax.safe_home,
                          onTap: () => Get.to(() => const UserAddresses()),
                        ),
                        SettingMenuTile(
                          title: "My Cart",
                          subtitle:
                              "Add, remove products and move to checkouts",
                          leadingIcon: Iconsax.shopping_cart,
                          onTap: () => Get.to(() => const Cart()),
                        ),
                        SettingMenuTile(
                          title: "My Orders",
                          subtitle: "In-progress and completed orders",
                          leadingIcon: Iconsax.bag_tick,
                          onTap: () => Get.to(() => const MyOrders()),
                        ),
                        SettingMenuTile(
                          title: "My Coupons",
                          subtitle: "List of all the discounted coupons",
                          leadingIcon: Iconsax.discount_shape,
                          onTap: () => Get.to(() => const MyCoupons()),
                        ),
                        SettingMenuTile(
                          title: "Notifications",
                          subtitle: "Set any kind of notification message",
                          leadingIcon: Iconsax.notification,
                          onTap: () {},
                        ),
                        SettingMenuTile(
                          title: "Account Privacy",
                          subtitle: "Manage data usage and connected accounts",
                          leadingIcon: Iconsax.security_card,
                          onTap: () {},
                        ),

                        /// App settings
                        SizedBox(
                          height: 16.h,
                        ),
                        SectionHeader(
                          text: "App Settings",
                          textColor: isDark ? KColors.white : KColors.black,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Obx(
                          () {
                            final isDark = settingsController.themeMode.value ==
                                ThemeMode.dark;
                            return SettingMenuTile(
                              title: "Dark Theme",
                              subtitle: "Set the application theme mode",
                              leadingIcon: isDark
                                  ? Icons.nightlight_round_rounded
                                  : Icons.light_mode_rounded,
                              trailing: Switch(
                                value: isDark,
                                onChanged: (_) {
                                  settingsController.toggleAppTheme();
                                },
                              ),
                              onTap: null,
                            );
                          },
                        ),
                        SettingMenuTile(
                          title: "Geolocation",
                          subtitle: "Set recommendation based on location",
                          leadingIcon: Iconsax.location,
                          trailing: Switch(value: false, onChanged: (val) {}),
                          onTap: () {},
                        ),
                        SettingMenuTile(
                          title: "HD Image Quality",
                          subtitle: "Set image quality to be seen",
                          leadingIcon: Iconsax.image,
                          trailing: Switch(value: false, onChanged: (val) {}),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}