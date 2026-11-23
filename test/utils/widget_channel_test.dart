import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/utils/widget_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('pihole/widget');
  final calls = <MethodCall>[];

  setUp(() {
    calls.clear();
    WidgetChannel.debugIsSupportedOverride = true;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          calls.add(call);
          if (call.method == 'getDisableCooldownRemaining') return 90000;
          return null;
        });
  });

  tearDown(() {
    WidgetChannel.debugIsSupportedOverride = null;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('sendWidgetSettingsUpdated sends both timers', () async {
    await WidgetChannel.sendWidgetSettingsUpdated(
      disableDuration: 3600,
      disableCooldown: 14400,
    );

    expect(calls.single.method, 'widgetSettingsUpdated');
    expect(calls.single.arguments, {
      'disableDuration': 3600,
      'disableCooldown': 14400,
    });
  });

  test('getDisableCooldownRemaining returns the time left', () async {
    final remaining = await WidgetChannel.getDisableCooldownRemaining(
      'http://pi.hole',
    );

    expect(remaining, const Duration(milliseconds: 90000));
    expect(calls.single.arguments, {'serverId': 'http://pi.hole'});
  });

  test('sendDisableRecorded sends the server', () async {
    await WidgetChannel.sendDisableRecorded('http://pi.hole');

    expect(calls.single.method, 'disableRecorded');
    expect(calls.single.arguments, {'serverId': 'http://pi.hole'});
  });

  test('does nothing on platforms without widgets', () async {
    WidgetChannel.debugIsSupportedOverride = false;

    final remaining = await WidgetChannel.getDisableCooldownRemaining(
      'http://pi.hole',
    );
    await WidgetChannel.sendDisableRecorded('http://pi.hole');

    expect(remaining, Duration.zero);
    expect(calls, isEmpty);
  });

  test('getDisableCooldownRemaining is zero when the call fails', () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          throw PlatformException(code: 'error');
        });

    expect(
      await WidgetChannel.getDisableCooldownRemaining('http://pi.hole'),
      Duration.zero,
    );
  });
}
