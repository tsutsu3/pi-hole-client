import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

/// Opens the given [url] in the user's default external browser.
///
/// Any exceptions thrown during the process are captured and reported to Sentry.
Future<void> openUrl(String url) async {
  try {
    final uri = Uri.parse(url);
    await url_launcher.launchUrl(
      uri,
      mode: url_launcher.LaunchMode.externalApplication,
    );
  } catch (e, stackTrace) {
    await Sentry.captureException(e, stackTrace: stackTrace);
  }
}
