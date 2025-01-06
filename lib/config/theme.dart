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

class AppColors extends ThemeExtension<AppColors> {
  final Color? snackBarSuccess;
  final Color? snackBarSuccessText;
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

  final Color? commonRed;
  final Color? commonGreen;

  const AppColors({
    required this.snackBarSuccess,
    required this.snackBarSuccessText,
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
    required this.commonRed,
    required this.commonGreen,
  });

  @override
  AppColors copyWith({
    Color? snackBarSuccess,
    Color? snackBarSuccessText,
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
    Color? commonRed,
    Color? commonGreen,
  }) {
    return AppColors(
      snackBarSuccess: snackBarSuccess ?? this.snackBarSuccess,
      snackBarSuccessText: snackBarSuccessText ?? this.snackBarSuccessText,
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
      commonRed: commonRed ?? this.commonRed,
      commonGreen: commonGreen ?? this.commonGreen,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      snackBarSuccess: Color.lerp(snackBarSuccess, other.snackBarSuccess, t),
      snackBarSuccessText:
          Color.lerp(snackBarSuccessText, other.snackBarSuccessText, t),
      snackBarError: Color.lerp(snackBarError, other.snackBarError, t),
      snackBarErrorText:
          Color.lerp(snackBarErrorText, other.snackBarErrorText, t),
      snackBarNeutral: Color.lerp(snackBarNeutral, other.snackBarNeutral, t),
      snackBarNeutralText:
          Color.lerp(snackBarNeutralText, other.snackBarNeutralText, t),
      cardWarning: Color.lerp(cardWarning, other.cardWarning, t),
      cardWarningText: Color.lerp(cardWarningText, other.cardWarningText, t),
      queryRed: Color.lerp(queryRed, other.queryRed, t),
      queryGreen: Color.lerp(queryGreen, other.queryGreen, t),
      queryBlue: Color.lerp(queryBlue, other.queryBlue, t),
      queryOrange: Color.lerp(queryOrange, other.queryOrange, t),
      queryGrey: Color.lerp(queryGrey, other.queryGrey, t),
      commonRed: Color.lerp(commonRed, other.commonRed, t),
      commonGreen: Color.lerp(commonGreen, other.commonGreen, t),
    );
  }

  AppColors harmonized(ColorScheme dynamic) {
    return copyWith(
      snackBarSuccess: snackBarSuccess!.harmonizeWith(dynamic.primary),
      snackBarSuccessText: snackBarSuccessText!.harmonizeWith(dynamic.primary),
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
      commonRed: commonRed!.harmonizeWith(dynamic.primary),
      commonGreen: commonGreen!.harmonizeWith(dynamic.primary),
    );
  }
}

const lightAppColors = AppColors(
  snackBarSuccess: Color(0xFF81C784),
  snackBarSuccessText: Color(0xFF1B5E20),
  snackBarError: Color(0xFFE57373),
  snackBarErrorText: Color(0xFFB71C1C),
  snackBarNeutral: Color(0xFFE0E0E0),
  snackBarNeutralText: Color(0xFF424242),
  cardWarning: Color(0xFFFFF176),
  cardWarningText: Color(0xFF212121),
  queryRed: Color(0xFFD32F2F),
  queryGreen: Color(0xFF388E3C),
  queryBlue: Color(0xFF1976D2),
  queryOrange: Color(0xFFF57C00),
  queryGrey: Color(0xFF616161),
  commonRed: Color(0xFFD32F2F),
  commonGreen: Color(0xFF388E3C),
);

const darkAppColors = AppColors(
  snackBarSuccess: Color(0xFF1B5E20),
  snackBarSuccessText: Color(0xFFA5D6A7),
  snackBarError: Color(0xFFB71C1C),
  snackBarErrorText: Color(0xFFFFCDD2),
  snackBarNeutral: Color(0xFF424242),
  snackBarNeutralText: Color(0xFFE0E0E0),
  cardWarning: Color(0xFFCC8500),
  cardWarningText: Color(0xFFEEEEEE),
  queryRed: Color(0xFFEF9A9A),
  queryGreen: Color(0xFFA5D6A7),
  queryBlue: Color(0xFF90CAF9),
  queryOrange: Color(0xFFFFCC80),
  queryGrey: Color(0xFFB0BEC5),
  commonRed: Color(0xFFEF9A9A),
  commonGreen: Color(0xFFA5D6A7),
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
      // appColors.harmonized(colorScheme),
      dataVisColors,
      appColors,
    ],
  );
}

ThemeData lightTheme(ColorScheme? dynamicColorScheme) => createTheme(
      dynamicColorScheme,
      Brightness.light,
      lightDataVisColors,
      lightAppColors,
    );

ThemeData darkTheme(ColorScheme? dynamicColorScheme) => createTheme(
      dynamicColorScheme,
      Brightness.dark,
      darkDataVisColors,
      darkAppColors,
    );
