import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ListsHandler {
  Router get router {
    final router = Router();

    router.get('/', (Request request) {
      final mockResponse = {
        "lists": [
          {
            "address":
                "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts",
            "comment": "Migrated from /etc/pihole/adlists.list",
            "groups": [0],
            "enabled": true,
            "id": 1,
            "date_added": 1718567751,
            "date_modified": 1744385690,
            "type": "block",
            "date_updated": 1744481762,
            "number": 135865,
            "invalid_domains": 0,
            "abp_entries": 0,
            "status": 1,
          },
          {
            "address":
                "https://raw.githubusercontent.com/Ultimate-Hosts-Blacklist/pl-host-file/master/domains.list",
            "comment": "Oisd Big includes many blocklists",
            "groups": [0],
            "enabled": true,
            "id": 29,
            "date_added": 1730990033,
            "date_modified": 1731059372,
            "type": "block",
            "date_updated": 1739648584,
            "number": 412,
            "invalid_domains": 0,
            "abp_entries": 0,
            "status": 2,
          },
          {
            "address": "https://blocklistproject.github.io/Lists/malware.txt",
            "comment": null,
            "groups": [5],
            "enabled": true,
            "id": 30,
            "date_added": 1730990066,
            "date_modified": 1740562954,
            "type": "block",
            "date_updated": 1739648586,
            "number": 435221,
            "invalid_domains": 0,
            "abp_entries": 0,
            "status": 2,
          },
          {
            "address":
                "https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt",
            "comment": null,
            "groups": [1],
            "enabled": true,
            "id": 33,
            "date_added": 1730990125,
            "date_modified": 1731059372,
            "type": "block",
            "date_updated": 1739648589,
            "number": 242,
            "invalid_domains": 0,
            "abp_entries": 0,
            "status": 2,
          },
          {
            "address":
                "https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Hosts/GoodbyeAds-Ultra.txt",
            "comment": null,
            "groups": [1],
            "enabled": true,
            "id": 35,
            "date_added": 1730990152,
            "date_modified": 1744372868,
            "type": "block",
            "date_updated": 1739648593,
            "number": 459191,
            "invalid_domains": 0,
            "abp_entries": 0,
            "status": 2,
          },
          {
            "address":
                "https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt",
            "comment": null,
            "groups": [1],
            "enabled": true,
            "id": 36,
            "date_added": 1730990168,
            "date_modified": 1731059372,
            "type": "block",
            "date_updated": 1739648595,
            "number": 429286,
            "invalid_domains": 0,
            "abp_entries": 0,
            "status": 2,
          },
          {
            "address":
                "https://raw.githubusercontent.com/notracking/hosts-blocklists/master/adblock/adblock.txt",
            "comment": null,
            "groups": [1],
            "enabled": true,
            "id": 37,
            "date_added": 1730990182,
            "date_modified": 1731059372,
            "type": "block",
            "date_updated": 1739648598,
            "number": 419961,
            "invalid_domains": 0,
            "abp_entries": 419961,
            "status": 2,
          },
          {
            "address": "https://abp.oisd.nl/",
            "comment": null,
            "groups": [0],
            "enabled": true,
            "id": 38,
            "date_added": 1730990284,
            "date_modified": 1744392974,
            "type": "block",
            "date_updated": 1744481778,
            "number": 148832,
            "invalid_domains": 0,
            "abp_entries": 148832,
            "status": 1,
          },
          {
            "address":
                "https://raw.githubusercontent.com/blocklistproject/Lists/master/adguard/smart-tv-ags.txt",
            "comment": null,
            "groups": [1],
            "enabled": true,
            "id": 39,
            "date_added": 1730990362,
            "date_modified": 1731059372,
            "type": "block",
            "date_updated": 1739648602,
            "number": 78,
            "invalid_domains": 0,
            "abp_entries": 78,
            "status": 2,
          },
          {
            "address": "https://v.firebog.net/hosts/neohostsbasic.txt",
            "comment": "Firebog | Non-crossed lists [ph5lt]",
            "groups": [0],
            "enabled": true,
            "id": 55,
            "date_added": 1731060053,
            "date_modified": 1731060053,
            "type": "block",
            "date_updated": 1739648620,
            "number": 2412,
            "invalid_domains": 0,
            "abp_entries": 0,
            "status": 2,
          },
        ],
        "took": 0.00310516357421875,
      };

      return Response.ok(
        jsonEncode(mockResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    return router;
  }
}
