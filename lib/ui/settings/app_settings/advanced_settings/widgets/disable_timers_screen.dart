import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
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

/// Settings > App settings > Advanced settings > Disable timers.
///
/// Sets the timed options of the disable menu.
class DisableTimersScreen extends StatefulWidget {
  const DisableTimersScreen({super.key});

  @override
  State<DisableTimersScreen> createState() => _DisableTimersScreenState();
}

class _DisableTimersScreenState extends State<DisableTimersScreen> {
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

  /// Error to show under option [i]: out of range, or the same time as an
  /// earlier option. Null when the option is fine.
  String? _error(int i, AppLocalizations loc) {
    final seconds = _seconds(i);
    if (seconds == null) return loc.disableDurationInvalid;
    for (var j = 0; j < i; j++) {
      if (_seconds(j) == seconds) return loc.disableDurationDuplicate;
    }
    return null;
  }

  bool get _allValid {
    final entries = _entries;
    return entries.every((s) => s != null) &&
        entries.toSet().length == entries.length;
  }

  /// Current entries, in seconds (null where not valid).
  List<int?> get _entries => List.generate(DisableDurations.count, _seconds);

  Future<void> _save() async {
    final entries = _entries;
    final durations = entries.cast<int>().toList()..sort();
    final appConfig = context.read<AppConfigViewModel>();
    final loc = AppLocalizations.of(context);
    final ok = await appConfig.setDisableDurations(durations);
    if (!mounted) return;
    if (ok) {
      // Show the saved (sorted) values, unless the user changed the form
      // while saving: then keep their edits.
      if (listEquals(_entries, entries)) setState(() => _fill(durations));
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
                errorText: _error(i, loc),
                errorMaxLines: 2,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          _unitMenu(
            id: 'disableDurationUnit$i',
            unit: _units[i],
            onSelected: (unit) => setState(() => _units[i] = unit),
            loc: loc,
          ),
        ],
      ),
    );
  }

  /// Time unit picker, as tall as the text field next to it.
  Widget _unitMenu({
    required String id,
    required _TimeUnit unit,
    required ValueChanged<_TimeUnit> onSelected,
    required AppLocalizations loc,
  }) {
    return DropdownMenu<_TimeUnit>(
      // A new key when the unit changes from code (e.g. after saving), so
      // the menu shows it: initialSelection is read only once.
      key: ValueKey('$id-${unit.name}'),
      width: 132,
      initialSelection: unit,
      requestFocusOnTap: false,
      enableSearch: false,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onSelected: (value) {
        if (value != null) onSelected(value);
      },
      dropdownMenuEntries: [
        for (final value in _TimeUnit.values)
          DropdownMenuEntry(value: value, label: _unitLabel(value, loc)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.disableTimers)),
      body: SafeArea(
        child: ListView(
          children: [
            SectionLabel(label: loc.disableMenu),
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
