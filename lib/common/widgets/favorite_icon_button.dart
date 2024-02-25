import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../features/shop/controllers/product/wishlist_controller.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';

class FavoriteIconButton  extends StatelessWidget {
  const FavoriteIconButton ({super.key, this.padding, required this.product});

  final double? padding;
  final String product;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);
    final controller = Get.put(WishlistController());

    return Material(
      color: isDark ? KColors.black.withOpacity(0.9) : KColors.white.withOpacity(0.9),
      shape: const CircleBorder(),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: ()=>controller.toggleFavorite(product),
        child: Obx(

            (){
              final isFavorite = controller.wishlist.contains(product);

              return Container(
            padding: EdgeInsets.all(padding ?? 12),
            decoration:const BoxDecoration(
                color: Colors.transparent ,
                shape: BoxShape.circle,
            ),
            child: isFavorite ? const Icon(Iconsax.heart5, color: KColors.error) : const Icon(Iconsax.heart),
            );
    },
        ),
      ),
    );
  }
}
