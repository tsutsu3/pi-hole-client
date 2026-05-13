import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

Future<void> openUrl(String url) async {
  final uri = Uri.parse(url);
  try {
    await url_launcher.launchUrl(
      uri,
      mode: url_launcher.LaunchMode.externalApplication,
    );
  } catch (e, stackTrace) {
    await Sentry.captureException(e, stackTrace: stackTrace);
  }
}
