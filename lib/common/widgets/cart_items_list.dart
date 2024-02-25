import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/shop/models/cart_item_model.dart';
import '../../features/shop/screens/cart/widgets/cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList(
      {super.key, this.editQty = true, required this.cartItems});

  final bool editQty;
  final List<CartItemModel> cartItems;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: editQty ? const ClampingScrollPhysics() :  const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          final item = cartItems[index];

          return Column(
            children: [
              CartItem(cartItem: item, editQty: editQty,),
            ],
          );
        },
        separatorBuilder: (_, __) => SizedBox(
              height: 24.h,
            ),
        itemCount: cartItems.length);
  }
}
