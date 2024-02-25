import 'package:az_store/features/shop/controllers/product_details/product_details_controller.dart';
import 'package:az_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:az_store/features/shop/screens/product_details/widgets/sku_meta_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/product_model.dart';


class ProductVariation extends StatelessWidget {
  const ProductVariation({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductDetailsController.instance;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx((){

            if(controller.selectedAttributes.isNotEmpty && controller.selectedAttributes.length == product.productAttributeModels.length){
              final sku = controller.getSelectedSku();
              return SkuMetaData(sku: sku);
            }

          return const SizedBox.shrink();
        }),
        ProductAttributes(attributes: product.productAttributeModels)
      ],
    );
  }
}
