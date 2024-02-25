import 'package:az_store/features/shop/controllers/product/all_products_controller.dart';
import 'package:az_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/helpers/helper_functions.dart';


class SortDropDown extends StatelessWidget {
  const SortDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    final controller = AllProductsController.instance;

    return Obx(
        ()=> DropdownMenu(
        width: KHelperFunctions.screenWidth() - 32.w,
        dropdownMenuEntries: [
          "Name(A-Z)",
          "Name(Z-A)",
          "Lower Price",
          "Higher Price",
          "Popularity"
        ]
            .map((e) => DropdownMenuEntry(
            value: e,
            label: e,
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.titleMedium)
            )
        ))
            .toList(),
        leadingIcon: const Icon(Iconsax.sort),
        initialSelection: controller.sortingOption.value,
        textStyle: Theme.of(context).textTheme.titleMedium,
        menuStyle: MenuStyle(
            backgroundColor: MaterialStateProperty.all(isDark ? KColors.dark : KColors.light),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            )),
            shadowColor: MaterialStateProperty.all(KColors.lightGrey)
        ),
        onSelected: (value){
          controller.selectSortOption(value);
        },
      ),
    );
  }
}
