import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v6/v6_session_cache.dart';
import 'package:pi_hole_client/utils/exceptions.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';

void main() {
  late V6SessionCache cache;
  late FakeSessionCredentialService creds;
  late FakePiholeV6ApiClient client;

  setUp(() {
    creds = FakeSessionCredentialService();
    client = FakePiholeV6ApiClient();
    cache = V6SessionCache(creds: creds, client: client);
  });

  // ---------------------------------------------------------------------------
  // getSid
  // ---------------------------------------------------------------------------
  group('getSid', () {
    test('loads from storage on cache miss and returns value', () async {
      final sid = await cache.getSid();
      expect(sid, 'sid123');
    });

    test('returns cached value without hitting storage again', () async {
      await cache.getSid();
      creds.shouldFailRead = true;
      final sid = await cache.getSid();
      expect(sid, 'sid123');
    });

    test('concurrent calls all return the same value', () async {
      final concurrentCreds = FakeSessionCredentialService()
        ..addressSid = 'sid_shared';
      final concurrentCache = V6SessionCache(
        creds: concurrentCreds,
        client: FakePiholeV6ApiClient(),
      );

      final results = await Future.wait([
        concurrentCache.getSid(),
        concurrentCache.getSid(),
        concurrentCache.getSid(),
      ]);
      expect(results, ['sid_shared', 'sid_shared', 'sid_shared']);
    });

    test('throws SidNotFoundException when storage read fails', () async {
      creds.shouldFailRead = true;
      await expectLater(cache.getSid(), throwsA(isA<SidNotFoundException>()));
    });

    test('allows retry after storage read failure', () async {
      creds.shouldFailRead = true;
      await expectLater(cache.getSid(), throwsA(isA<SidNotFoundException>()));

      creds.shouldFailRead = false;
      final sid = await cache.getSid();
      expect(sid, 'sid123');
    });
  });

  // ---------------------------------------------------------------------------
  // saveSid / clearSid
  // ---------------------------------------------------------------------------
  group('saveSid and clearSid', () {
    test('saveSid primes cache so next getSid skips storage', () async {
      await cache.saveSid('sid_new');
      creds.shouldFailRead = true;
      final sid = await cache.getSid();
      expect(sid, 'sid_new');
    });

    test('clearSid forces next getSid to reload from storage', () async {
      await cache.getSid();
      cache.clearSid();
      creds.addressSid = 'sid_reloaded';
      final sid = await cache.getSid();
      expect(sid, 'sid_reloaded');
    });
  });

  // ---------------------------------------------------------------------------
  // clearAndRenewSid
  // ---------------------------------------------------------------------------
  group('clearAndRenewSid', () {
    test('calls postAuth once and clears cache beforehand', () async {
      await cache.getSid();
      await cache.clearAndRenewSid();

      expect(client.postAuthCallCount, 1);
      // After renewal, new SID from kSrvPostAuth is cached.
      creds.shouldFailRead = true;
      final sid = await cache.getSid();
      expect(sid, 'n9n9f6c3umrumfq2ese1lvu2pg');
    });

    test('concurrent calls invoke postAuth exactly once', () async {
      client.authPauseCompleter = Completer<void>();

      final f1 = cache.clearAndRenewSid();
      final f2 = cache.clearAndRenewSid();
      final f3 = cache.clearAndRenewSid();

      client.authPauseCompleter!.complete();
      await Future.wait([f1, f2, f3]);

      expect(client.postAuthCallCount, 1);
    });

    test(
      'second clearAndRenewSid after first completes calls postAuth again',
      () async {
        final noDebounceCache = V6SessionCache(
          creds: creds,
          client: client,
          renewalCooldown: Duration.zero,
        );
        await noDebounceCache.clearAndRenewSid();
        await noDebounceCache.clearAndRenewSid();

        expect(client.postAuthCallCount, 2);
      },
    );

    test('cache stays cleared after postAuth fails', () async {
      client.shouldFail = true;
      await cache.getSid();
      await cache.clearAndRenewSid();

      client.shouldFail = false;
      creds.addressSid = 'sid_after_failure';
      final sid = await cache.getSid();
      expect(sid, 'sid_after_failure');
    });

    test(
      'does not call postAuth and clears cache when password is empty',
      () async {
        creds.addressPassword = '';
        await cache.getSid();
        await cache.clearAndRenewSid();

        expect(client.postAuthCallCount, 0);
        creds.addressSid = 'sid_after_empty_password';
        final sid = await cache.getSid();
        expect(sid, 'sid_after_empty_password');
      },
    );

    test(
      'deleteSid is called before postAuth to prevent stale-SID loop',
      () async {
        await cache.clearAndRenewSid();
        expect(creds.deleteSidCallCount, 1);
      },
    );

    test('deleteSid is called even when postAuth fails', () async {
      client.shouldFail = true;
      await cache.clearAndRenewSid();
      expect(creds.deleteSidCallCount, 1);
    });

    test(
      'rapid call after renewal completes is debounced within cooldown window',
      () async {
        client.authPauseCompleter = Completer<void>();

        final f1 = cache.clearAndRenewSid();
        final f2 = cache.clearAndRenewSid();
        client.authPauseCompleter!.complete();
        await Future.wait([f1, f2]);

        // Immediate call — still within the 500ms cooldown window.
        await cache.clearAndRenewSid();

        expect(client.postAuthCallCount, 1);
      },
    );

    test(
      'second call after cooldown expires invokes postAuth again',
      () async {
        final shortCooldownCache = V6SessionCache(
          creds: creds,
          client: client,
          renewalCooldown: const Duration(milliseconds: 10),
        );
        await shortCooldownCache.clearAndRenewSid();
        await Future<void>.delayed(const Duration(milliseconds: 20));
        await shortCooldownCache.clearAndRenewSid();

        expect(client.postAuthCallCount, 2);
      },
    );
  });
}
