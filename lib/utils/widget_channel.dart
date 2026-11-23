import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/utils/logger.dart';

class WidgetChannel {
  static const MethodChannel _channel = MethodChannel('pihole/widget');

  /// Test-only switch for [_isSupported]. Never set outside tests.
  @visibleForTesting
  static bool? debugIsSupportedOverride;

  static bool _isSupported() => debugIsSupportedOverride ?? Platform.isAndroid;

  /// Whether home screen widgets exist on this platform (Android).
  static bool get isSupported => _isSupported();

  static Future<void> sendSidUpdated({
    required String serverAddress,
    required String sid,
  }) async {
    if (!_isSupported()) return;
    try {
      await _channel.invokeMethod('sidUpdated', {
        'serverId': serverAddress,
        'sid': sid,
        'timestamp': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      logger.w('Widget sidUpdated failed: $e');
    }
  }

  static Future<void> sendSidInvalidated({
    required String serverAddress,
  }) async {
    if (!_isSupported()) return;
    try {
      await _channel.invokeMethod('sidInvalidated', {
        'serverId': serverAddress,
      });
    } catch (e) {
      logger.w('Widget sidInvalidated failed: $e');
    }
  }

  static Future<void> sendServersUpdated(List<Server> servers) async {
    if (!_isSupported()) return;
    try {
      final payload = servers
          .map(
            (server) => {
              'serverId': server.address,
              'alias': server.alias,
              'address': server.address,
              'apiVersion': server.apiVersion,
              'allowUntrustedCert': server.allowUntrustedCert,
              'ignoreCertificateErrors': server.ignoreCertificateErrors,
              'pinnedCertificateSha256': server.pinnedCertificateSha256,
            },
          )
          .toList();
      await _channel.invokeMethod('serversUpdated', {'servers': payload});
    } catch (e) {
      logger.w('Widget serversUpdated failed: $e');
    }
  }

  static Future<void> sendServerRemoved(String serverId) async {
    if (!_isSupported()) return;
    try {
      await _channel.invokeMethod('serverRemoved', {'serverId': serverId});
    } catch (e) {
      logger.w('Widget serverRemoved failed: $e');
    }
  }

  /// Moves widgets bound to [oldServerId] over to [newServerId] when a
  /// server's address is changed.
  static Future<void> sendServerReplaced({
    required String oldServerId,
    required String newServerId,
  }) async {
    if (!_isSupported()) return;
    try {
      await _channel.invokeMethod('serverReplaced', {
        'oldServerId': oldServerId,
        'newServerId': newServerId,
      });
    } catch (e) {
      logger.w('Widget serverReplaced failed: $e');
    }
  }

  /// Sends the widget settings from Settings > App settings > Advanced
  /// settings > Disable timers.
  ///
  /// [disableDuration]: how long a disable from a widget lasts, in seconds
  /// (0 = indefinitely).
  /// [disableCooldown]: Pi-hole can be disabled at most once in this time,
  /// in seconds (0 = no limit).
  static Future<void> sendWidgetSettingsUpdated({
    required int disableDuration,
    required int disableCooldown,
  }) async {
    if (!_isSupported()) return;
    try {
      await _channel.invokeMethod('widgetSettingsUpdated', {
        'disableDuration': disableDuration,
        'disableCooldown': disableCooldown,
      });
    } catch (e) {
      logger.w('Widget widgetSettingsUpdated failed: $e');
    }
  }

  /// Time left before Pi-hole on [serverAddress] can be disabled again
  /// (disable limit). [Duration.zero] when allowed or not supported.
  static Future<Duration> getDisableCooldownRemaining(
    String serverAddress,
  ) async {
    if (!_isSupported()) return Duration.zero;
    try {
      final ms = await _channel.invokeMethod<int>(
        'getDisableCooldownRemaining',
        {'serverId': serverAddress},
      );
      return Duration(milliseconds: ms ?? 0);
    } catch (e) {
      logger.w('Widget getDisableCooldownRemaining failed: $e');
      return Duration.zero;
    }
  }

  /// Records that Pi-hole on [serverAddress] was just disabled from the app,
  /// so the disable limit also counts it.
  static Future<void> sendDisableRecorded(String serverAddress) async {
    if (!_isSupported()) return;
    try {
      await _channel.invokeMethod('disableRecorded', {
        'serverId': serverAddress,
      });
    } catch (e) {
      logger.w('Widget disableRecorded failed: $e');
    }
  }

  static Future<void> sendBlockingUpdated({
    required String serverAddress,
  }) async {
    if (!_isSupported()) return;
    try {
      await _channel.invokeMethod('blockingUpdated', {
        'serverId': serverAddress,
        'timestamp': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      logger.w('Widget blockingUpdated failed: $e');
    }
  }

  /// Schedules a widget refresh after [delaySeconds] seconds.
  ///
  /// Used after a timed disable so the widget reflects the server auto
  /// re-enabling blocking once the timer expires, even if the app is closed.
  static Future<void> scheduleBlockingRefresh({
    required String serverAddress,
    required int delaySeconds,
  }) async {
    if (!_isSupported()) return;
    try {
      await _channel.invokeMethod('scheduleBlockingRefresh', {
        'serverId': serverAddress,
        'delaySeconds': delaySeconds,
      });
    } catch (e) {
      logger.w('Widget scheduleBlockingRefresh failed: $e');
    }
  }
}
