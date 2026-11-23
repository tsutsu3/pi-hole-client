import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/utils/disable_durations.dart';
import 'package:pi_hole_client/utils/widget_channel.dart';
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
/// Sets the timed options of the disable menu and, on Android, how long a
/// disable from a home screen widget lasts and how often Pi-hole can be
/// disabled.
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

  // Widget disable duration (Android only).
  bool _widgetAutoEnable = false;
  final TextEditingController _widgetController = TextEditingController();
  _TimeUnit _widgetUnit = _TimeUnit.hours;

  // Disable limit (Android only).
  bool _limitEnabled = false;
  final TextEditingController _limitController = TextEditingController();
  _TimeUnit _limitUnit = _TimeUnit.hours;

  @override
  void initState() {
    super.initState();
    final appConfig = context.read<AppConfigViewModel>();
    _fill(appConfig.disableDurations);
    _fillWidget(appConfig.widgetDisableDuration);
    _fillLimit(appConfig.disableCooldown);
  }

  void _fillLimit(int seconds) {
    _limitEnabled = seconds > 0;
    final value = seconds > 0 ? seconds : 4 * 3600;
    _limitUnit = _TimeUnit.bestFor(value);
    _limitController.text = (value ~/ _limitUnit.factor).toString();
  }

  /// Disable limit in seconds (0 = no limit), or null if not valid.
  int? get _limitSeconds {
    if (!_limitEnabled) return 0;
    return _toSeconds(
      _limitController.text,
      _limitUnit,
      max: AppConfigViewModel.maxDisableCooldown,
    );
  }

  void _fillWidget(int seconds) {
    _widgetAutoEnable = seconds > 0;
    final value = seconds > 0 ? seconds : 3600;
    _widgetUnit = _TimeUnit.bestFor(value);
    _widgetController.text = (value ~/ _widgetUnit.factor).toString();
  }

  /// Widget disable duration in seconds (0 = indefinitely), or null if the
  /// entered time is not valid.
  int? get _widgetSeconds {
    if (!_widgetAutoEnable) return 0;
    return _toSeconds(_widgetController.text, _widgetUnit);
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    _widgetController.dispose();
    _limitController.dispose();
    super.dispose();
  }

  void _fill(List<int> durations) {
    for (var i = 0; i < DisableDurations.count; i++) {
      final unit = _TimeUnit.bestFor(durations[i]);
      _units[i] = unit;
      _controllers[i].text = (durations[i] ~/ unit.factor).toString();
    }
  }

  /// Digits allowed in a duration field: enough for the largest value.
  static const _maxDigits = '${DisableDurations.maxSeconds}'.length;

  /// Duration in seconds of option [i], or null if not valid.
  int? _seconds(int i) => _toSeconds(_controllers[i].text, _units[i]);

  int? _toSeconds(
    String text,
    _TimeUnit unit, {
    int max = DisableDurations.maxSeconds,
  }) {
    final value = int.tryParse(text.trim());
    if (value == null) return null;
    // Compare before multiplying, so a huge number cannot overflow.
    if (value > DisableDurations.maxSeconds ~/ unit.factor) return null;
    final seconds = value * unit.factor;
    if (seconds < DisableDurations.minSeconds || seconds > max) {
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
        entries.toSet().length == entries.length &&
        (!WidgetChannel.isSupported ||
            (_widgetSeconds != null && _limitSeconds != null));
  }

  /// Current entries, in seconds (null where not valid).
  List<int?> get _entries => List.generate(DisableDurations.count, _seconds);

  Future<void> _save() async {
    final entries = _entries;
    final widgetSeconds = _widgetSeconds;
    final limitSeconds = _limitSeconds;
    final durations = entries.cast<int>().toList()..sort();
    final appConfig = context.read<AppConfigViewModel>();
    final loc = AppLocalizations.of(context);
    var ok = await appConfig.setDisableDurations(durations);
    if (WidgetChannel.isSupported) {
      ok = await appConfig.setWidgetDisableDuration(widgetSeconds!) && ok;
      ok = await appConfig.setDisableCooldown(limitSeconds!) && ok;
    }
    if (!mounted) return;
    if (ok) {
      // Show the saved (sorted) values, unless the user changed the form
      // while saving: then keep their edits.
      if (listEquals(_entries, entries) &&
          _widgetSeconds == widgetSeconds &&
          _limitSeconds == limitSeconds) {
        setState(() {
          _fill(durations);
          _fillWidget(appConfig.widgetDisableDuration);
          _fillLimit(appConfig.disableCooldown);
        });
      }
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
    return _durationRow(
      fieldKey: Key('disableDuration$i'),
      unitId: 'disableDurationUnit$i',
      label: loc.disableMenuOption(i + 1),
      controller: _controllers[i],
      unit: _units[i],
      onUnitChanged: (unit) => setState(() => _units[i] = unit),
      errorText: _error(i, loc),
      loc: loc,
    );
  }

  /// A time: number field plus unit menu.
  Widget _durationRow({
    required Key fieldKey,
    required String unitId,
    required String label,
    required TextEditingController controller,
    required _TimeUnit unit,
    required ValueChanged<_TimeUnit> onUnitChanged,
    required String? errorText,
    required AppLocalizations loc,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextField(
              key: fieldKey,
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(_maxDigits),
              ],
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                labelText: label,
                errorText: errorText,
                errorMaxLines: 2,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          _unitMenu(
            id: unitId,
            unit: unit,
            onSelected: onUnitChanged,
            loc: loc,
          ),
        ],
      ),
    );
  }

  List<Widget> _widgetSection(AppLocalizations loc) {
    return [
      SectionLabel(label: loc.timersWidget),
      SwitchListTile(
        key: const Key('widgetAutoEnable'),
        title: Text(loc.widgetAutoEnable),
        subtitle: Text(loc.widgetAutoEnableDescription),
        value: _widgetAutoEnable,
        onChanged: (value) => setState(() => _widgetAutoEnable = value),
      ),
      if (_widgetAutoEnable)
        _durationRow(
          fieldKey: const Key('widgetDisableDuration'),
          unitId: 'widgetDisableDurationUnit',
          label: loc.widgetDisableFor,
          controller: _widgetController,
          unit: _widgetUnit,
          onUnitChanged: (unit) => setState(() => _widgetUnit = unit),
          errorText: _widgetSeconds == null ? loc.disableDurationInvalid : null,
          loc: loc,
        ),
    ];
  }

  List<Widget> _limitSection(AppLocalizations loc) {
    return [
      SectionLabel(label: loc.disableLimit),
      SwitchListTile(
        key: const Key('disableLimitEnabled'),
        title: Text(loc.disableLimitEnable),
        subtitle: Text(loc.disableLimitDescription),
        value: _limitEnabled,
        onChanged: (value) => setState(() => _limitEnabled = value),
      ),
      if (_limitEnabled)
        _durationRow(
          fieldKey: const Key('disableLimitDuration'),
          unitId: 'disableLimitDurationUnit',
          label: loc.disableLimitOnceEvery,
          controller: _limitController,
          unit: _limitUnit,
          onUnitChanged: (unit) => setState(() => _limitUnit = unit),
          errorText: _limitSeconds == null ? loc.disableLimitInvalid : null,
          loc: loc,
        ),
    ];
  }

  /// Just wide enough for the longest unit name plus the arrow, so the
  /// text field gets the rest of the row in every language.
  double _unitMenuWidth(AppLocalizations loc) {
    final style = Theme.of(context).textTheme.bodyLarge;
    var widest = 0.0;
    for (final unit in _TimeUnit.values) {
      final painter = TextPainter(
        text: TextSpan(text: _unitLabel(unit, loc), style: style),
        textDirection: TextDirection.ltr,
        textScaler: MediaQuery.textScalerOf(context),
      )..layout();
      if (painter.width > widest) widest = painter.width;
      painter.dispose();
    }
    // Room for the content padding and the arrow.
    return widest.ceilToDouble() + 64;
  }

  /// Time unit picker next to the text field, same height, no border.
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
      width: _unitMenuWidth(loc),
      initialSelection: unit,
      requestFocusOnTap: false,
      enableSearch: false,
      // No border: only the text field is boxed, as in the other screens.
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
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
            if (WidgetChannel.isSupported) ..._widgetSection(loc),
            if (WidgetChannel.isSupported) ..._limitSection(loc),
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
