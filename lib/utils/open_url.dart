import 'dart:io';

import 'package:flutter_custom_tabs/flutter_custom_tabs.dart'
    as flutter_custom_tabs;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

/// Opens the given [url] using the appropriate method based on the platform and [externalBrowser] flag.
///
/// If [externalBrowser] is `true`, the URL is opened in the device's external browser using `url_launcher`.
/// Otherwise, on Android and iOS, the URL is opened using custom tabs (Android) or Safari View Controller (iOS)
/// with specific options for sharing, title display, and bar collapsing. On other platforms, the URL is opened
/// using `url_launcher`.
///
/// Any exceptions thrown during the process are captured and reported to Sentry.
///
/// - [url]: The URL to open.
/// - [externalBrowser]: If `true`, forces opening the URL in an external browser. Defaults to `false`.
///
/// Example:
/// ```dart
/// await openUrl('https://example.com', externalBrowser: true);
/// ```
Future<void> openUrl(String url, {bool externalBrowser = false}) async {
  final uri = Uri.parse(url);
  try {
    if (externalBrowser) {
      await url_launcher.launchUrl(
        uri,
        mode: url_launcher.LaunchMode.externalApplication,
      );
      return;
    }

    if (Platform.isAndroid || Platform.isIOS) {
      await flutter_custom_tabs.launchUrl(
        uri,
        customTabsOptions: const flutter_custom_tabs.CustomTabsOptions(
          shareState: flutter_custom_tabs.CustomTabsShareState.browserDefault,
          urlBarHidingEnabled: true,
          showTitle: true,
        ),
        safariVCOptions: const flutter_custom_tabs.SafariViewControllerOptions(
          barCollapsingEnabled: true,
          dismissButtonStyle:
              flutter_custom_tabs.SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } else {
      await url_launcher.launchUrl(uri);
    }
  } catch (e, stackTrace) {
    await Sentry.captureException(e, stackTrace: stackTrace);
  }
}
