import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/v5/metrics_mapper.dart';
import 'package:pi_hole_client/data/model/v5/over_time_data.dart' as s;
import 'package:pi_hole_client/data/model/v5/queries.dart' as s;

void main() {
  group('OverTimeDataMapper (v5)', () {
    test('maps all fields correctly', () {
      final source = s.OverTimeData(
        domainsOverTime: {'1700000000': 10, '1700000300': 20},
        adsOverTime: {'1700000000': 2, '1700000300': 5},
        clients: const [
          s.Client(name: 'router', ip: '192.168.1.1'),
          s.Client(name: '', ip: '192.168.1.2'),
        ],
        overTime: {
          '1700000000': [10, 3],
          '1700000300': [20, 5],
        },
      );

      final domain = source.toDomain();

      expect(domain.domainsOverTime.length, 2);
      expect(domain.domainsOverTime[0].count, 10);
      expect(
        domain.domainsOverTime[0].timestamp,
        DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000),
      );

      expect(domain.adsOverTime.length, 2);
      expect(domain.adsOverTime[0].count, 2);

      expect(domain.clients.length, 2);
      expect(domain.clients[0].name, 'router');
      expect(domain.clients[0].ip, '192.168.1.1');
      expect(domain.clients[1].name, '');

      expect(domain.clientEntries.length, 2);
      expect(domain.clientEntries[0].values, [10, 3]);
    });
  });

  group('HistoryEntryMapper (v5)', () {
    test('converts timestamp string key to DateTime', () {
      final entry = const MapEntry('1700000000', 42).toDomain();
      expect(
        entry.timestamp,
        DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000),
      );
      expect(entry.count, 42);
    });

    test('handles non-numeric key as 0 timestamp', () {
      final entry = const MapEntry('invalid', 5).toDomain();
      expect(entry.timestamp, DateTime.fromMillisecondsSinceEpoch(0));
    });
  });

  group('ClientMapper (v5)', () {
    test('maps name and ip', () {
      const source = s.Client(name: 'laptop', ip: '10.0.0.5');
      final domain = source.toDomain();
      expect(domain.name, 'laptop');
      expect(domain.ip, '10.0.0.5');
    });
  });

  group('QueriesMapper (v5)', () {
    test('maps list of log entries', () {
      const source = s.Queries(
        data: [
          [
            '1700000000',
            'A',
            'example.com',
            '192.168.1.1',
            '2',
            '',
            '1',
            '15000',
            '',
            '',
            'localhost',
          ],
          [
            '1700000060',
            'AAAA',
            'blocked.com',
            '192.168.1.2',
            '1',
            '',
            '0',
            '0',
          ],
        ],
      );

      final domain = source.toDomain();
      expect(domain.logs.length, 2);
      expect(domain.logs[0].url, 'example.com');
      expect(domain.logs[1].url, 'blocked.com');
    });
  });

  group('LogMapper (v5)', () {
    test('maps all fields correctly', () {
      // index: 0=ts, 1=type, 2=url, 3=device, 4=status, 5=skip,
      //        6=replyIndex, 7=replyTime, 8=skip, 9=skip, 10=answeredBy
      final log = [
        '1700000000',
        'A',
        'example.com',
        '192.168.1.1',
        '2',
        '',
        '1',
        '15000',
        '',
        '',
        'someserver',
      ].toDomain();

      expect(log.url, 'example.com');
      expect(log.device, '192.168.1.1');
      expect(
        log.dateTime,
        DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000),
      );
      expect(log.replyTime, closeTo(1.5, 0.001)); // 15000 / 10000 = 1.5
      expect(log.answeredBy, 'someserver'); // status == '2'
    });

    test('answeredBy is null when status != 2', () {
      final log = [
        '1700000000',
        'A',
        'example.com',
        '192.168.1.1',
        '1',
        '',
        '0',
        '0',
        '',
        '',
        'someserver',
      ].toDomain();
      expect(log.answeredBy, isNull);
    });

    test('handles short array (out-of-bounds safety)', () {
      final log = ['1700000000', 'A', 'example.com'].toDomain();
      expect(log.url, 'example.com');
      expect(log.device, '');
      expect(log.answeredBy, isNull);
      expect(log.replyTime, 0.0);
    });

    test('handles empty array gracefully', () {
      final log = <String>[].toDomain();
      expect(log.url, '');
      expect(log.device, '');
      expect(log.dateTime, DateTime.fromMillisecondsSinceEpoch(0));
    });

    test('handles non-numeric timestamp as epoch 0', () {
      final log = ['not_a_number', 'A', 'test.com'].toDomain();
      expect(log.dateTime, DateTime.fromMillisecondsSinceEpoch(0));
    });
  });
}
