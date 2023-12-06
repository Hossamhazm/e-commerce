
import 'package:flutter/material.dart';
import 'package:mvvm_e_commerce/core/utilites/size_utils.dart';
import 'package:mvvm_e_commerce/ui/theme/theme_helper.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillLightBlue => BoxDecoration(
        color: appTheme.lightBlue900,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );

  // Outline decorations
  static BoxDecoration get outlineLightBlue => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: appTheme.lightBlue900.withOpacity(0.3),
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineLightblue900 => BoxDecoration(
        border: Border.all(
          color: appTheme.lightBlue900.withOpacity(0.3),
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineLightblue9001 => BoxDecoration(
        color: appTheme.blue200,
        border: Border.all(
          color: appTheme.lightBlue900.withOpacity(0.3),
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineLightblue9002 => BoxDecoration(
        color: appTheme.gray3007f,
        border: Border(
          top: BorderSide(
            color: appTheme.lightBlue900.withOpacity(0.3),
            width: 1.h,
          ),
          left: BorderSide(
            color: appTheme.lightBlue900.withOpacity(0.3),
            width: 1.h,
          ),
          bottom: BorderSide(
            color: appTheme.lightBlue900.withOpacity(0.3),
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineLightblue9003 => BoxDecoration(
        color: appTheme.blueGray50,
        border: Border(
          top: BorderSide(
            color: appTheme.lightBlue900.withOpacity(0.3),
            width: 1.h,
          ),
          left: BorderSide(
            color: appTheme.lightBlue900.withOpacity(0.3),
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineLightblue9004 => BoxDecoration(
        border: Border.all(
          color: appTheme.lightBlue900.withOpacity(0.3),
          width: 2.h,
        ),
      );

  // White decorations
  static BoxDecoration get white => BoxDecoration(
        color: theme.colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: appTheme.black90026,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              5,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get circleBorder50 => BorderRadius.circular(
        50.h,
      );
  static BorderRadius get circleBorder8 => BorderRadius.circular(
        8.h,
      );

  // Custom borders
  static BorderRadius get customBorderTL10 => BorderRadius.only(
        topLeft: Radius.circular(10.h),
        bottomLeft: Radius.circular(10.h),
        bottomRight: Radius.circular(10.h),
      );
  static BorderRadius get customBorderTL101 => BorderRadius.only(
        topLeft: Radius.circular(10.h),
      );
  static BorderRadius get customBorderTL15 => BorderRadius.vertical(
        top: Radius.circular(15.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder15 => BorderRadius.circular(
        15.h,
      );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
