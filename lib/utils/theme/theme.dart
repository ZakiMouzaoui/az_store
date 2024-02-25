import 'package:az_store/utils/theme/widget_themes/switch_theme.dart';
import 'package:az_store/utils/theme/widget_themes/text_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:az_store/utils/theme/widget_themes/appbar_theme.dart';
import 'package:az_store/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:az_store/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:az_store/utils/theme/widget_themes/chip_theme.dart';
import 'package:az_store/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:az_store/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:az_store/utils/theme/widget_themes/text_field_theme.dart';
import 'package:az_store/utils/theme/widget_themes/text_theme.dart';

import '../constants/colors.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    disabledColor: KColors.grey,
    brightness: Brightness.light,
    primaryColor: KColors.primary,
    textTheme: KTextTheme.lightTextTheme,
    chipTheme: KChipTheme.lightChipTheme,
    scaffoldBackgroundColor: KColors.white,
    appBarTheme: KAppBarTheme.lightAppBarTheme,
    checkboxTheme: KCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: KBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: KElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: KOutlinedButtonTheme.lightOutlinedButtonTheme,
    textButtonTheme: KTextButtonTheme.lightTextButtonTheme,
    //switchTheme: KSwitchTheme.lightSwitchTheme,
    inputDecorationTheme: KTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    disabledColor: KColors.grey,
    brightness: Brightness.dark,
    primaryColor: KColors.primary,
    textTheme: KTextTheme.darkTextTheme,
    chipTheme: KChipTheme.darkChipTheme,
    scaffoldBackgroundColor: KColors.black,
    appBarTheme: KAppBarTheme.darkAppBarTheme,
    checkboxTheme: KCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: KBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: KElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: KOutlinedButtonTheme.darkOutlinedButtonTheme,
    textButtonTheme: KTextButtonTheme.darkTextButtonTheme,
    //switchTheme: KSwitchTheme.darkSwitchTheme,
    inputDecorationTheme: KTextFormFieldTheme.darkInputDecorationTheme,
  );
}
