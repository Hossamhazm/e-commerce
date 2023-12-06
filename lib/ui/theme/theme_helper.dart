import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mvvm_e_commerce/core/utilites/size_utils.dart';

String _appTheme = "primary";

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.primary,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.lightBlue900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.lightBlue900.withOpacity(0.3),
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.lightBlue900.withOpacity(0.6),
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.black90026.withOpacity(0.7),
          fontSize: 18.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 14.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.lightBlue900,
          fontSize: 30.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 24.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: appTheme.lightBlue900,
          fontSize: 20.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 18.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 14.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFFFFFFFF),
    primaryContainer: Color(0XFFBC3018),
    secondary: Color(0XFFBC3018),
    secondaryContainer: Color(0XB2FFFFFF),
    tertiary: Color(0XFFBC3018),
    tertiaryContainer: Color(0XB2FFFFFF),

    // Background colors
    background: Color(0XFFBC3018),

    // Surface colors
    surface: Color(0XFFBC3018),
    surfaceTint: Color(0XFF2E2929),
    surfaceVariant: Color(0XB2FFFFFF),

    // Error colors
    error: Color(0XFF2E2929),
    errorContainer: Color(0XFFF89209),
    onError: Color(0XFFFBE1C8),
    onErrorContainer: Color(0XFF2E2929),

    // On colors(text colors)
    onBackground: Color(0X9906004E),
    onInverseSurface: Color(0XFFFBE1C8),
    onPrimary: Color(0XFF2E2929),
    onPrimaryContainer: Color(0X9906004E),
    onSecondary: Color(0X9906004E),
    onSecondaryContainer: Color(0XFF2E2929),
    onTertiary: Color(0X9906004E),
    onTertiaryContainer: Color(0XFF2E2929),

    // Other colors
    outline: Color(0XFF2E2929),
    outlineVariant: Color(0XFFBC3018),
    scrim: Color(0XFFBC3018),
    shadow: Color(0XFF2E2929),

    // Inverse colors
    inversePrimary: Color(0XFFBC3018),
    inverseSurface: Color(0XFF2E2929),

    // Pending colors
    onSurface: Color(0X9906004E),
    onSurfaceVariant: Color(0XFF2E2929),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => const Color(0XFF000000);
  Color get black90026 => const Color(0X26000000);

  // Blue
  Color get blue200 => const Color(0XFF84BFE1);
  Color get blue700 => const Color(0XFF0973DD);

  // BlueGray
  Color get blueGray400 => const Color(0XFF888888);
  Color get blueGray50 => const Color(0XFFEDF1F5);
  Color get blueGray500 => const Color(0XFF6A6695);

  // DeepOrange
  Color get deepOrange900 => const Color(0XFFBB3219);

  // Grayf
  Color get gray3007f => const Color(0X7FDBE4EC);

  // Gray
  Color get gray600 => const Color(0XFF808080);
  Color get gray800 => const Color(0XFF484848);

  // Green
  Color get greenA700 => const Color(0XFF02B835);

  // LightBlue
  Color get lightBlue900 => const Color(0XFF004182);

  // Red
  Color get redA200 => const Color(0XFFFF645A);

  // Yellow
  Color get yellow600 => const Color(0XFFFDD835);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();