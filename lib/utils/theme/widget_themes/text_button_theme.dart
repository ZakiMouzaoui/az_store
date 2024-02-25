import 'package:az_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class KTextButtonTheme{
  KTextButtonTheme._();

  static final lightTextButtonTheme =  TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: KColors.primary.withOpacity(0.8),
      )
  );

  static final darkTextButtonTheme =  TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: KColors.white.withOpacity(0.8)
      )
  );
}