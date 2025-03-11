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
}
