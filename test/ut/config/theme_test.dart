import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/config/theme.dart';

void main() {
  group('ThemeData creation', () {
    test('Light theme generates correct ThemeData', () {
      final theme = lightTheme(null);

      expect(theme.brightness, Brightness.light);
      expect(theme.useMaterial3, true);
      expect(theme.colorScheme.brightness, Brightness.light);

      // Check that ThemeExtensions are applied
      expect(theme.extension<DataVisColors>(), isNotNull);
      expect(theme.extension<AppColors>(), isNotNull);
      expect(theme.extension<GraphColors>(), isNotNull);
    });

    test('Dark theme generates correct ThemeData', () {
      final theme = darkTheme(null);

      expect(theme.brightness, Brightness.dark);
      expect(theme.useMaterial3, true);
      expect(theme.colorScheme.brightness, Brightness.dark);

      // Check that ThemeExtensions are applied
      expect(theme.extension<DataVisColors>(), isNotNull);
      expect(theme.extension<AppColors>(), isNotNull);
      expect(theme.extension<GraphColors>(), isNotNull);
    });

    test('ThemeData contains expected elevatedButtonTheme settings', () {
      final theme = lightTheme(null);

      final elevatedButtonTheme = theme.elevatedButtonTheme.style;
      expect(elevatedButtonTheme, isNotNull);
    });

    test('ThemeData contains expected snackBarTheme settings', () {
      final theme = lightTheme(null);

      expect(theme.snackBarTheme.behavior, SnackBarBehavior.floating);
      expect(theme.snackBarTheme.elevation, 4);
      expect(theme.snackBarTheme.shape, isA<RoundedRectangleBorder>());
    });

    test('ThemeData contains expected dialogTheme settings', () {
      final theme = lightTheme(null);

      expect(theme.dialogTheme.backgroundColor, theme.colorScheme.surface);
    });

    test('ColorScheme is correctly applied when provided', () {
      final customColorScheme = ColorScheme.fromSeed(
        seedColor: Colors.purple,
        brightness: Brightness.light, // ignore: avoid_redundant_argument_values
      );

      final theme = createTheme(
        customColorScheme,
        Brightness.light,
        lightDataVisColors,
        lightAppColors,
        lightGraphColors,
      );

      expect(theme.colorScheme.primary, customColorScheme.primary);
      expect(theme.colorScheme.brightness, Brightness.light);
    });

    test('ThemeExtensions are correctly applied', () {
      final theme = lightTheme(null);

      final dataVisColors = theme.extension<DataVisColors>();
      final appColors = theme.extension<AppColors>();
      final graphColors = theme.extension<GraphColors>();

      expect(dataVisColors, isNotNull);
      expect(appColors, isNotNull);
      expect(graphColors, isNotNull);

      expect(dataVisColors!.blue, lightDataVisColors.blue);
      expect(appColors!.snackBarSuccess, lightAppColors.snackBarSuccess);
      expect(graphColors!.colors.length, lightGraphColors.colors.length);
    });
  });

  test('DataVisColors copyWith should return new instance with updated values',
      () {
    const original = DataVisColors(
      blue: Colors.blue,
      blueDark: Colors.blueGrey,
      green: Colors.green,
      greenDark: Colors.greenAccent,
      orange: Colors.orange,
      orangeDark: Colors.deepOrange,
      red: Colors.red,
      redDark: Colors.redAccent,
    );

    final modified = original.copyWith(blue: Colors.lightBlue);

    expect(modified.blue, Colors.lightBlue);
    expect(modified.blueDark, original.blueDark);
  });

  test('AppColors copyWith should return new instance with updated values', () {
    const original = AppColors(
      snackBarSuccess: Colors.green,
      snackBarSuccessText: Colors.white,
      snackBarCaution: Colors.amber,
      snackBarCautionText: Colors.black,
      snackBarError: Colors.red,
      snackBarErrorText: Colors.white,
      snackBarNeutral: Colors.blueGrey,
      snackBarNeutralText: Colors.black,
      cardWarning: Colors.yellow,
      cardWarningText: Colors.black,
      queryRed: Colors.red,
      queryGreen: Colors.green,
      queryBlue: Colors.blue,
      queryOrange: Colors.orange,
      queryGrey: Colors.grey,
      commonRed: Colors.redAccent,
      commonGreen: Colors.greenAccent,
    );

    final modified = original.copyWith(snackBarSuccess: Colors.lightGreen);

    expect(modified.snackBarSuccess, Colors.lightGreen);
    expect(modified.snackBarError, original.snackBarError);
  });

  test('DataVisColors lerp should interpolate colors correctly', () {
    const start = DataVisColors(
      blue: Colors.blue,
      blueDark: Colors.blueGrey,
      green: Colors.green,
      greenDark: Colors.greenAccent,
      orange: Colors.orange,
      orangeDark: Colors.deepOrange,
      red: Colors.red,
      redDark: Colors.redAccent,
    );

    const end = DataVisColors(
      blue: Colors.lightBlue,
      blueDark: Colors.black,
      green: Colors.lightGreen,
      greenDark: Colors.black,
      orange: Colors.orangeAccent,
      orangeDark: Colors.black,
      red: Colors.pink,
      redDark: Colors.black,
    );

    final lerped = start.lerp(end, 0.5);

    expect(lerped.blue, Color.lerp(Colors.blue, Colors.lightBlue, 0.5));
    expect(lerped.red, Color.lerp(Colors.red, Colors.pink, 0.5));
  });

  test('AppColors lerp should interpolate colors correctly', () {
    const start = AppColors(
      snackBarSuccess: Colors.green,
      snackBarSuccessText: Colors.white,
      snackBarCaution: Colors.amber,
      snackBarCautionText: Colors.black,
      snackBarError: Colors.red,
      snackBarErrorText: Colors.white,
      snackBarNeutral: Colors.blueGrey,
      snackBarNeutralText: Colors.black,
      cardWarning: Colors.yellow,
      cardWarningText: Colors.black,
      queryRed: Colors.red,
      queryGreen: Colors.green,
      queryBlue: Colors.blue,
      queryOrange: Colors.orange,
      queryGrey: Colors.grey,
      commonRed: Colors.redAccent,
      commonGreen: Colors.greenAccent,
    );

    const end = AppColors(
      snackBarSuccess: Colors.lightGreen,
      snackBarSuccessText: Colors.black,
      snackBarCaution: Colors.orange,
      snackBarCautionText: Colors.white,
      snackBarError: Colors.deepOrange,
      snackBarErrorText: Colors.black,
      snackBarNeutral: Colors.black,
      snackBarNeutralText: Colors.white,
      cardWarning: Colors.deepOrange,
      cardWarningText: Colors.white,
      queryRed: Colors.pink,
      queryGreen: Colors.teal,
      queryBlue: Colors.cyan,
      queryOrange: Colors.deepOrange,
      queryGrey: Colors.white,
      commonRed: Colors.black,
      commonGreen: Colors.white,
    );

    final lerped = start.lerp(end, 0.5);

    expect(
      lerped.snackBarSuccess,
      Color.lerp(Colors.green, Colors.lightGreen, 0.5),
    );
    expect(lerped.queryRed, Color.lerp(Colors.red, Colors.pink, 0.5));
  });

  test('GraphColors lerp should interpolate colors correctly', () {
    const start = GraphColors(
      colors: [
        Colors.red,
        Colors.green,
        Colors.blue,
      ],
    );

    const end = GraphColors(
      colors: [
        Colors.pink,
        Colors.teal,
        Colors.cyan,
      ],
    );

    final lerped = start.lerp(end, 0.5);

    expect(lerped.colors.length, start.colors.length);
    expect(lerped.colors[0], Color.lerp(Colors.red, Colors.pink, 0.5));
    expect(lerped.colors[1], Color.lerp(Colors.green, Colors.teal, 0.5));
    expect(lerped.colors[2], Color.lerp(Colors.blue, Colors.cyan, 0.5));
  });

  test('DataVisColors harmonized should modify colors based on ColorScheme',
      () {
    const original = DataVisColors(
      blue: Colors.blue,
      blueDark: Colors.blueGrey,
      green: Colors.green,
      greenDark: Colors.greenAccent,
      orange: Colors.orange,
      orangeDark: Colors.deepOrange,
      red: Colors.red,
      redDark: Colors.redAccent,
    );

    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.teal);

    final harmonized = original.harmonized(colorScheme);

    expect(harmonized.blue, isNot(equals(original.blue)));
    expect(harmonized.red, isNot(equals(original.red)));
  });

  test('AppColors harmonized should modify colors based on ColorScheme', () {
    const original = AppColors(
      snackBarSuccess: Colors.green,
      snackBarSuccessText: Colors.white,
      snackBarCaution: Colors.amber,
      snackBarCautionText: Colors.black,
      snackBarError: Colors.red,
      snackBarErrorText: Colors.white,
      snackBarNeutral: Colors.blueGrey,
      snackBarNeutralText: Colors.black,
      cardWarning: Colors.yellow,
      cardWarningText: Colors.black,
      queryRed: Colors.red,
      queryGreen: Colors.green,
      queryBlue: Colors.blue,
      queryOrange: Colors.orange,
      queryGrey: Colors.grey,
      commonRed: Colors.redAccent,
      commonGreen: Colors.greenAccent,
    );

    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.teal);

    final harmonized = original.harmonized(colorScheme);

    expect(harmonized.snackBarSuccess, isNot(equals(original.snackBarSuccess)));
    expect(harmonized.queryRed, isNot(equals(original.queryRed)));
  });

  test('GraphColors harmonized should modify colors based on ColorScheme', () {
    const original = GraphColors(
      colors: [
        Colors.red,
        Colors.green,
        Colors.blue,
      ],
    );

    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.teal);

    final harmonized = original.harmonized(colorScheme);

    expect(harmonized.colors.length, original.colors.length);
    expect(harmonized.colors[0], isNot(equals(original.colors[0])));
    expect(harmonized.colors[1], isNot(equals(original.colors[1])));
    expect(harmonized.colors[2], isNot(equals(original.colors[2])));
  });
}
