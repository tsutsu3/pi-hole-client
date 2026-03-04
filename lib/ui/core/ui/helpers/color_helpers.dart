import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/query_status.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';

/// Resolves a [QueryColorCategory] to the corresponding theme color from
/// [AppColors].
Color resolveQueryColor(AppColors colors, QueryColorCategory category) {
  return switch (category) {
    QueryColorCategory.red => colors.queryRed ?? Colors.red,
    QueryColorCategory.green => colors.queryGreen ?? Colors.green,
    QueryColorCategory.blue => colors.queryBlue ?? Colors.blue,
    QueryColorCategory.orange => colors.queryOrange ?? Colors.orange,
    QueryColorCategory.grey => colors.queryGrey ?? Colors.grey,
  };
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
