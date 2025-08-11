import 'package:pi_hole_client/config/enums.dart';

extension StringToDomainTypeMapper on String {
  DomainType toDomainType() {
    return DomainType.values.firstWhere(
      (e) => e.name == this,
      orElse: () => DomainType.allow,
    );
  }
}

extension StringToDomainKindMapper on String {
  DomainKind toDomainKind() {
    return DomainKind.values.firstWhere(
      (e) => e.name == this,
      orElse: () => DomainKind.exact,
    );
  }
}

extension DomainTypeToV5DomainTypeMapper on DomainType {
  V5DomainType toV5DomainType(DomainKind kind) {
    return switch ((this, kind)) {
      (DomainType.allow, DomainKind.exact) => V5DomainType.white,
      (DomainType.allow, DomainKind.regex) => V5DomainType.regex_white,
      (DomainType.deny, DomainKind.exact) => V5DomainType.black,
      (DomainType.deny, DomainKind.regex) => V5DomainType.regex_black,
    };
  }
}

extension V5DomainTypeToDomainTypeMapper on V5DomainType {
  DomainType toDomainType() {
    switch (this) {
      case V5DomainType.white:
      case V5DomainType.regex_white:
        return DomainType.allow;
      case V5DomainType.black:
      case V5DomainType.regex_black:
        return DomainType.deny;
    }
  }

  DomainKind toDomainKind() {
    switch (this) {
      case V5DomainType.white:
      case V5DomainType.black:
        return DomainKind.exact;
      case V5DomainType.regex_white:
      case V5DomainType.regex_black:
        return DomainKind.regex;
    }
  }
}
