import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Accent decorations
  static BoxDecoration get accentPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        boxShadow: [
          BoxShadow(
            color: appTheme.black90026.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          )
        ],
      );
  static BoxDecoration get accentSecondary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
// Background decorations
  static BoxDecoration get backgroundBackground1 => BoxDecoration(
        color: appTheme.gray5001,
      );
  static BoxDecoration get backgroundBackground2 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
// Layers decorations
  static BoxDecoration get layersPrimary => BoxDecoration(
        color: appTheme.whiteA700,
      );
// Outline decorations
  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.gray300,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder36 => BorderRadius.circular(
        36.h,
      );
}
