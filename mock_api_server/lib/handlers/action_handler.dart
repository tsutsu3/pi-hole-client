import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ActionHandler {
  Router get router {
    final router = Router();

    router.post('/gravity', (Request request) {
      const rawText = r'''
[K  [✓] DNS resolution is available

  [i] Neutrino emissions detected...

  [i] Preparing new gravity database...
[K  [✓] Preparing new gravity database
  [i] Creating new gravity databases...
[K  [✓] Creating new gravity databases

[K  [✓] Pulling blocklist source list into range
  [i] Using libz compression

  [i] Target: https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
  [i] Status: Pending...
[K  [✓] Status: No changes detected

  [✓] Parsed 135865 exact domains and 0 ABP-style domains (blocking, ignored 0 non-domain entries)

  [i] Target: https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt
  [i] Status: Pending...
[K  [✓] Status: No changes detected

  [✓] Parsed 0 exact domains and 104644 ABP-style domains (blocking, ignored 714 non-domain entries)
      Sample of non-domain entries:
        - ||st-n.ads*-adnow.com^
        - ||reachableads-av.*.amazonaws.com^
        - /^139\.45\.197\.2(4
        - ||ads.livetv*.me^
        - ||counter*.stat.ovh^

  [i] Target: https://adaway.org/hosts.txt
  [i] Status: Pending...
[K  [✓] Status: No changes detected

  [✓] Parsed 6540 exact domains and 0 ABP-style domains (blocking, ignored 0 non-domain entries)

  [i] Target: https://raw.githubusercontent.com/mhxion/pornaway/master/hosts/porn_ads.txt
  [i] Status: Pending...
[K  [✓] Status: No changes detected

  [✓] Parsed 799 exact domains and 0 ABP-style domains (blocking, ignored 0 non-domain entries)

  [i] Target: https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Shock
  [i] Status: Pending...
[K  [✓] Status: No changes detected

  [✓] Parsed 98 exact domains and 0 ABP-style domains (blocking, ignored 0 non-domain entries)

  [i] Target: https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/j.txt
  [i] Status: Pending...
[K  [✓] Status: No changes detected

  [✓] Parsed 478 exact domains and 0 ABP-style domains (blocking, ignored 0 non-domain entries)

  [i] Target: https://raw.githubusercontent.com/columndeeply/hosts/main/hosts04
  [i] Status: Pending...
[K  [✓] Status: No changes detected

  [i] Processed 5% of downloaded list
  [i] Processed 10% of downloaded list
  [i] Processed 15% of downloaded list
  [i] Processed 20% of downloaded list
  [i] Processed 25% of downloaded list
  [i] Processed 30% of downloaded list
  [i] Processed 35% of downloaded list
  [i] Processed 40% of downloaded list
  [i] Processed 45% of downloaded list
  [i] Processed 50% of downloaded list
  [i] Processed 55% of downloaded list
  [i] Processed 60% of downloaded list
  [i] Processed 65% of downloaded list
  [i] Processed 70% of downloaded list
  [i] Processed 75% of downloaded list
  [i] Processed 80% of downloaded list
  [i] Processed 85% of downloaded list
  [i] Processed 90% of downloaded list
  [i] Processed 95% of downloaded list
  [✓] Parsed 2215085 exact domains and 0 ABP-style domains (blocking, ignored 21 non-domain entries)
      Sample of non-domain entries:
        - v\xc3\xaddeos
        - x..
        - tags
        - www.xvideos-espa\xc3\xb1ol.com
        - www.\xd8\xa7\xd9\x81\xd9\x84\xd8\xa7\xd9\x85-\xd8\xb3\xd9\x83\xd8\xb3.com

  [i] Target: https://raw.githubusercontent.com/chadmayfield/my-pihole-blocklists/master/lists/pi_blocklist_porn_top1m.list
  [i] Status: Pending...
[K  [✓] Status: No changes detected

  [✓] Parsed 11868 exact domains and 0 ABP-style domains (blocking, ignored 0 non-domain entries)

  [i] Target: https://example.com
  [i] Status: Pending...
[K  [✓] Status: No changes detected

  [✓] Parsed 0 exact domains and 0 ABP-style domains (blocking, ignored 42 non-domain entries)
      Sample of non-domain entries:
        - <
        - domain</title>
        - />
        - type="text/css">
        - {

  [i] Target: http://localhost:8989/test.txt
  [i] Status: Pending...
[K  [✗] Status: Connection Refused
  [✗] List download failed: no cached list available

  [i] Target: http://localhost:80/ok.txt
  [i] Status: Pending...
[K  [✗] Status: Not found
  [✗] List download failed: no cached list available

  [i] Building tree...
[K  [✓] Building tree
  [i] Number of gravity domains: 2475377 (2432522 unique domains)
  [i] Number of exact denied domains: 1
  [i] Number of regex denied filters: 0
  [i] Number of exact allowed domains: 1
  [i] Number of regex allowed filters: 0
  [i] Optimizing database...
[K  [✓] Optimizing database
  [i] Swapping databases...
[K  [✓] Swapping databases
  [✓] The old database remains available
  [i] Cleaning up stray matter...
[K  [✓] Cleaning up stray matter

  [✓] Done.''';

      final cleanText = rawText.trimRight();
      final stream = Stream.value(cleanText);

      return Response.ok(
        utf8.encoder.bind(stream),
        headers: {'content-type': 'text/plain'},
      );
    });

    router.post('/flush/arp', (Request request) {
      final response = {'status': 'success', 'took': 0.003};

      return Response.ok(
        jsonEncode(response),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.post('/flush/logs', (Request request) {
      final response = {'status': 'success', 'took': 0.003};

      return Response.ok(
        jsonEncode(response),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.post('/restartdns', (Request request) {
      final response = {'status': 'success', 'took': 0.003};

      return Response.ok(
        jsonEncode(response),
        headers: {'Content-Type': 'application/json'},
      );
    });

    return router;
  }
}
