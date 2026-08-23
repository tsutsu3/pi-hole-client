import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/utils/widget_channel.dart';

/// Captures the calls `WidgetChannel` makes on the `pihole/widget` channel.
///
/// `WidgetChannel` only sends on Android, so [init] also flips its
/// test-only support switch. Call [dispose] in `tearDown`.
class FakeWidgetChannel {
  static const _channel = MethodChannel('pihole/widget');

  final List<MethodCall> _calls = <MethodCall>[];

  /// When true every call fails, so callers can test the error path.
  bool shouldThrow = false;

  /// The sid of every `sidUpdated` push, in order. Assert on this so every
  /// test checks the pushes the same way.
  List<String> get sidUpdates => _calls
      .where((c) => c.method == 'sidUpdated')
      .map((c) => (c.arguments as Map)['sid'] as String)
      .toList();

  void init() {
    TestWidgetsFlutterBinding.ensureInitialized();
    WidgetChannel.debugIsSupportedOverride = true;

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_channel, (call) async {
          _calls.add(call);
          if (shouldThrow) {
            throw PlatformException(code: 'fake_error');
          }
          return null;
        });
  }

  void dispose() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_channel, null);
    WidgetChannel.debugIsSupportedOverride = null;
    _calls.clear();
    shouldThrow = false;
  }
}
