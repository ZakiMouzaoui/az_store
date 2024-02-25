import 'package:az_store/utils/constants/colors.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class KChoiceChip extends StatelessWidget {
  const KChoiceChip({super.key, required this.isSelected, required this.text, this.onSelected});

  final bool isSelected;
  final String? text;
  final Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final color_ = KHelperFunctions.getColor(text);
    return ChoiceChip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        label: Text(color_ != null ? "" : text!),
        labelStyle: TextStyle(color: isSelected ? KColors.white : null),
        backgroundColor: color_,
        elevation: 0,
        selected: isSelected,
        avatar: color_ != null ? CircleAvatar(backgroundColor: color_) : null,
        onSelected: onSelected,
        padding: color_ != null ? EdgeInsets.zero : null,
        labelPadding: color_ != null ? EdgeInsets.zero : null,
        shape: color_ != null ? const CircleBorder() : null,
        selectedColor: color_ ?? KColors.primary,
        shadowColor: Colors.transparent,
        checkmarkColor: color_ != null ? text == "#FFFFFF" ? KColors.black : KColors.white : null,
    );
  }
}
