import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/app/app_log_type.dart';

/// Returns the icon for a log type, which is the name of an [AppLogType].
IconData appLogTypeIcon(String type) {
  return switch (AppLogType.values.asNameMap()[type]) {
    AppLogType.connection => Icons.cloud_off_rounded,
    AppLogType.auth => Icons.lock_rounded,
    AppLogType.session => Icons.key_rounded,
    AppLogType.storage => Icons.sd_card_alert_rounded,
    null => Icons.error_outline_rounded,
  };
}
