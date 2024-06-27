import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get architectsDaughter {
    return copyWith(
      fontFamily: 'Architects Daughter',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Architects text style
  static get architectsDaughterGray800 => TextStyle(
        color: appTheme.gray800,
        fontSize: 73.fSize,
        fontWeight: FontWeight.w400,
      ).architectsDaughter;
  static get architectsDaughterWhiteA700 => TextStyle(
        color: appTheme.whiteA700,
        fontSize: 73.fSize,
        fontWeight: FontWeight.w400,
      ).architectsDaughter;
  static get architectsDaughterWhiteA700Regular => TextStyle(
        color: appTheme.whiteA700,
        fontSize: 73.fSize,
        fontWeight: FontWeight.w400,
      ).architectsDaughter;
// Body text style
  static get bodyLarge18 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 18.fSize,
      );
  static get bodyLargeGray50 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray50,
        fontSize: 18.fSize,
      );
  static get bodyLargeLightgreen400 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.lightGreen400,
      );
  static get bodyLargeOnPrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyLargeRed600 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.red600,
      );
  static get bodyLargeRoboto => theme.textTheme.bodyLarge!.roboto;
  static get bodySmallGray50 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray50,
      );
  static get bodySmallSecondaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.secondaryContainer,
      );
// Headline text style
  static get headlineSmallPrimaryContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
// Title text style
  static get titleLargePrimaryContainer => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get titleLargePrimaryContainer_1 =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get titleLargeRobotoPrimaryContainer =>
      theme.textTheme.titleLarge!.roboto.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w700,
      );
}
