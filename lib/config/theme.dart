import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';

// ----------------------------------------------------------------------------
// Extension for the `ColorScheme` class
// ----------------------------------------------------------------------------
@immutable
class DataVisColors extends ThemeExtension<DataVisColors> {
  final Color? blue;
  final Color? blueDark;
  final Color? green;
  final Color? greenDark;
  final Color? orange;
  final Color? orangeDark;
  final Color? red;
  final Color? redDark;

  const DataVisColors({
    required this.blue,
    required this.blueDark,
    required this.green,
    required this.greenDark,
    required this.orange,
    required this.orangeDark,
    required this.red,
    required this.redDark,
  });

  @override
  DataVisColors copyWith({
    Color? blue,
    Color? blueDark,
    Color? green,
    Color? greenDark,
    Color? orange,
    Color? orangeDark,
    Color? red,
    Color? redDark,
  }) {
    return DataVisColors(
      blue: blue ?? this.blue,
      blueDark: blueDark ?? this.blueDark,
      green: green ?? this.green,
      greenDark: greenDark ?? this.greenDark,
      orange: orange ?? this.orange,
      orangeDark: orangeDark ?? this.orangeDark,
      red: red ?? this.red,
      redDark: redDark ?? this.redDark,
    );
  }

  @override
  DataVisColors lerp(ThemeExtension<DataVisColors>? other, double t) {
    if (other is! DataVisColors) {
      return this;
    }
    return DataVisColors(
      blue: Color.lerp(blue, other.blue, t),
      blueDark: Color.lerp(blueDark, other.blueDark, t),
      green: Color.lerp(green, other.green, t),
      greenDark: Color.lerp(greenDark, other.greenDark, t),
      orange: Color.lerp(orange, other.orange, t),
      orangeDark: Color.lerp(orangeDark, other.orangeDark, t),
      red: Color.lerp(red, other.red, t),
      redDark: Color.lerp(redDark, other.redDark, t),
    );
  }

  /// Harmonizes all colors with the given `ColorScheme`
  DataVisColors harmonized(ColorScheme dynamic) {
    return copyWith(
      blue: blue!.harmonizeWith(dynamic.primary),
      blueDark: blueDark!.harmonizeWith(dynamic.primary),
      green: green!.harmonizeWith(dynamic.primary),
      greenDark: greenDark!.harmonizeWith(dynamic.primary),
      orange: orange!.harmonizeWith(dynamic.primary),
      orangeDark: orangeDark!.harmonizeWith(dynamic.primary),
      red: red!.harmonizeWith(dynamic.primary),
      redDark: redDark!.harmonizeWith(dynamic.primary),
    );
  }
}

const lightDataVisColors = DataVisColors(
  blue: Color(0xFF007BFF),
  blueDark: Color(0xFF005BBB),
  green: Color(0xFF00a65a),
  greenDark: Color(0xFF008d4d),
  orange: Color(0xFFf39c12),
  orangeDark: Color(0xFFcf850f),
  red: Color(0xFFdd4b39),
  redDark: Color(0xFFbc4031),
);

const darkDataVisColors = DataVisColors(
  blue: Color(0xFF1670D2),
  blueDark: Color(0xFF1259B5),
  green: Color(0xFF118144),
  greenDark: Color(0xFF0E6A38),
  orange: Color(0xFFD28719),
  orangeDark: Color(0xFFB26F11),
  red: Color(0xFFB23A2C),
  redDark: Color(0xFF963424),
);

// ----------------------------------------------------------------------------
// Themes
// ----------------------------------------------------------------------------
/// Common function to generate light or dark theme
ThemeData createTheme(
  ColorScheme? dynamicColorScheme,
  Brightness brightness,
  DataVisColors dataVisColors,
) {
  final colorScheme = dynamicColorScheme ??
      ColorScheme.fromSeed(seedColor: Colors.blue, brightness: brightness);

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    brightness: brightness,
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 4,
    ),
    listTileTheme: ListTileThemeData(
      tileColor: Colors.transparent,
      textColor: colorScheme.onSurfaceVariant,
      iconColor: colorScheme.onSurfaceVariant,
    ),
    cardTheme: CardTheme(surfaceTintColor: colorScheme.surfaceTint),
    popupMenuTheme:
        PopupMenuThemeData(surfaceTintColor: colorScheme.surfaceTint),
    navigationBarTheme:
        NavigationBarThemeData(surfaceTintColor: colorScheme.surfaceTint),
    dialogTheme: DialogTheme(surfaceTintColor: colorScheme.surfaceTint),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
      },
    ),
    extensions: [
      // dataVisColors.harmonized(colorScheme),
      dataVisColors,
    ],
  );
}

ThemeData lightTheme(ColorScheme? dynamicColorScheme) =>
    createTheme(dynamicColorScheme, Brightness.light, lightDataVisColors);

ThemeData darkTheme(ColorScheme? dynamicColorScheme) =>
    createTheme(dynamicColorScheme, Brightness.dark, darkDataVisColors);
