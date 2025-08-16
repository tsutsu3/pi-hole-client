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

extension StringToDnsBlockingStatusMapper on String {
  DnsBlockingStatus toDnsBlockingStatus() {
    return DnsBlockingStatus.values.firstWhere(
      (e) => e.name == this,
      orElse: () => DnsBlockingStatus.unknown,
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

// QueryStatusType parseStatusV5(int code) {
//   switch (code) {
//     case 1:
//       return QueryStatusType.gravity;
//     case 2:
//       return QueryStatusType.forwarded;
//     case 3:
//       return QueryStatusType.cache;
//     case 4:
//       return QueryStatusType.regex;
//     case 5:
//       return QueryStatusType.denylist;
//     case 6:
//       return QueryStatusType.externalBlockedIp;
//     case 7:
//       return QueryStatusType.externalBlockedNull;
//     case 8:
//       return QueryStatusType.externalBlockedNxra;
//     case 9:
//       return QueryStatusType.gravityCname;
//     case 10:
//       return QueryStatusType.regexCname;
//     case 11:
//       return QueryStatusType.denylistCname;
//     case 12:
//       return QueryStatusType.retried;
//     case 13:
//       return QueryStatusType.retriedDnssec;
//     case 14:
//       return QueryStatusType.alreadyForwarded;
//     case 15:
//       return QueryStatusType.dbBusy;
//     default:
//       return QueryStatusType.unknown;
//   }
// }

// QueryStatusType parseStatusV6(String key) {
//   switch (key.toUpperCase()) {
//     case 'GRAVITY':
//       return QueryStatusType.gravity;
//     case 'FORWARDED':
//       return QueryStatusType.forwarded;
//     case 'CACHE':
//       return QueryStatusType.cache;
//     case 'REGEX':
//       return QueryStatusType.regex;
//     case 'DENYLIST':
//       return QueryStatusType.denylist;
//     case 'EXTERNAL_BLOCKED_IP':
//       return QueryStatusType.externalBlockedIp;
//     case 'EXTERNAL_BLOCKED_NULL':
//       return QueryStatusType.externalBlockedNull;
//     case 'EXTERNAL_BLOCKED_NXRA':
//       return QueryStatusType.externalBlockedNxra;
//     case 'GRAVITY_CNAME':
//       return QueryStatusType.gravityCname;
//     case 'REGEX_CNAME':
//       return QueryStatusType.regexCname;
//     case 'DENYLIST_CNAME':
//       return QueryStatusType.denylistCname;
//     case 'RETRIED':
//       return QueryStatusType.retried;
//     case 'RETRIED_DNSSEC':
//       return QueryStatusType.retriedDnssec;
//     case 'IN_PROGRESS':
//       return QueryStatusType.inProgress;
//     case 'DBBUSY':
//       return QueryStatusType.dbBusy;
//     case 'SPECIAL_DOMAIN':
//       return QueryStatusType.specialDomain;
//     case 'CACHE_STALE':
//       return QueryStatusType.cacheStale;
//     case 'EXTERNAL_BLOCKED_EDE15':
//       return QueryStatusType.externalBlockedEde15;
//     case 'UNKNOWN':
//       return QueryStatusType.unknown;
//     default:
//       return QueryStatusType.unknown;
//   }
// }
