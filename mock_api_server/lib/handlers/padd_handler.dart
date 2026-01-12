import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class PaddHandler {
  Router get router {
    final router = Router();

    router.get('/', (Request request) {
      // Note: Pi-hole v6 supports `GET /api/padd` with optional `?full=true|false`.
      // For the mock server we always return the same stable dummy payload so the
      // UI can be tested deterministically.
      final mockResponse = {
        "recent_blocked": "bad.example.com",
        "top_domain": "good.example.com",
        "top_blocked": "bad.example.com",
        "top_client": "localhost",
        "active_clients": 22,
        "gravity_size": 225382,
        "blocking": "enabled",
        "queries": {"total": 92258, "blocked": 4784, "percent_blocked": 5.18},
        "cache": {"size": 10000, "inserted": 233, "evicted": 0},
        "iface": {
          "v4": {
            "addr": "192.168.2.11",
            "rx_bytes": {"value": 76.46, "unit": "G"},
            "tx_bytes": {"value": 68.58, "unit": "G"},
            "num_addrs": 1,
            "name": "eth0",
            "gw_addr": "192.168.2.1",
          },
          "v6": {
            "addr": "fe80::b0e4:1b1e:7b7d:5855",
            "num_addrs": 3,
            "name": "eth0",
            "gw_addr": "fe80::b0e4:1b1e:7b7d:1b1e",
          },
        },
        "node_name": "pihole",
        "host_model": "Raspberry Pi 3 Model B Plus Rev 1.3",
        "config": {
          "dhcp_active": true,
          "dhcp_start": "192.168.0.1",
          "dhcp_end": "192.168.0.254",
          "dhcp_ipv6": false,
          "dns_domain": "lan",
          "dns_port": 53,
          "dns_num_upstreams": 1,
          "dns_dnssec": true,
          "dns_revServer_active": false,
          "privacy_level": 0,
        },
        "%cpu": 0,
        "%mem": 1.5,
        "pid": 1639,
        "sensors": {"cpu_temp": 45, "hot_limit": 80, "unit": "C"},
        "system": {
          "uptime": 67906,
          "memory": {
            "ram": {
              "total": 10317877,
              "free": 308736,
              "used": 8920416,
              "available": 972304,
              "%used": 26.854,
            },
            "swap": {
              "total": 10317877,
              "used": 8920416,
              "free": 308736,
              "%used": 1.67,
            },
          },
          "procs": 1452,
          "cpu": {
            "nprocs": 8,
            "%cpu": 0,
            "load": {
              "raw": [0.58837890625, 0.64990234375, 0.66748046875],
              "percent": [
                4.903157711029053,
                5.415853023529053,
                5.562337398529053,
              ],
            },
          },
          "ftl": {"%mem": 0.1, "%cpu": 1.2},
        },
        "version": {
          "core": {
            "local": {
              "branch": "development",
              "version": "v6.1",
              "hash": "955e36a9",
            },
            "remote": {"version": "v6.1", "hash": "955e36a9"},
          },
          "web": {
            "local": {"branch": "devel", "version": "v6.1", "hash": "f69f7e88"},
            "remote": {"version": "v6.1", "hash": "f69f7e88"},
          },
          "ftl": {
            "local": {
              "branch": "development",
              "version": "v6.1",
              "hash": "64441ed6-dirty",
              "date": "2023-01-09 20:25:24 +0100",
            },
            "remote": {"version": "v6.1", "hash": "64441ed6"},
          },
          "docker": {"local": "v6.1", "remote": "v6.1"},
        },
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
