import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/enum_converters.dart';
import 'package:pi_hole_client/domain/model/enums.dart';

void main() {
  // -------------------------------------------------------------------------
  // convertDnsRecordType
  // -------------------------------------------------------------------------

  group('convertDnsRecordType', () {
    test('maps A / A (IPV4) to a', () {
      expect(convertDnsRecordType('A'), DnsRecordType.a);
      expect(convertDnsRecordType('A (IPV4)'), DnsRecordType.a);
    });

    test('maps AAAA / AAAA (IPV6) to aaaa', () {
      expect(convertDnsRecordType('AAAA'), DnsRecordType.aaaa);
      expect(convertDnsRecordType('AAAA (IPV6)'), DnsRecordType.aaaa);
    });

    test('maps common record types', () {
      expect(convertDnsRecordType('ANY'), DnsRecordType.any);
      expect(convertDnsRecordType('SRV'), DnsRecordType.srv);
      expect(convertDnsRecordType('SOA'), DnsRecordType.soa);
      expect(convertDnsRecordType('PTR'), DnsRecordType.ptr);
      expect(convertDnsRecordType('TXT'), DnsRecordType.txt);
      expect(convertDnsRecordType('NAPTR'), DnsRecordType.naptr);
      expect(convertDnsRecordType('MX'), DnsRecordType.mx);
      expect(convertDnsRecordType('HTTPS'), DnsRecordType.https);
      expect(convertDnsRecordType('CNAME'), DnsRecordType.cname);
    });

    test('is case-insensitive', () {
      expect(convertDnsRecordType('a'), DnsRecordType.a);
      expect(convertDnsRecordType('mx'), DnsRecordType.mx);
    });

    test('maps null to unknown', () {
      expect(convertDnsRecordType(null), DnsRecordType.unknown);
    });

    test('maps unrecognized string to unknown', () {
      expect(convertDnsRecordType('BOGUS'), DnsRecordType.unknown);
    });
  });

  // -------------------------------------------------------------------------
  // convertReplyTypeV5
  // -------------------------------------------------------------------------

  group('convertReplyTypeV5', () {
    test('maps all known codes', () {
      expect(convertReplyTypeV5(0), ReplyType.na);
      expect(convertReplyTypeV5(1), ReplyType.nodata);
      expect(convertReplyTypeV5(2), ReplyType.nxdomain);
      expect(convertReplyTypeV5(3), ReplyType.cname);
      expect(convertReplyTypeV5(4), ReplyType.ip);
      expect(convertReplyTypeV5(5), ReplyType.domain);
      expect(convertReplyTypeV5(6), ReplyType.rrname);
      expect(convertReplyTypeV5(7), ReplyType.servfail);
      expect(convertReplyTypeV5(8), ReplyType.refused);
      expect(convertReplyTypeV5(9), ReplyType.notimp);
      expect(convertReplyTypeV5(10), ReplyType.upstreamError);
      expect(convertReplyTypeV5(11), ReplyType.dnssec);
      expect(convertReplyTypeV5(12), ReplyType.none);
      expect(convertReplyTypeV5(13), ReplyType.blob);
    });

    test('maps null to unknown', () {
      expect(convertReplyTypeV5(null), ReplyType.unknown);
    });

    test('maps unrecognized code to unknown', () {
      expect(convertReplyTypeV5(99), ReplyType.unknown);
    });
  });

  // -------------------------------------------------------------------------
  // convertReplyTypeV6
  // -------------------------------------------------------------------------

  group('convertReplyTypeV6', () {
    test('maps all known strings', () {
      expect(convertReplyTypeV6('NA'), ReplyType.na);
      expect(convertReplyTypeV6('NODATA'), ReplyType.nodata);
      expect(convertReplyTypeV6('NXDOMAIN'), ReplyType.nxdomain);
      expect(convertReplyTypeV6('CNAME'), ReplyType.cname);
      expect(convertReplyTypeV6('IP'), ReplyType.ip);
      expect(convertReplyTypeV6('DOMAIN'), ReplyType.domain);
      expect(convertReplyTypeV6('RRNAME'), ReplyType.rrname);
      expect(convertReplyTypeV6('SERVFAIL'), ReplyType.servfail);
      expect(convertReplyTypeV6('REFUSED'), ReplyType.refused);
      expect(convertReplyTypeV6('NOTIMP'), ReplyType.notimp);
      expect(convertReplyTypeV6('UPSTREAM_ERROR'), ReplyType.upstreamError);
      expect(convertReplyTypeV6('DNSSEC'), ReplyType.dnssec);
      expect(convertReplyTypeV6('NONE'), ReplyType.none);
      expect(convertReplyTypeV6('BLOB'), ReplyType.blob);
    });

    test('maps null to unknown', () {
      expect(convertReplyTypeV6(null), ReplyType.unknown);
    });

    test('maps unrecognized string to unknown', () {
      expect(convertReplyTypeV6('BOGUS'), ReplyType.unknown);
    });
  });

  // -------------------------------------------------------------------------
  // convertQueryStatusTypeV5
  // -------------------------------------------------------------------------

  group('convertQueryStatusTypeV5', () {
    test('maps all known codes', () {
      expect(convertQueryStatusTypeV5(1), QueryStatusType.gravity);
      expect(convertQueryStatusTypeV5(2), QueryStatusType.forwarded);
      expect(convertQueryStatusTypeV5(3), QueryStatusType.cache);
      expect(convertQueryStatusTypeV5(4), QueryStatusType.regex);
      expect(convertQueryStatusTypeV5(5), QueryStatusType.denylist);
      expect(convertQueryStatusTypeV5(6), QueryStatusType.externalBlockedIp);
      expect(convertQueryStatusTypeV5(7), QueryStatusType.externalBlockedNull);
      expect(convertQueryStatusTypeV5(8), QueryStatusType.externalBlockedNxra);
      expect(convertQueryStatusTypeV5(9), QueryStatusType.gravityCname);
      expect(convertQueryStatusTypeV5(10), QueryStatusType.regexCname);
      expect(convertQueryStatusTypeV5(11), QueryStatusType.denylistCname);
      expect(convertQueryStatusTypeV5(12), QueryStatusType.retried);
      expect(convertQueryStatusTypeV5(13), QueryStatusType.retriedDnssec);
      expect(convertQueryStatusTypeV5(14), QueryStatusType.inProgress);
      expect(convertQueryStatusTypeV5(15), QueryStatusType.dbBusy);
    });

    test('maps null to unknown', () {
      expect(convertQueryStatusTypeV5(null), QueryStatusType.unknown);
    });

    test('maps unrecognized code to unknown', () {
      expect(convertQueryStatusTypeV5(99), QueryStatusType.unknown);
    });
  });

  // -------------------------------------------------------------------------
  // convertQueryStatusTypeV6
  // -------------------------------------------------------------------------

  group('convertQueryStatusTypeV6', () {
    test('maps all known strings', () {
      expect(convertQueryStatusTypeV6('GRAVITY'), QueryStatusType.gravity);
      expect(convertQueryStatusTypeV6('FORWARDED'), QueryStatusType.forwarded);
      expect(convertQueryStatusTypeV6('CACHE'), QueryStatusType.cache);
      expect(convertQueryStatusTypeV6('REGEX'), QueryStatusType.regex);
      expect(convertQueryStatusTypeV6('DENYLIST'), QueryStatusType.denylist);
      expect(convertQueryStatusTypeV6('GRAVITY_CNAME'), QueryStatusType.gravityCname);
      expect(convertQueryStatusTypeV6('REGEX_CNAME'), QueryStatusType.regexCname);
      expect(convertQueryStatusTypeV6('DENYLIST_CNAME'), QueryStatusType.denylistCname);
      expect(convertQueryStatusTypeV6('EXTERNAL_BLOCKED_IP'), QueryStatusType.externalBlockedIp);
      expect(convertQueryStatusTypeV6('EXTERNAL_BLOCKED_NULL'), QueryStatusType.externalBlockedNull);
      expect(convertQueryStatusTypeV6('EXTERNAL_BLOCKED_NXRA'), QueryStatusType.externalBlockedNxra);
      expect(convertQueryStatusTypeV6('EXTERNAL_BLOCKED_EDE15'), QueryStatusType.externalBlockedEde15);
      expect(convertQueryStatusTypeV6('RETRIED'), QueryStatusType.retried);
      expect(convertQueryStatusTypeV6('RETRIED_DNSSEC'), QueryStatusType.retriedDnssec);
      expect(convertQueryStatusTypeV6('IN_PROGRESS'), QueryStatusType.inProgress);
      expect(convertQueryStatusTypeV6('DBBUSY'), QueryStatusType.dbBusy);
      expect(convertQueryStatusTypeV6('SPECIAL_DOMAIN'), QueryStatusType.specialDomain);
      expect(convertQueryStatusTypeV6('CACHE_STALE'), QueryStatusType.cacheStale);
      expect(convertQueryStatusTypeV6('UNKNOWN'), QueryStatusType.unknown);
    });

    test('maps null to unknown', () {
      expect(convertQueryStatusTypeV6(null), QueryStatusType.unknown);
    });

    test('maps unrecognized string to unknown', () {
      expect(convertQueryStatusTypeV6('BOGUS'), QueryStatusType.unknown);
    });
  });

  // -------------------------------------------------------------------------
  // Extension: toListsStatus
  // -------------------------------------------------------------------------

  group('IntToLListsStatusMapper.toListsStatus', () {
    test('maps valid indexes', () {
      expect(0.toListsStatus(), ListsStatus.notDownloaded);
      expect(1.toListsStatus(), ListsStatus.downloaded);
      expect(2.toListsStatus(), ListsStatus.unchanged);
      expect(3.toListsStatus(), ListsStatus.unavailableCached);
      expect(4.toListsStatus(), ListsStatus.unavailableNoCache);
      expect(5.toListsStatus(), ListsStatus.unknown);
    });

    test('maps out-of-range index to unknown', () {
      expect(99.toListsStatus(), ListsStatus.unknown);
    });
  });

  // -------------------------------------------------------------------------
  // Extension: toDomainType (String)
  // -------------------------------------------------------------------------

  group('StringToDomainTypeMapper.toDomainType', () {
    test('maps allow', () {
      expect('allow'.toDomainType(), DomainType.allow);
    });

    test('maps deny', () {
      expect('deny'.toDomainType(), DomainType.deny);
    });

    test('maps unknown string to allow (default)', () {
      expect('bogus'.toDomainType(), DomainType.allow);
    });
  });

  // -------------------------------------------------------------------------
  // Extension: toDomainKind
  // -------------------------------------------------------------------------

  group('StringToDomainKindMapper.toDomainKind', () {
    test('maps exact', () {
      expect('exact'.toDomainKind(), DomainKind.exact);
    });

    test('maps regex', () {
      expect('regex'.toDomainKind(), DomainKind.regex);
    });

    test('maps unknown string to exact (default)', () {
      expect('bogus'.toDomainKind(), DomainKind.exact);
    });
  });

  // -------------------------------------------------------------------------
  // Extension: DomainType.toV5DomainType + V5DomainType roundtrip
  // -------------------------------------------------------------------------

  group('DomainType → V5DomainType roundtrip', () {
    test('allow+exact → white → allow+exact', () {
      final v5 = DomainType.allow.toV5DomainType(DomainKind.exact);
      expect(v5, V5DomainType.white);
      expect(v5.toDomainType(), DomainType.allow);
      expect(v5.toDomainKind(), DomainKind.exact);
    });

    test('allow+regex → regex_white → allow+regex', () {
      final v5 = DomainType.allow.toV5DomainType(DomainKind.regex);
      expect(v5, V5DomainType.regex_white);
      expect(v5.toDomainType(), DomainType.allow);
      expect(v5.toDomainKind(), DomainKind.regex);
    });

    test('deny+exact → black → deny+exact', () {
      final v5 = DomainType.deny.toV5DomainType(DomainKind.exact);
      expect(v5, V5DomainType.black);
      expect(v5.toDomainType(), DomainType.deny);
      expect(v5.toDomainKind(), DomainKind.exact);
    });

    test('deny+regex → regex_black → deny+regex', () {
      final v5 = DomainType.deny.toV5DomainType(DomainKind.regex);
      expect(v5, V5DomainType.regex_black);
      expect(v5.toDomainType(), DomainType.deny);
      expect(v5.toDomainKind(), DomainKind.regex);
    });
  });

  // -------------------------------------------------------------------------
  // Extension: toBlockingMode
  // -------------------------------------------------------------------------

  group('StringToBlockingModeMapper.toBlockingMode', () {
    test('maps known strings', () {
      expect('NULL'.toBlockingMode(), BlockingMode.nullMode);
      expect('IP_NODATA_AAAA'.toBlockingMode(), BlockingMode.ipNodataAaaa);
      expect('IP'.toBlockingMode(), BlockingMode.ip);
      expect('NX'.toBlockingMode(), BlockingMode.nxdomain);
      expect('NODATA'.toBlockingMode(), BlockingMode.nodata);
    });

    test('maps unknown to unknown', () {
      expect('BOGUS'.toBlockingMode(), BlockingMode.unknown);
    });
  });

  // -------------------------------------------------------------------------
  // Extension: toTemperatureUnit
  // -------------------------------------------------------------------------

  group('StringToTemperatureUnitMapper.toTemperatureUnit', () {
    test('maps C / F / K', () {
      expect('C'.toTemperatureUnit(), TemperatureUnit.celsius);
      expect('F'.toTemperatureUnit(), TemperatureUnit.fahrenheit);
      expect('K'.toTemperatureUnit(), TemperatureUnit.kelvin);
    });

    test('maps unknown to unknown', () {
      expect('X'.toTemperatureUnit(), TemperatureUnit.unknown);
    });
  });

  // -------------------------------------------------------------------------
  // Extension: toListeningMode
  // -------------------------------------------------------------------------

  group('StringToListeningModeMapper.toListeningMode', () {
    test('maps known strings', () {
      expect('LOCAL'.toListeningMode(), ListeningMode.local);
      expect('ALL'.toListeningMode(), ListeningMode.all);
      expect('SINGLE'.toListeningMode(), ListeningMode.single);
      expect('BIND'.toListeningMode(), ListeningMode.bind);
      expect('NONE'.toListeningMode(), ListeningMode.none);
    });

    test('maps unknown to unknown', () {
      expect('BOGUS'.toListeningMode(), ListeningMode.unknown);
    });
  });
}
