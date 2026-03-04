import 'dart:io';

import 'package:flutter/services.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/utils/logger.dart';

class WidgetChannel {
  static const MethodChannel _channel = MethodChannel('pihole/widget');

  static bool _isSupported() => Platform.isAndroid;

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
              'allowSelfSignedCert': server.allowSelfSignedCert,
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
}
