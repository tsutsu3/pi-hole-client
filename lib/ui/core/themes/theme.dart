import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

// ----------------------------------------------------------------------------
// Extension for the `ColorScheme` class
// ----------------------------------------------------------------------------
@immutable
class DataVisColors extends ThemeExtension<DataVisColors> {
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

  final Color? blue;
  final Color? blueDark;
  final Color? green;
  final Color? greenDark;
  final Color? orange;
  final Color? orangeDark;
  final Color? red;
  final Color? redDark;

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

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.snackBarSuccess,
    required this.snackBarSuccessText,
    required this.snackBarCaution,
    required this.snackBarCautionText,
    required this.snackBarError,
    required this.snackBarErrorText,
    required this.snackBarNeutral,
    required this.snackBarNeutralText,
    required this.cardWarning,
    required this.cardWarningText,
    required this.queryRed,
    required this.queryGreen,
    required this.queryBlue,
    required this.queryOrange,
    required this.queryGrey,
    required this.securityPinned,
    required this.commonRed,
    required this.commonGreen,
    required this.commonLightGrey,
  });

  final Color? snackBarSuccess;
  final Color? snackBarSuccessText;
  final Color? snackBarCaution;
  final Color? snackBarCautionText;
  final Color? snackBarError;
  final Color? snackBarErrorText;
  final Color? snackBarNeutral;
  final Color? snackBarNeutralText;

  final Color? cardWarning;
  final Color? cardWarningText;

  final Color? queryRed;
  final Color? queryGreen;
  final Color? queryBlue;
  final Color? queryOrange;
  final Color? queryGrey;

  /// Accent color used for "certificate pinned" / "pinned security" UI states.
  ///
  /// Kept as an app-level token (instead of hardcoded `Colors.teal`) so it can
  /// be tuned per theme (light/dark) and harmonized with dynamic colors.
  final Color? securityPinned;

  final Color? commonRed;
  final Color? commonGreen;
  final Color? commonLightGrey;

  @override
  AppColors copyWith({
    Color? snackBarSuccess,
    Color? snackBarSuccessText,
    Color? snackBarCaution,
    Color? snackBarCautionText,
    Color? snackBarError,
    Color? snackBarErrorText,
    Color? snackBarNeutral,
    Color? snackBarNeutralText,
    Color? cardWarning,
    Color? cardWarningText,
    Color? queryRed,
    Color? queryGreen,
    Color? queryBlue,
    Color? queryOrange,
    Color? queryGrey,
    Color? securityPinned,
    Color? commonRed,
    Color? commonGreen,
    Color? commonLightGrey,
  }) {
    return AppColors(
      snackBarSuccess: snackBarSuccess ?? this.snackBarSuccess,
      snackBarSuccessText: snackBarSuccessText ?? this.snackBarSuccessText,
      snackBarCaution: snackBarCaution ?? this.snackBarCaution,
      snackBarCautionText: snackBarCautionText ?? this.snackBarCautionText,
      snackBarError: snackBarError ?? this.snackBarError,
      snackBarErrorText: snackBarErrorText ?? this.snackBarErrorText,
      snackBarNeutral: snackBarNeutral ?? this.snackBarNeutral,
      snackBarNeutralText: snackBarNeutralText ?? this.snackBarNeutralText,
      cardWarning: cardWarning ?? this.cardWarning,
      cardWarningText: cardWarningText ?? this.cardWarningText,
      queryRed: queryRed ?? this.queryRed,
      queryGreen: queryGreen ?? this.queryGreen,
      queryBlue: queryBlue ?? this.queryBlue,
      queryOrange: queryOrange ?? this.queryOrange,
      queryGrey: queryGrey ?? this.queryGrey,
      securityPinned: securityPinned ?? this.securityPinned,
      commonRed: commonRed ?? this.commonRed,
      commonGreen: commonGreen ?? this.commonGreen,
      commonLightGrey: commonLightGrey ?? this.commonLightGrey,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      snackBarSuccess: Color.lerp(snackBarSuccess, other.snackBarSuccess, t),
      snackBarSuccessText: Color.lerp(
        snackBarSuccessText,
        other.snackBarSuccessText,
        t,
      ),
      snackBarCaution: Color.lerp(snackBarCaution, other.snackBarCaution, t),
      snackBarCautionText: Color.lerp(
        snackBarCautionText,
        other.snackBarCautionText,
        t,
      ),
      snackBarError: Color.lerp(snackBarError, other.snackBarError, t),
      snackBarErrorText: Color.lerp(
        snackBarErrorText,
        other.snackBarErrorText,
        t,
      ),
      snackBarNeutral: Color.lerp(snackBarNeutral, other.snackBarNeutral, t),
      snackBarNeutralText: Color.lerp(
        snackBarNeutralText,
        other.snackBarNeutralText,
        t,
      ),
      cardWarning: Color.lerp(cardWarning, other.cardWarning, t),
      cardWarningText: Color.lerp(cardWarningText, other.cardWarningText, t),
      queryRed: Color.lerp(queryRed, other.queryRed, t),
      queryGreen: Color.lerp(queryGreen, other.queryGreen, t),
      queryBlue: Color.lerp(queryBlue, other.queryBlue, t),
      queryOrange: Color.lerp(queryOrange, other.queryOrange, t),
      queryGrey: Color.lerp(queryGrey, other.queryGrey, t),
      securityPinned: Color.lerp(securityPinned, other.securityPinned, t),
      commonRed: Color.lerp(commonRed, other.commonRed, t),
      commonGreen: Color.lerp(commonGreen, other.commonGreen, t),
      commonLightGrey: Color.lerp(commonLightGrey, other.commonLightGrey, t),
    );
  }

  AppColors harmonized(ColorScheme dynamic) {
    return copyWith(
      snackBarSuccess: snackBarSuccess!.harmonizeWith(dynamic.primary),
      snackBarSuccessText: snackBarSuccessText!.harmonizeWith(dynamic.primary),
      snackBarCaution: snackBarCaution!.harmonizeWith(dynamic.primary),
      snackBarCautionText: snackBarCautionText!.harmonizeWith(dynamic.primary),
      snackBarError: snackBarError!.harmonizeWith(dynamic.primary),
      snackBarErrorText: snackBarErrorText!.harmonizeWith(dynamic.primary),
      snackBarNeutral: snackBarNeutral!.harmonizeWith(dynamic.primary),
      snackBarNeutralText: snackBarNeutralText!.harmonizeWith(dynamic.primary),
      cardWarning: cardWarning!.harmonizeWith(dynamic.primary),
      cardWarningText: cardWarningText!.harmonizeWith(dynamic.primary),
      queryRed: queryRed!.harmonizeWith(dynamic.primary),
      queryGreen: queryGreen!.harmonizeWith(dynamic.primary),
      queryBlue: queryBlue!.harmonizeWith(dynamic.primary),
      queryOrange: queryOrange!.harmonizeWith(dynamic.primary),
      queryGrey: queryGrey!.harmonizeWith(dynamic.primary),
      securityPinned: securityPinned!.harmonizeWith(dynamic.primary),
      commonRed: commonRed!.harmonizeWith(dynamic.primary),
      commonGreen: commonGreen!.harmonizeWith(dynamic.primary),
      commonLightGrey: commonLightGrey!.harmonizeWith(dynamic.primary),
    );
  }
}

