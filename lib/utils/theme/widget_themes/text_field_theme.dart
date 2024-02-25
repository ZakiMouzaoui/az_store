import 'package:flutter/material.dart';
import 'package:az_store/utils/constants/colors.dart';
import '../../constants/sizes.dart';

class KTextFormFieldTheme {
  KTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: KColors.darkGrey,
    suffixIconColor: KColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: KSizes.fontSizeSm, color: KColors.black),
    hintStyle: const TextStyle().copyWith(fontSize: KSizes.fontSizeSm, color: KColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: KColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KColors.grey),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: KColors.error),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: KColors.darkGrey,
    suffixIconColor: KColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: KSizes.fontSizeSm, color: KColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: KSizes.fontSizeSm, color: KColors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: KColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: KColors.error),
    ),
  );
}
