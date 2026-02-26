import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/model/app_screen.dart';

final List<AppScreen> appScreens = [
  const AppScreen(icon: Icon(Icons.home), name: 'home'),
  const AppScreen(icon: Icon(Icons.analytics_rounded), name: 'statistics'),
  const AppScreen(icon: Icon(Icons.list_alt_rounded), name: 'logs'),
  const AppScreen(icon: Icon(Icons.shield_rounded), name: 'domains'),
  const AppScreen(icon: Icon(Icons.settings), name: 'settings'),
];

final List<AppScreen> appScreensNotSelected = [
  const AppScreen(icon: Icon(Icons.link_rounded), name: 'connect'),
  const AppScreen(icon: Icon(Icons.settings), name: 'settings'),
];