const lightAppColors = AppColors(
  snackBarSuccess: Colors.green,
  snackBarSuccessText: Color(0xFFE8F5E9), // shade50
  snackBarCaution: Color(0xFFFFB300), // shade600
  snackBarCautionText: Color(0xFFFFF8E1), // shade50
  snackBarError: Colors.red,
  snackBarErrorText: Color(0xFFFFEBEE), // shade50
  snackBarNeutral: Colors.blueGrey,
  snackBarNeutralText: Color(0xFFECEFF1), // shade50
  cardWarning: Color(0xFFFFE082), //amber.shade200
  cardWarningText: Color(0xFF3E2723), //brown.shade900
  queryRed: Colors.red,
  queryGreen: Colors.green,
  queryBlue: Colors.blue,
  queryOrange: Colors.orange,
  queryGrey: Color(0xFF757575), // shade600
  securityPinned: Colors.teal,
  commonRed: Colors.red,
  commonGreen: Colors.green,
  commonLightGrey: Color(0xFFBDBDBD), // shade300
);

const darkAppColors = AppColors(
  snackBarSuccess: Color(0xFF2E7D32), // shade800
  snackBarSuccessText: Color(0xFFC8E6C9), // shade100
  snackBarCaution: Color(0xFFFF8F00), // shade800
  snackBarCautionText: Color(0xFFFFF8E1), // shade50
  snackBarError: Color(0xFFC62828), // shade800
  snackBarErrorText: Color(0xFFFFCDD2), // shade100
  snackBarNeutral: Color(0xFF37474F), // shade800
  snackBarNeutralText: Color(0xFFCFD8DC), // shade100
  cardWarning: Color(0xFFFF8F00), //amber.shade800
  cardWarningText: Color(0xFFFFF8E1), //amber.shade50
  queryRed: Colors.redAccent,
  queryGreen: Colors.greenAccent,
  queryBlue: Colors.blueAccent,
  queryOrange: Colors.orangeAccent,
  queryGrey: Colors.grey,
  securityPinned: Colors.tealAccent,
  commonRed: Colors.redAccent,
  commonGreen: Colors.greenAccent,
  commonLightGrey: Color(0xFFBDBDBD), // shade300
);

