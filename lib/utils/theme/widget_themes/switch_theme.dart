import 'package:az_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class KSwitchTheme{
  KSwitchTheme._();

  static final lightSwitchTheme =  SwitchThemeData(
      overlayColor: MaterialStateProperty.all(KColors.primary)
  );

  static final darkSwitchTheme =  SwitchThemeData(
      overlayColor: MaterialStateProperty.all(KColors.primary),
      thumbColor: MaterialStateProperty.all(KColors.primary),
      trackColor: MaterialStateProperty.all(KColors.primary),

  );
}