import 'package:flutter/material.dart';
import 'package:pi_hole_client/data2/services/gateways/shared/models/app_screen.dart';
import 'package:pi_hole_client/screens/domains/domains.dart';
import 'package:pi_hole_client/screens/home/home.dart';
import 'package:pi_hole_client/screens/logs/logs.dart';
import 'package:pi_hole_client/screens/servers/servers.dart';
import 'package:pi_hole_client/screens/settings/settings.dart';
import 'package:pi_hole_client/screens/statistics/statistics.dart';

final List<AppScreen> appScreens = [
  const AppScreen(
    icon: Icon(Icons.home),
    name: 'home',
    widget: Home(),
  ),
  const AppScreen(
    icon: Icon(Icons.analytics_rounded),
    name: 'statistics',
    widget: Statistics(),
  ),
  const AppScreen(
    icon: Icon(Icons.list_alt_rounded),
    name: 'logs',
    widget: Logs(),
  ),
  const AppScreen(
    icon: Icon(Icons.shield_rounded),
    name: 'domains',
    widget: DomainLists(),
  ),
  const AppScreen(
    icon: Icon(Icons.settings),
    name: 'settings',
    widget: Settings(),
  ),
];

final List<AppScreen> appScreensNotSelected = [
  const AppScreen(
    icon: Icon(Icons.link_rounded),
    name: 'connect',
    widget: ServersPage(),
  ),
  const AppScreen(
    icon: Icon(Icons.settings),
    name: 'settings',
    widget: Settings(),
  ),
];
