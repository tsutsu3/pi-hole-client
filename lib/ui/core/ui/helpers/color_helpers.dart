import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';

/// Converts a given [color] to the corresponding theme-based color defined in
/// [AppColors].
///
/// This function is used to adapt predefined colors (such as [Colors.red],
/// [Colors.green], etc.) to theme-specific variants from [AppColors]. If the
/// provided color matches a predefined color, the corresponding color from
/// [AppColors] is returned. If no match is found, the original color is
/// returned unchanged.
///
/// ### Parameters:
/// - [colors]: An instance of [AppColors] that contains the theme-based color
/// definitions.
/// - [color]: The original color to be converted.
///
/// ### Returns:
/// A theme-adjusted [Color] if a match is found in [AppColors], otherwise
/// returns the original [color].
Color convertColor(AppColors colors, Color color) {
  switch (color) {
    case Colors.red:
      return colors.queryRed ?? Colors.red;
    case Colors.green:
      return colors.queryGreen ?? Colors.green;
    case Colors.blue:
      return colors.queryBlue ?? Colors.blue;
    case Colors.orange:
      return colors.queryOrange ?? Colors.orange;
    case Colors.grey:
      return colors.queryGrey ?? Colors.grey;
    default:
      return color;
  }
}

/// Converts a given [number] to the corresponding theme-based color defined in
/// [AppColors].
///
/// This function is used to adapt predefined color numbers (0-3) to theme-
/// specific variants from [AppColors]. If the provided number matches a
/// predefined color, the corresponding color from [AppColors] is returned. If
/// no match is found, the default color is returned.
///
/// ### Parameters:
/// - [colors]: An instance of [AppColors] that contains the theme-based color
/// definitions.
/// - [number]: The number representing the color to be converted.
Color convertColorFromNumber(AppColors colors, int number) {
  switch (number) {
    case 0:
      return colors.queryGreen ?? Colors.green;
    case 1:
      return colors.queryRed ?? Colors.red;
    case 2:
      return colors.queryBlue ?? Colors.blue;
    case 3:
      return colors.queryOrange ?? Colors.orange;
    default:
      return colors.queryGrey ?? Colors.grey;
  }
}

Color domainTypeColor(AppColors colors, DomainType type, DomainKind kind) {
  return switch ((type, kind)) {
    (DomainType.allow, DomainKind.exact) => colors.queryGreen ?? Colors.green,
    (DomainType.deny, DomainKind.exact) => colors.queryRed ?? Colors.red,
    (DomainType.allow, DomainKind.regex) => colors.queryBlue ?? Colors.blue,
    (DomainType.deny, DomainKind.regex) =>
      colors.queryOrange ?? Colors.orange,
  };
}
