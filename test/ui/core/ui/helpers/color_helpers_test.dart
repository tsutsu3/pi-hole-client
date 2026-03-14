import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/query_status.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/color_helpers.dart';

void main() {
  // Use the pre-defined light theme colors as a stable reference.
  const colors = lightAppColors;

  // -------------------------------------------------------------------------
  // resolveQueryColor
  // -------------------------------------------------------------------------

  group('resolveQueryColor', () {
    test('red category returns queryRed', () {
      expect(
        resolveQueryColor(colors, QueryColorCategory.red),
        equals(colors.queryRed),
      );
    });

    test('green category returns queryGreen', () {
      expect(
        resolveQueryColor(colors, QueryColorCategory.green),
        equals(colors.queryGreen),
      );
    });

    test('blue category returns queryBlue', () {
      expect(
        resolveQueryColor(colors, QueryColorCategory.blue),
        equals(colors.queryBlue),
      );
    });

    test('orange category returns queryOrange', () {
      expect(
        resolveQueryColor(colors, QueryColorCategory.orange),
        equals(colors.queryOrange),
      );
    });

    test('grey category returns queryGrey', () {
      expect(
        resolveQueryColor(colors, QueryColorCategory.grey),
        equals(colors.queryGrey),
      );
    });

    test('falls back to Colors.red when queryRed is null', () {
      final nullColors = colors.copyWith(queryRed: null);
      expect(
        resolveQueryColor(nullColors, QueryColorCategory.red),
        equals(Colors.red),
      );
    });
  });

  // -------------------------------------------------------------------------
  // domainTypeColor
  // -------------------------------------------------------------------------

  group('domainTypeColor', () {
    test('allow + exact returns queryGreen', () {
      expect(
        domainTypeColor(colors, DomainType.allow, DomainKind.exact),
        equals(colors.queryGreen),
      );
    });

    test('deny + exact returns queryRed', () {
      expect(
        domainTypeColor(colors, DomainType.deny, DomainKind.exact),
        equals(colors.queryRed),
      );
    });

    test('allow + regex returns queryBlue', () {
      expect(
        domainTypeColor(colors, DomainType.allow, DomainKind.regex),
        equals(colors.queryBlue),
      );
    });

    test('deny + regex returns queryOrange', () {
      expect(
        domainTypeColor(colors, DomainType.deny, DomainKind.regex),
        equals(colors.queryOrange),
      );
    });
  });
}
