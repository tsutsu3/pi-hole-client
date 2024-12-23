import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:pi_hole_client/functions/colors.dart';
import 'package:pi_hole_client/models/api/v6/metrics/history.dart';

OverTimeData overTimeDataFromJson(String str) =>
    OverTimeData.fromJson(json.decode(str));

String overTimeDataToJson(OverTimeData data) => json.encode(data.toJson());

/// Over time data (24 hours)
class OverTimeData {
  final Map<String, int> domainsOverTime;
  final Map<String, int> adsOverTime;
  final List<Client> clients;
  final Map<String, List<int>> overTime;

  OverTimeData({
    required this.domainsOverTime,
    required this.adsOverTime,
    required this.clients,
    required this.overTime,
  });

  factory OverTimeData.fromJson(Map<String, dynamic> json) => OverTimeData(
        domainsOverTime:
            (json['domains_over_time'].runtimeType != List<dynamic>)
                ? Map.from(json['domains_over_time'])
                    .map((k, v) => MapEntry<String, int>(k, v))
                : {},
        adsOverTime: (json['ads_over_time'].runtimeType != List<dynamic>)
            ? Map.from(json['ads_over_time'])
                .map((k, v) => MapEntry<String, int>(k, v))
            : {},
        clients:
            List<Client>.from(json['clients'].map((x) => Client.fromJson(x))),
        overTime: (json['over_time'].runtimeType != List<dynamic>)
            ? Map.from(json['over_time']).map(
                (k, v) => MapEntry<String, List<int>>(
                    k, List<int>.from(v.map((x) => x))),
              )
            : {},
      );

  factory OverTimeData.fromV6(History history, HistoryClients historyClients) {
    final domainsOverTime = history.history.isNotEmpty
        ? Map.fromEntries(
            history.history.map(
              (entry) => MapEntry<String, int>(
                entry.timestamp.toInt().toString(),
                entry.total,
              ),
            ),
          )
        : <String, int>{};

    final adsOverTime = history.history.isNotEmpty
        ? Map.fromEntries(
            history.history.map(
              (entry) => MapEntry<String, int>(
                entry.timestamp.toInt().toString(),
                entry.blocked,
              ),
            ),
          )
        : <String, int>{};

    final clients = historyClients.clients.isNotEmpty
        ? historyClients.clients.entries.map((entry) {
            final ip = entry.key;
            final name = entry.value.name ?? ip;

            return Client(
              name: name,
              ip: ip,
              color: generateRandomColor(),
            );
          }).toList()
        : <Client>[];

    final overTimes = historyClients.history.isNotEmpty
        ? Map.fromEntries(
            historyClients.history.map((entry) {
              final timestamp = entry.timestamp.toInt().toString();

              // Sort the data by clients' order
              final sortedData = clients.map((client) {
                final ip = client.ip;
                return entry.data[ip] ?? 0; // Default to 0 if not found
              }).toList();

              return MapEntry<String, List<int>>(timestamp, sortedData);
            }),
          )
        : <String, List<int>>{};

    return OverTimeData(
      domainsOverTime: domainsOverTime,
      adsOverTime: adsOverTime,
      clients: clients,
      overTime: overTimes,
    );
  }

  Map<String, dynamic> toJson() => {
        'domains_over_time': Map.from(domainsOverTime)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'ads_over_time': Map.from(adsOverTime)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'clients': List<dynamic>.from(clients.map((x) => x.toJson())),
        'over_time': Map.from(overTime).map(
          (k, v) =>
              MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x))),
        ),
      };
}

class Client {
  final String name;
  final String ip;
  final Color color;

  Client({
    required this.name,
    required this.ip,
    required this.color,
  });

  factory Client.fromJson(Map<String, dynamic> json) =>
      Client(name: json['name'], ip: json['ip'], color: generateRandomColor());

  Map<String, dynamic> toJson() => {
        'name': name,
        'ip': ip,
        'color': color,
      };
}