@immutable
class GraphColors extends ThemeExtension<GraphColors> {
  const GraphColors({required this.colors});

  final List<Color> colors;

  @override
  GraphColors copyWith({List<Color>? colors}) {
    return GraphColors(colors: colors ?? this.colors);
  }

  @override
  GraphColors lerp(ThemeExtension<GraphColors>? other, double t) {
    if (other is! GraphColors) return this;
    return GraphColors(
      colors: List.generate(colors.length, (i) {
        return Color.lerp(colors[i], other.colors[i], t) ?? colors[i];
      }),
    );
  }

  GraphColors harmonized(ColorScheme dynamic) {
    return copyWith(
      colors: colors
          .map((color) => color.harmonizeWith(dynamic.primary))
          .toList(),
    );
  }

  Color getColor(int index, [Color? defaultColor]) {
    if (colors.isEmpty) return defaultColor ?? Colors.black;
    if (index < 0) return defaultColor ?? Colors.black;
    return colors[index % colors.length];
  }
}

const lightGraphColors = GraphColors(
  colors: [
    Colors.blue,
    Colors.red,
    Colors.amber,
    Colors.green,
    Colors.cyan,
    Colors.blueGrey,
    Colors.deepPurple,
    Colors.orange,
    Colors.lightBlue,
    Colors.brown,
    Colors.deepOrange,
    Colors.amberAccent,
    Colors.blueAccent,
    Colors.lightGreen,
    Colors.indigo,
    Colors.redAccent,
    Colors.yellowAccent,
    Colors.purple,
    Colors.limeAccent,
    Colors.teal,
    Colors.pink,
    Colors.greenAccent,
  ],
);

const darkGraphColors = GraphColors(
  colors: [
    Color(0xFF42A5F5), // shade400
    Color(0xFFEF5350), // shade400
    Color(0xFFFFCA28), // shade400
    Color(0xFF66BB6A), // shade400
    Color(0xFF26C6DA), // shade400
    Color(0xFF78909C), // shade400
    Color(0xFF9575CD), // shade400
    Color(0xFFFFA726), // shade400
    Color(0xFF29B6F6), // shade400
    Color(0xFF8D6E63), // shade400
    Color(0xFFFF7043), // shade400
    Color(0xFFFFD54F), // A200
    Color(0xFF448AFF), // A200
    Color(0xFF9CCC65), // shade400
    Color(0xFF5C6BC0), // shade400
    Color(0xFFFF5252), // A200
    Color(0xFFFFFF00), // A200
    Color(0xFFAB47BC), // shade400
    Color(0xFFEEFF41), // A200
    Color(0xFF26A69A), // shade400
    Color(0xFFEC407A), // shade400
    Color(0xFF00E676), // A400
  ],
);

// ----------------------------------------------------------------------------
// Themes
// ----------------------------------------------------------------------------
/// Common function to generate light or dark theme
ThemeData createTheme(
  ColorScheme? dynamicColorScheme,
  Brightness brightness,
  DataVisColors dataVisColors,
  AppColors appColors,
  GraphColors graphColors,
) {
  final colorScheme =
      dynamicColorScheme ??
      ColorScheme.fromSeed(seedColor: Colors.blue, brightness: brightness);

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    brightness: brightness,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          final baseColor = colorScheme.primaryContainer;
          final greyColor = brightness == Brightness.dark
              ? Colors.grey[900]!
              : Colors.grey[300]!;
          return Color.lerp(baseColor, greyColor, 0.5)!.withValues(alpha: 0.3);
        }),
      ),
    ),
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
    cardTheme: CardThemeData(surfaceTintColor: colorScheme.surfaceTint),
    popupMenuTheme: PopupMenuThemeData(
      surfaceTintColor: colorScheme.surfaceTint,
    ),
    navigationBarTheme: NavigationBarThemeData(
      surfaceTintColor: colorScheme.surfaceTint,
    ),
    // Disabled PredictiveBack because its animation feels slow.
    // Revert to ZoomPageTransitionsBuilder() for snappier, faster transitions.
    // pageTransitionsTheme: const PageTransitionsTheme(
    //   builders: {
    //     TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
    //   },
    // ),
    dialogTheme: DialogThemeData(backgroundColor: colorScheme.surface),
    extensions: [
      // dataVisColors.harmonized(colorScheme),
      // appColors.harmonized(colorScheme),
      dataVisColors,
      appColors,
      graphColors,
    ],
  );
}

ThemeData lightTheme(ColorScheme? dynamicColorScheme) => createTheme(
  dynamicColorScheme,
  Brightness.light,
  lightDataVisColors,
  lightAppColors,
  lightGraphColors,
);

ThemeData darkTheme(ColorScheme? dynamicColorScheme) => createTheme(
  dynamicColorScheme,
  Brightness.dark,
  darkDataVisColors,
  darkAppColors,
  darkGraphColors,
);
