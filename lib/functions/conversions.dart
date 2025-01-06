import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/config/theme.dart';

/// Converts a given [color] to the corresponding theme-based color defined in
/// [AppColors].
///
/// This function is used to adapt predefined colors (such as [Colors.red],
/// [Colors.green], etc.) to theme-specific variants from [AppColors]. If the
/// provided color matches a predefined color, the corresponding color from
/// [AppColors] is returned. If no match is found, the original color is
/// returned unchanged.
///
/// This is particularly useful for applying light and dark theme adjustments
/// to predefined colors while keeping the structure of [QueryStatus] unchanged.
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

List<Domain> parseDomainList(List<Map<String, dynamic>> jsonList) {
  return jsonList.map((item) => Domain.fromJson(item)).toList();
}

bool? convertFromIntToBool(int value) {
  if (value == 1) {
    return true;
  } else if (value == 0) {
    return false;
  } else {
    return null;
  }
}

int? convertFromBoolToInt(bool value) {
  if (value == true) {
    return 1;
  } else if (value == false) {
    return 0;
  } else {
    return null;
  }
}

String formatPercentage(double value, String locale) {
  final NumberFormat f = NumberFormat('###.##', locale);
  return f.format(value);
}

String intFormat(int value, String locale) {
  final f = NumberFormat('#,###', locale);
  return f.format(value);
}

List<Map<String, dynamic>> convertFromMapToList(Map<String, int> values) {
  List<Map<String, dynamic>> items = [];
  values.forEach((key, value) {
    items.add({'label': key, 'value': value});
  });
  return items;
}
