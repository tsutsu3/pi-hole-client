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

DnsRecordType convertDnsRecordTypeV5(String? type) {
  switch (type) {
    case 'A':
      return DnsRecordType.a;
    case 'AAAA':
      return DnsRecordType.aaaa;
    case 'CNAME':
      return DnsRecordType.cname;
    case 'PTR':
      return DnsRecordType.ptr;
    case 'TXT':
      return DnsRecordType.txt;
    case 'SRV':
      return DnsRecordType.srv;
    case 'HTTPS':
      return DnsRecordType.https;
    case 'MX':
      return DnsRecordType.mx;
    case 'NS':
      return DnsRecordType.ns;
    case 'SOA':
      return DnsRecordType.soa;
    default:
      return DnsRecordType.unknown;
  }
}

ReplyType convertReplyTypeV5(int? code) {
  switch (code) {
    case 0:
      return ReplyType.na;
    case 1:
      return ReplyType.nodata;
    case 2:
      return ReplyType.nxdomain;
    case 3:
      return ReplyType.cname;
    case 4:
      return ReplyType.ip;
    case 5:
      return ReplyType.domain;
    case 6:
      return ReplyType.rrname;
    case 7:
      return ReplyType.servfail;
    case 8:
      return ReplyType.refused;
    case 9:
      return ReplyType.notimp;
    case 10:
      return ReplyType.upstreamError;
    case 11:
      return ReplyType.dnssec;
    case 12:
      return ReplyType.none;
    case 13:
      return ReplyType.blob;
    default:
      return ReplyType.unknown;
  }
}

QueryStatusType convertQueryStatusTypeV5(int? code) {
  switch (code) {
    case 1:
      return QueryStatusType.gravity;
    case 2:
      return QueryStatusType.forwarded;
    case 3:
      return QueryStatusType.cache;
    case 4:
      return QueryStatusType.regex;
    case 5:
      return QueryStatusType.denylist;
    case 6:
      return QueryStatusType.externalBlockedIp;
    case 7:
      return QueryStatusType.externalBlockedNull;
    case 8:
      return QueryStatusType.externalBlockedNxra;
    case 9:
      return QueryStatusType.gravityCname;
    case 10:
      return QueryStatusType.regexCname;
    case 11:
      return QueryStatusType.denylistCname;
    case 12:
      return QueryStatusType.retried;
    case 13:
      return QueryStatusType.retriedDnssec;
    case 14:
      return QueryStatusType.inProgress;
    case 15:
      return QueryStatusType.dbBusy;
    default:
      return QueryStatusType.unknown;
  }
}

QueryStatusType convertQueryStatusTypeV6(String? type) {
  switch (type) {
    case 'GRAVITY':
      return QueryStatusType.gravity;
    case 'FORWARDED':
      return QueryStatusType.forwarded;
    case 'CACHE':
      return QueryStatusType.cache;
    case 'REGEX':
      return QueryStatusType.regex;
    case 'DENYLIST':
      return QueryStatusType.denylist;
    case 'GRAVITY_CNAME':
      return QueryStatusType.gravityCname;
    case 'REGEX_CNAME':
      return QueryStatusType.regexCname;
    case 'DENYLIST_CNAME':
      return QueryStatusType.denylistCname;
    case 'EXTERNAL_BLOCKED_IP':
      return QueryStatusType.externalBlockedIp;
    case 'EXTERNAL_BLOCKED_NULL':
      return QueryStatusType.externalBlockedNull;
    case 'EXTERNAL_BLOCKED_NXRA':
      return QueryStatusType.externalBlockedNxra;
    case 'EXTERNAL_BLOCKED_EDE15':
      return QueryStatusType.externalBlockedEde15;
    case 'RETRIED':
      return QueryStatusType.retried;
    case 'RETRIED_DNSSEC':
      return QueryStatusType.retriedDnssec;
    case 'IN_PROGRESS':
      return QueryStatusType.inProgress;
    case 'DBBUSY':
      return QueryStatusType.dbBusy;
    case 'SPECIAL_DOMAIN':
      return QueryStatusType.specialDomain;
    case 'CACHE_STALE':
      return QueryStatusType.cacheStale;
    case 'UNKNOWN':
      return QueryStatusType.unknown;
    default:
      return QueryStatusType.unknown;
  }
}
