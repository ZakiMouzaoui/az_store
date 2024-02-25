import 'package:az_store/utils/constants/colors.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.text, this.btnText, this.onPressed, this.textColor, this.btnTextColor});

  final String text;
  final String? btnText;
  final VoidCallback? onPressed;
  final Color? textColor;
  final Color? btnTextColor;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor ?? (isDark ? KColors.white : KColors.black)), maxLines: 1, overflow: TextOverflow.ellipsis,),
        btnText != null ? TextButton(onPressed: onPressed, child: Text(btnText!, style: Theme.of(context).textTheme.labelSmall!.apply(
          color: btnTextColor ?? (isDark ? KColors.light : KColors.primary)
        ),)) : const SizedBox.shrink()
      ],
    );
  }
}
