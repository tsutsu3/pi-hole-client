import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/utils/disable_durations.dart';
import 'package:provider/provider.dart';

enum _TimeUnit {
  seconds(1),
  minutes(60),
  hours(3600);

  const _TimeUnit(this.factor);

  /// Seconds in one unit.
  final int factor;

  /// Biggest unit that represents [totalSeconds] exactly.
  static _TimeUnit bestFor(int totalSeconds) {
    if (totalSeconds % hours.factor == 0) return hours;
    if (totalSeconds % minutes.factor == 0) return minutes;
    return seconds;
  }
}

/// Settings > App settings > Timers.
///
/// Sets the timed options of the disable menu.
class TimersScreen extends StatefulWidget {
  const TimersScreen({super.key});

  @override
  State<TimersScreen> createState() => _TimersScreenState();
}

class _TimersScreenState extends State<TimersScreen> {
  final List<TextEditingController> _controllers = List.generate(
    DisableDurations.count,
    (_) => TextEditingController(),
  );
  final List<_TimeUnit> _units = List.filled(
    DisableDurations.count,
    _TimeUnit.seconds,
  );

  @override
  void initState() {
    super.initState();
    _fill(context.read<AppConfigViewModel>().disableDurations);
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _fill(List<int> durations) {
    for (var i = 0; i < DisableDurations.count; i++) {
      final unit = _TimeUnit.bestFor(durations[i]);
      _units[i] = unit;
      _controllers[i].text = (durations[i] ~/ unit.factor).toString();
    }
  }

  /// Duration in seconds of option [i], or null if not valid.
  int? _seconds(int i) {
    final value = int.tryParse(_controllers[i].text.trim());
    if (value == null) return null;
    final seconds = value * _units[i].factor;
    if (seconds < DisableDurations.minSeconds ||
        seconds > DisableDurations.maxSeconds) {
      return null;
    }
    return seconds;
  }

  bool get _allValid =>
      List.generate(DisableDurations.count, _seconds).every((s) => s != null);

  Future<void> _save() async {
    final durations = List.generate(DisableDurations.count, (i) => _seconds(i)!)
      ..sort();
    final appConfig = context.read<AppConfigViewModel>();
    final loc = AppLocalizations.of(context);
    final ok = await appConfig.setDisableDurations(durations);
    if (!mounted) return;
    if (ok) {
      setState(() => _fill(durations));
      showSuccessSnackBar(
        context: context,
        appConfigViewModel: appConfig,
        label: loc.timersSaved,
      );
    } else {
      showErrorSnackBar(
        context: context,
        appConfigViewModel: appConfig,
        label: loc.timersNotSaved,
      );
    }
  }

  String _unitLabel(_TimeUnit unit, AppLocalizations loc) {
    switch (unit) {
      case _TimeUnit.seconds:
        return loc.timeUnitSeconds;
      case _TimeUnit.minutes:
        return loc.timeUnitMinutes;
      case _TimeUnit.hours:
        return loc.timeUnitHours;
    }
  }

  Widget _optionRow(int i, AppLocalizations loc) {
    final valid = _seconds(i) != null;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextField(
              key: Key('disableDuration$i'),
              controller: _controllers[i],
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                labelText: loc.disableMenuOption(i + 1),
                errorText: valid ? null : loc.disableDurationInvalid,
                errorMaxLines: 2,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: DropdownButton<_TimeUnit>(
              value: _units[i],
              onChanged: (unit) {
                if (unit == null) return;
                setState(() => _units[i] = unit);
              },
              items: [
                for (final unit in _TimeUnit.values)
                  DropdownMenuItem(
                    value: unit,
                    child: Text(_unitLabel(unit, loc)),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.timers)),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
              child: Text(
                loc.disableMenu,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                loc.disableMenuDescription,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            for (var i = 0; i < DisableDurations.count; i++) _optionRow(i, loc),
            Padding(
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: _allValid ? _save : null,
                child: Text(loc.save),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
