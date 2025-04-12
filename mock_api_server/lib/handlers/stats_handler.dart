import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class StatsHandler {
  Router get router {
    final router = Router();

    router.get('/summary', (Request request) {
      final mockResponse = {
        "queries": {
          "total": 28169,
          "blocked": 3398,
          "percent_blocked": 12.062906265258789,
          "unique_domains": 10163,
          "forwarded": 9946,
          "cached": 11152,
          "frequency": 0.06666666666666667,
          "types": {
            "A": 17085,
            "AAAA": 3859,
            "ANY": 0,
            "SRV": 0,
            "SOA": 0,
            "PTR": 263,
            "TXT": 7,
            "NAPTR": 0,
            "MX": 0,
            "DS": 2809,
            "RRSIG": 0,
            "DNSKEY": 165,
            "NS": 0,
            "SVCB": 51,
            "HTTPS": 3930,
            "OTHER": 0,
          },
          "status": {
            "UNKNOWN": 43,
            "GRAVITY": 2115,
            "FORWARDED": 9834,
            "CACHE": 5773,
            "REGEX": 0,
            "DENYLIST": 1229,
            "EXTERNAL_BLOCKED_IP": 0,
            "EXTERNAL_BLOCKED_NULL": 0,
            "EXTERNAL_BLOCKED_NXRA": 0,
            "GRAVITY_CNAME": 1,
            "REGEX_CNAME": 0,
            "DENYLIST_CNAME": 2,
            "RETRIED": 112,
            "RETRIED_DNSSEC": 0,
            "IN_PROGRESS": 3630,
            "DBBUSY": 0,
            "SPECIAL_DOMAIN": 51,
            "CACHE_STALE": 5379,
            "EXTERNAL_BLOCKED_EDE15": 0,
          },
          "replies": {
            "UNKNOWN": 1806,
            "NODATA": 5831,
            "NXDOMAIN": 480,
            "CNAME": 6640,
            "IP": 12581,
            "DOMAIN": 127,
            "RRNAME": 0,
            "SERVFAIL": 3,
            "REFUSED": 72,
            "NOTIMP": 0,
            "OTHER": 0,
            "DNSSEC": 241,
            "NONE": 0,
            "BLOB": 388,
          },
        },
        "clients": {"active": 12, "total": 15},
        "gravity": {
          "domains_being_blocked": 3928700,
          "last_update": 1744385569,
        },
        "took": 0.0001239776611328125,
      };

      return Response.ok(
        jsonEncode(mockResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.get('/top_clients', (Request request) {
      final queryParams = request.url.queryParameters;
      final isBlocked = queryParams['blocked'] == 'true';

      final mockResponse = {
        "clients": [
          {"name": "pc.lan", "ip": "192.168.11.6", "count": 18244},
          {"name": "pi.hole", "ip": "::", "count": 2989},
          {"name": "", "ip": "192.168.11.5", "count": 2344},
          {"name": "", "ip": "192.168.11.4", "count": 1122},
          {"name": "", "ip": "192.168.11.7", "count": 969},
          {"name": "sample.lan", "ip": "192.168.11.11", "count": 806},
          {"name": "test.lan", "ip": "192.168.11.1", "count": 571},
          {"name": "berry.lan", "ip": "192.168.11.8", "count": 426},
          {"name": "dummy.lan", "ip": "192.168.11.2", "count": 336},
          {"name": "localhost.lan", "ip": "127.0.0.1", "count": 244},
        ],
        "total_queries": 28249,
        "blocked_queries": 3402,
        "took": 0.00026679039001464844,
      };

      final mockResponseBlocked = {
        "clients": [
          {"name": "pc.lan", "ip": "192.168.11.6", "count": 1171},
          {"name": "", "ip": "192.168.11.11", "count": 822},
          {"name": "", "ip": "192.168.11.7", "count": 681},
          {"name": "test.lan", "ip": "192.168.11.8", "count": 325},
          {"name": "", "ip": "192.168.11.4", "count": 312},
          {"name": "sample.lan", "ip": "192.168.11.5", "count": 54},
          {"name": "dummy.lan", "ip": "192.168.11.2", "count": 37},
        ],
        "total_queries": 28249,
        "blocked_queries": 3402,
        "took": 0.00010895729064941406,
      };

      return Response.ok(
        jsonEncode(isBlocked ? mockResponseBlocked : mockResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.get('/top_domains', (Request request) {
      final queryParams = request.url.queryParameters;
      final isBlocked = queryParams['blocked'] == 'true';

      final mockResponse = {
        "domains": [
          {"domain": "example.com", "count": 483},
          {"domain": "www.google.com", "count": 429},
          {"domain": "test.example.com", "count": 385},
          {"domain": "clientservices.googleapis.com", "count": 370},
          {"domain": "ajax.googleapis.com", "count": 349},
          {"domain": "accounts.google.com", "count": 349},
          {"domain": "mtalk.google.com", "count": 316},
          {"domain": "www.gstatic.com", "count": 291},
          {"domain": "fonts.gstatic.com", "count": 286},
          {"domain": "play.google.com", "count": 282},
        ],
        "total_queries": 28213,
        "blocked_queries": 3402,
        "took": 0.004113197326660156,
      };

      final mockResponseBlocked = {
        "domains": [
          {"domain": "q.smart.360.cn", "count": 681},
          {"domain": "ad-assets.futurecdn.net", "count": 379},
          {"domain": "cdn.auditude.com", "count": 288},
          {"domain": "linux.css2.com", "count": 247},
          {"domain": "g.live.com", "count": 183},
          {"domain": "www.google-analytics.com", "count": 144},
          {"domain": "ssl.googleanalytics.com", "count": 144},
          {"domain": "ms.applovin.com", "count": 144},
          {"domain": "collector.github.com", "count": 115},
          {"domain": "claudfront.net", "count": 94},
        ],
        "total_queries": 28215,
        "blocked_queries": 3402,
        "took": 0.002618551254272461,
      };

      return Response.ok(
        jsonEncode(isBlocked ? mockResponseBlocked : mockResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.get('/upstreams', (Request request) {
      final mockResponse = {
        "upstreams": [
          {
            "ip": "blocklist",
            "name": "blocklist",
            "port": -1,
            "count": 3401,
            "statistics": {"response": 0, "variance": 0},
          },
          {
            "ip": "cache",
            "name": "cache",
            "port": -1,
            "count": 11156,
            "statistics": {"response": 0, "variance": 0},
          },
          {
            "ip": "127.0.0.1",
            "name": "localhost.lan",
            "port": 5335,
            "count": 14166,
            "statistics": {
              "response": 0.1486116932199465,
              "variance": 0.001623786890164493,
            },
          },
        ],
        "total_queries": 28180,
        "forwarded_queries": 9950,
        "took": 0.00009250640869140625,
      };

      return Response.ok(
        jsonEncode(mockResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    return router;
  }
}
