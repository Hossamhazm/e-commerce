
import 'package:flutter/material.dart';
import 'package:mvvm_e_commerce/core/utilites/size_utils.dart';
import 'package:mvvm_e_commerce/ui/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeLightblue900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.lightBlue900,
        fontSize: 16.fSize,
      );
  static get bodyLargeLightblue900Regular =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.lightBlue900,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeLightblue900_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.lightBlue900,
      );
  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.fSize,
      );
  static get bodyLargePrimaryRegular => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumLightblue900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.lightBlue900,
      );
  static get bodyMediumOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumOnPrimaryContainer_1 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodySmallLightblue900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.lightBlue900.withOpacity(0.6),
        fontSize: 11.fSize,
      );
  static get bodySmallOnPrimaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 11.fSize,
      );
  static get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  // Headline text style
  static get headlineSmallLightblue900 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.lightBlue900,
      );
  // Title text style
  static get titleLargeMedium => theme.textTheme.titleLarge!.copyWith(
        fontSize: 22.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleLargeMedium_1 => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleLargeOnPrimaryContainer =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w500,
      );
  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumLightblue900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.lightBlue900,
      );
  static get titleMediumOnPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumSemiBold => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOnPrimaryContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
}

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
