import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class InfoHandler {
  Router get router {
    final router = Router();

    router.get('/ftl', (Request request) {
      final mockResponse = {
        "ftl": {
          "database": {
            "gravity": 67906,
            "groups": 6,
            "lists": 1,
            "clients": 5,
            "domains": {
              "allowed": {"total": 67906, "enabled": 4},
              "denied": {"total": 4, "enabled": 2},
            },
            "regex": {
              "allowed": {"total": 67906, "enabled": 4},
              "denied": {"total": 10, "enabled": 2},
            },
          },
          "privacy_level": 0,
          "query_frequency": 1.1,
          "clients": {"total": 10, "active": 8},
          "pid": 1234,
          "uptime": 123456789,
          "%mem": 0.1,
          "%cpu": 1.2,
          "allow_destructive": true,
          "dnsmasq": {
            "dns_cache_inserted": 8,
            "dns_cache_live_freed": 0,
            "dns_queries_forwarded": 2,
            "dns_auth_answered": 0,
            "dns_local_answered": 74,
            "dns_stale_answered": 0,
            "dns_unanswered": 0,
            "bootp": 0,
            "pxe": 0,
            "dhcp_ack": 0,
            "dhcp_decline": 0,
            "dhcp_discover": 0,
            "dhcp_inform": 0,
            "dhcp_nak": 0,
            "dhcp_offer": 0,
            "dhcp_release": 0,
            "dhcp_request": 0,
            "noanswer": 0,
            "leases_allocated_4": 0,
            "leases_pruned_4": 0,
            "leases_allocated_6": 0,
            "leases_pruned_6": 0,
            "tcp_connections": 0,
            "dhcp_leasequery": 0,
            "dhcp_lease_unassigned": 0,
            "dhcp_lease_actve": 0,
            "dhcp_lease_unknown": 0,
            "dnssec_max_crypto_use": 0,
            "dnssec_max_sig_fail": 0,
            "dnssec_max_work": 0,
          },
        },
        "took": 0.003,
      };

      return Response.ok(
        jsonEncode(mockResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.get('/host', (Request request) {
      final mockResponse = {
        "host": {
          "uname": {
            "domainname": "(none)",
            "machine": "aarch64",
            "nodename": "berry",
            "release": "6.6.74+rpt-rpi-v8",
            "sysname": "Linux",
            "version": "#1 SMP PREEMPT Debian 1:6.6.74-1+rpt1 (2025-01-27)",
          },
          "model": "Raspberry Pi 4 Model B Rev 1.5",
          "dmi": {
            "bios": {"vendor": null},
            "board": {"name": null, "vendor": null, "version": null},
            "product": {"name": null, "family": null, "version": null},
            "sys": {"vendor": null},
          },
        },
        "took": 0.0003502368927001953,
      };

      return Response.ok(
        jsonEncode(mockResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.get('/sensors', (Request request) {
      final mockResponse = {
        "sensors": {
          "list": [
            {
              "name": "cpu_thermal",
              "path": "hwmon0",
              "source": "devices/virtual/thermal/thermal_zone0",
              "temps": [
                {
                  "name": null,
                  "value": 36.998,
                  "max": null,
                  "crit": null,
                  "sensor": "temp1",
                },
              ],
            },
            {
              "name": "rpi_volt",
              "path": "hwmon1",
              "source": "devices/platform/soc/soc:firmware/raspberrypi-hwmon",
              "temps": [],
            },
          ],
          "cpu_temp": 36.998,
          "hot_limit": 60,
          "unit": "C",
        },
        "took": 0.0007462501525878906,
      };

      return Response.ok(
        jsonEncode(mockResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.get('/system', (Request request) {
      final mockResponse = {
        "system": {
          "uptime": 617786,
          "memory": {
            "ram": {
              "total": 3881892,
              "free": 1160728,
              "used": 321660,
              "available": 3469708,
              "%used": 8.2861656120263,
            },
            "swap": {"total": 204796, "free": 204796, "used": 0, "%used": 0},
          },
          "procs": 477,
          "cpu": {
            "nprocs": 4,
            "%cpu": 0.8006004691123962,
            "load": {
              "raw": [0.05078125, 0.076171875, 0.02587890625],
              "percent": [1.26953125, 1.904296875, 0.64697265625],
            },
          },
        },
        "took": 0.0003943443298339844,
      };

      return Response.ok(
        jsonEncode(mockResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.get('/version', (Request request) {
      final mockResponse = {
        "version": {
          "core": {
            "local": {
              "version": "v6.0.6",
              "branch": "master",
              "hash": "0f7803b7",
            },
            "remote": {"version": "v6.0.6", "hash": "0f7803b7"},
          },
          "web": {
            "local": {
              "version": "v6.1",
              "branch": "master",
              "hash": "1eaddca8",
            },
            "remote": {"version": "v6.1", "hash": "1eaddca8"},
          },
          "ftl": {
            "local": {
              "hash": "a3313229",
              "branch": "master",
              "version": "v6.1",
              "date": "2025-03-30 17:53:24 +0100",
            },
            "remote": {"version": "v6.1", "hash": "a3313229"},
          },
          "docker": {"local": null, "remote": null},
        },
        "took": 0.00012445449829101562,
      };

      return Response.ok(
        jsonEncode(mockResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.get('/messages', (Request request) {
      final mockResponse = {
        "messages": [
          {
            "id": 128,
            "timestamp": 1744069550,
            "type": "DNSMASQ_WARN",
            "plain":
                "WARNING in dnsmasq core: ignoring query from non-local network 169.254.233.130 (logged only once)",
            "html":
                "Warning in <code>dnsmasq</code> core:<pre>ignoring query from non-local network 169.254.233.130 (logged only once)</pre>Check out <a href=\"https://docs.pi-hole.net/ftldns/dnsmasq_warn/\" target=\"_blank\">our documentation</a> for further information.",
          },
          {
            "id": 130,
            "timestamp": 1744154131,
            "type": "NTP",
            "plain":
                "Warning NTP client: No valid NTP replies received, check server and network connectivity",
            "html":
                "Warning in NTP client:<pre>No valid NTP replies received, check server and network connectivity</pre>",
          },
          {
            "id": 131,
            "timestamp": 1744481022,
            "type": "CONNECTION_ERROR",
            "plain":
                "Connection error (127.0.0.1#5335): TCP connection failed while receiving payload length from upstream (Connection prematurely closed by remote server)",
            "html":
                "Connection error (<strong>127.0.0.1#5335</strong>): TCP connection failed while receiving payload length from upstream (<strong>Connection prematurely closed by remote server</strong>)",
          },
        ],
        "took": 0.003072500228881836,
      };

      return Response.ok(
        jsonEncode(mockResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.get('/metrics', (Request request) {
      final mockResponse = {
        'metrics': {
          'dns': {
            'cache': {
              'size': 10000,
              'inserted': 4060,
              'evicted': 0,
              'expired': 0,
              'immortal': 0,
              'content': [
                {
                  'type': 0,
                  'name': 'OTHER',
                  'count': {'valid': 0, 'stale': 0},
                },
                {
                  'type': 1,
                  'name': 'A',
                  'count': {'valid': 14, 'stale': 3},
                },
                {
                  'type': 28,
                  'name': 'AAAA',
                  'count': {'valid': 12, 'stale': 1},
                },
                {
                  'type': 5,
                  'name': 'CNAME',
                  'count': {'valid': 5, 'stale': 3},
                },
                {
                  'type': 43,
                  'name': 'DS',
                  'count': {'valid': 34, 'stale': 21},
                },
                {
                  'type': 48,
                  'name': 'DNSKEY',
                  'count': {'valid': 1, 'stale': 0},
                },
              ],
            },
            'replies': {
              'optimized': 1,
              'local': 84,
              'auth': 0,
              'forwarded': 46,
              'unanswered': 0,
              'sum': 131,
            },
          },
          'dhcp': {
            'ack': 0,
            'nak': 0,
            'decline': 0,
            'offer': 0,
            'discover': 0,
            'inform': 0,
            'request': 0,
            'release': 0,
            'noanswer': 0,
            'bootp': 0,
            'pxe': 0,
            'leases': {
              'allocated_4': 0,
              'pruned_4': 0,
              'allocated_6': 0,
              'pruned_6': 0,
            },
          },
        },
        'took': 0.003,
      };

      return Response.ok(
        jsonEncode(mockResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.get('/client', (Request request) {
      final mockResponse = {
        "remote_addr": "192.168.1.51",
        "http_version": "1.1",
        "method": "GET",
        "headers": [
          {"name": "Accept", "value": "application/json"},
          {"name": "Connection", "value": "keep-alive"},
          {"name": "Pragma", "value": "no-cache"},
        ],
        "took": 0.003,
      };

      return Response.ok(
        jsonEncode(mockResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    return router;
  }
}
