import 'package:az_store/features/shop/controllers/product_details/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/section_header.dart';
import '../../../models/product_model.dart';
import 'kchoice_chip.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.attributes});

  final List<ProductAttributeModel> attributes;

  @override
  Widget build(BuildContext context) {
    final controller = ProductDetailsController.instance;

    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (_, index) {
          final attribute = attributes[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(text: attribute.name),
              SizedBox(
                height: 8.h,
              ),
              Obx(
                () => Wrap(
                  spacing: 12.w,
                  runSpacing: 12.h,
                  children: attribute.values
                      .map((e) => KChoiceChip(
                            isSelected:
                                controller.selectedAttributes[attribute.name] ==
                                    e,
                            text: e,
                            onSelected: (_) {
                                    controller.selectAttribute(
                                        attribute.name, e);
                                  },
                          ))
                      .toList(),
                ),
              )
            ],
          );
        },
        separatorBuilder: (_, __) => SizedBox(
              height: 16.h,
            ),
        itemCount: attributes.length);
  }
}
