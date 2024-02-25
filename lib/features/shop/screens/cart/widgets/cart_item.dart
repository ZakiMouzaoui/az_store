import 'package:az_store/features/shop/models/cart_item_model.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/formatters/formatter.dart';
import '../../../../personalization/screens/cart/cart_controller.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem, required this.editQty});

  final CartItemModel cartItem;
  final bool editQty;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    final cartController = CartController.instance;

    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Row(
            children: [
              // Thumbnail
              Expanded(child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: isDark
                          ? KColors.darkerGrey
                          : KColors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: CachedNetworkImage(
                      imageUrl: cartItem.image,
                      width: 60.w,
                      height: 60.h,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),

                  // Item meta data
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                cartItem.brandName,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              const Icon(
                                Iconsax.verify5,
                                color: KColors.primary,
                                size: 14,
                              )
                            ],
                          ),
                          Text(cartItem.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyLarge),
                          cartItem.variation != null
                              ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 8.w,
                                children: cartItem.variation!.entries
                                    .map((e) => Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "${e.key}: ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall,
                                    ),
                                    e.key == "Color"
                                        ? Container(
                                      width: 22.w,
                                      height: 22.h,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: KHelperFunctions
                                              .getColor(e.value),
                                          border: Border.all(
                                              color: KColors.grey)),
                                    )
                                        : Text(e.value,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium)
                                  ],
                                ))
                                    .toList(),
                              ),
                              SizedBox(
                                height: 16.h,
                              )
                            ],
                          )
                              : const SizedBox.shrink()
                        ],
                      )),
                ],
              )),
              SizedBox(
                width: 8.w,
              ),
              if (!editQty) Text("x ${cartItem.quantity}")
            ],
          ),
          if (editQty)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 84.w,
                    ),
                    SizedBox(
                      child: SizedBox(
                        height: 30.h,
                        width: 30.w,
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () => cartController
                              .addOrRemoveOneItem(cartItem, add: false),
                          icon: const Icon(Iconsax.minus),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                isDark ? KColors.darkerGrey : KColors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      '${cartItem.quantity}',
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () =>
                            cartController.addOrRemoveOneItem(cartItem),
                        icon: const Icon(Iconsax.add),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              isDark ? KColors.darkerGrey : KColors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "\$${KFormatter.formatPrice(cartItem.price)}",
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
        ],
      ),
    );
  }
}
