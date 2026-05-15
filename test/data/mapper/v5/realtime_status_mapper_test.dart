import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/v5/realtime_status_mapper.dart';
import 'package:pi_hole_client/data/model/v5/realtime_status.dart' as s;
import 'package:pi_hole_client/domain/model/enums.dart';

const _queryTypes = s.QueryTypes(
  a: 60.0,
  aaaa: 20.0,
  any: 0.0,
  srv: 0.0,
  soa: 0.0,
  ptr: 5.0,
  txt: 2.0,
  naptr: 0.0,
  mx: 0.0,
  ds: 0.0,
  rrsig: 0.0,
  dnskey: 0.0,
  ns: 3.0,
  other: 0.0,
  svcb: 0.0,
  https: 10.0,
);

const _gravity = s.GravityLastUpdated(
  fileExists: true,
  absolute: 1700000000,
  relative: s.GravityRelativeTime(days: 1, hours: 2, minutes: 30),
);

const _source = s.RealTimeStatus(
  domainsBeingBlocked: 100000,
  dnsQueriesToday: 5000,
  adsBlockedToday: 500,
  adsPercentageToday: 10.0,
  uniqueDomains: 300,
  queriesForwarded: 3000,
  queriesCached: 1500,
  clientsEverSeen: 10,
  uniqueClients: 8,
  dnsQueriesAllTypes: 5000,
  replyUnknown: 1,
  replyNodata: 2,
  replyNxDomain: 3,
  replyCname: 4,
  replyIp: 5,
  replyDomain: 6,
  replyRrname: 7,
  replyServfail: 8,
  replyRefused: 9,
  replyNotimp: 10,
  replyOther: 11,
  replyDnssec: 12,
  replyNone: 13,
  replyBlob: 14,
  dnsQueriesAllReplies: 4990,
  privacyLevel: 0,
  status: 'enabled',
  gravityLastUpdated: _gravity,
  topQueries: {'example.com': 100, 'google.com': 50},
  topAds: {'ads.com': 30},
  topSources: {'192.168.1.1': 200, '192.168.1.2': 100},
  topSourcesBlocked: {'192.168.1.3': 10},
  forwardDestinations: {'upstream1': 75.0, 'upstream2': 25.0},
  queryTypes: _queryTypes,
);

void main() {
  group('RealTimeStatusMapper (v5)', () {
    test('maps summary fields correctly', () {
      final domain = _source.toDomain();

      expect(domain.summary.domainsBeingBlocked, 100000);
      expect(domain.summary.dnsQueriesToday, 5000);
      expect(domain.summary.adsBlockedToday, 500);
      expect(domain.summary.adsPercentageToday, 10.0);
      expect(domain.summary.uniqueDomains, 300);
      expect(domain.summary.queriesForwarded, 3000);
      expect(domain.summary.queriesCached, 1500);
      expect(domain.summary.clientsEverSeen, 10);
      expect(domain.summary.uniqueClients, 8);
      expect(domain.summary.dnsQueriesAllTypes, 5000);
    });

    test('maps reply counts correctly', () {
      final replies = _source.toDomain().summary.replies;

      expect(replies.unknown, 1);
      expect(replies.nodata, 2);
      expect(replies.nxDomain, 3);
      expect(replies.cname, 4);
      expect(replies.ip, 5);
      expect(replies.domain, 6);
      expect(replies.rrname, 7);
      expect(replies.servfail, 8);
      expect(replies.refused, 9);
      expect(replies.notimp, 10);
      expect(replies.other, 11);
      expect(replies.dnssec, 12);
      expect(replies.none, 13);
      expect(replies.blob, 14);
      expect(replies.total, 4990);
    });

    test('maps status to DnsBlockingStatus.enabled', () {
      final domain = _source.toDomain();
      expect(domain.status, DnsBlockingStatus.enabled);
    });

    test('maps status to DnsBlockingStatus.disabled', () {
      const src = s.RealTimeStatus(
        domainsBeingBlocked: 0,
        dnsQueriesToday: 0,
        adsBlockedToday: 0,
        adsPercentageToday: 0,
        uniqueDomains: 0,
        queriesForwarded: 0,
        queriesCached: 0,
        clientsEverSeen: 0,
        uniqueClients: 0,
        dnsQueriesAllTypes: 0,
        replyUnknown: 0,
        replyNodata: 0,
        replyNxDomain: 0,
        replyCname: 0,
        replyIp: 0,
        replyDomain: 0,
        replyRrname: 0,
        replyServfail: 0,
        replyRefused: 0,
        replyNotimp: 0,
        replyOther: 0,
        replyDnssec: 0,
        replyNone: 0,
        replyBlob: 0,
        dnsQueriesAllReplies: 0,
        privacyLevel: 0,
        status: 'disabled',
        gravityLastUpdated: _gravity,
        topQueries: {},
        topAds: {},
        topSources: {},
        topSourcesBlocked: {},
        forwardDestinations: {},
        queryTypes: _queryTypes,
      );
      expect(src.toDomain().status, DnsBlockingStatus.disabled);
    });

    test('maps topDomains correctly', () {
      final topDomains = _source.toDomain().topDomains;

      expect(topDomains.topQueries.length, 2);
      expect(topDomains.topQueries[0].domain, 'example.com');
      expect(topDomains.topQueries[0].count, 100);
      expect(topDomains.topAds.length, 1);
      expect(topDomains.topAds[0].domain, 'ads.com');
    });

    test('maps topClients correctly', () {
      final topClients = _source.toDomain().topClients;

      expect(topClients.topSources.length, 2);
      expect(topClients.topSources[0].source, '192.168.1.1');
      expect(topClients.topSources[0].count, 200);
      expect(topClients.topSourcesBlocked.length, 1);
      expect(topClients.topSourcesBlocked[0].source, '192.168.1.3');
    });

    test('maps forwardDestinations correctly', () {
      final fwd = _source.toDomain().forwardDestinations;

      expect(fwd.length, 2);
      expect(fwd[0].destination, 'upstream1');
      expect(fwd[0].percentage, 75.0);
    });

    test('maps queryTypes to list of 16 entries', () {
      final types = _source.toDomain().summary.queryTypes;

      expect(types.length, 16);
      expect(types[0].type, DnsRecordType.a);
      expect(types[0].percentage, 60.0);
      expect(types[1].type, DnsRecordType.aaaa);
      expect(types[1].percentage, 20.0);
      expect(types[15].type, DnsRecordType.https);
      expect(types[15].percentage, 10.0);
    });

    test('empty maps produce empty lists', () {
      final src = _source.copyWith(
        topQueries: {},
        topAds: {},
        topSources: {},
        topSourcesBlocked: {},
        forwardDestinations: {},
      );
      final domain = src.toDomain();

      expect(domain.topDomains.topQueries, isEmpty);
      expect(domain.topDomains.topAds, isEmpty);
      expect(domain.topClients.topSources, isEmpty);
      expect(domain.topClients.topSourcesBlocked, isEmpty);
      expect(domain.forwardDestinations, isEmpty);
    });
  });
}
