import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/ui/custom_radio_list_tile.dart';
import 'package:provider/provider.dart';

class RefreshOption {
  const RefreshOption(this.time, this.labelBuilder);

  final int time;
  final String Function(AppLocalizations) labelBuilder;

  static const defaultTime = 10;
  static const defaultIndex = 3;

  static final List<RefreshOption> all = [
    RefreshOption(1, (loc) => loc.second1),
    RefreshOption(2, (loc) => loc.seconds2),
    RefreshOption(5, (loc) => loc.seconds5),
    RefreshOption(10, (loc) => loc.seconds10),
    RefreshOption(30, (loc) => loc.seconds30),
    RefreshOption(-1, (loc) => loc.custom),
  ];

  static int indexFromTime(int time) {
    final idx = all.indexWhere((opt) => opt.time == time);
    return idx != -1 ? idx : all.length - 1;
  }

  static int timeFromIndex(int index) {
    final t = all[index].time;
    return t > 0 ? t : 0;
  }
}

class AutoRefreshTimeScreen extends StatefulWidget {
  const AutoRefreshTimeScreen({super.key});

  @override
  State<AutoRefreshTimeScreen> createState() => _AutoRefreshTimeScreenState();
}

class _AutoRefreshTimeScreenState extends State<AutoRefreshTimeScreen> {
  int selectedIndex = RefreshOption.defaultIndex;
  final TextEditingController customTimeController = TextEditingController();
  final FocusNode customFocusNode = FocusNode();
  bool showCustomInput = false;
  bool customValid = false;
  late final AppConfigProvider configProvider;

  bool get isCustomSelected => selectedIndex == RefreshOption.all.length - 1;

  @override
  void initState() {
    super.initState();
    customFocusNode.addListener(() {
      if (!customFocusNode.hasFocus && customValid) {
        _save();
      }
    });
    configProvider = context.read<AppConfigProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final saved =
          configProvider.getAutoRefreshTime ?? RefreshOption.defaultTime;
      setState(() {
        selectedIndex = RefreshOption.indexFromTime(saved);
        if (isCustomSelected) {
          customTimeController.text = saved.toString();
          _validateCustom(saved.toString());
          showCustomInput = true;
        }
      });
    });
  }

  @override
  void dispose() {
    customTimeController.dispose();
    customFocusNode.dispose();
    super.dispose();
  }

  void _updateRadioValue(int index) {
    setState(() {
      selectedIndex = index;
      showCustomInput = isCustomSelected;
      if (!showCustomInput) {
        customTimeController.clear();
        customValid = false;
      }
    });

    if (!showCustomInput) {
      _save();
    }
  }

  void _validateCustom(String value) {
    final input = int.tryParse(value);
    final valid = input != null && input > 0 && input <= 86400; // 24 hours
    setState(() {
      customValid = valid;
    });
  }

  int _getTime() {
    final opt = RefreshOption.all[selectedIndex];
    if (opt.time > 0) return opt.time;
    final parsed = int.tryParse(customTimeController.text);
    return parsed ?? RefreshOption.defaultTime;
  }

  Future<void> _save() async {
    final time = _getTime();
    final result = await configProvider.setAutoRefreshTime(time);

    if (!mounted) return;

    final loc = AppLocalizations.of(context)!;
    if (result) {
      showSuccessSnackBar(
        context: context,
        appConfigProvider: configProvider,
        label: loc.updateTimeChanged,
      );
    } else {
      showErrorSnackBar(
        context: context,
        appConfigProvider: configProvider,
        label: loc.cannotChangeUpdateTime,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.autoRefreshTime)),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 16),
            ...RefreshOption.all.asMap().entries.map(
              (entry) {
                final idx = entry.key;
                final option = entry.value;
                return CustomRadioListTile(
                  groupValue: selectedIndex,
                  value: idx,
                  radioBackgroundColor: Theme.of(context).colorScheme.surface,
                  title: option.labelBuilder(loc),
                  onChanged: _updateRadioValue,
                );
              },
            ),
            if (showCustomInput)
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: customTimeController,
                  focusNode: customFocusNode,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: _validateCustom,
                  onSubmitted: (value) {
                    if (customValid) {
                      _save();
                      FocusScope.of(context).unfocus();
                    }
                  },
                  onEditingComplete: () {
                    if (customValid) {
                      FocusScope.of(context).unfocus();
                    }
                  },
                  decoration: InputDecoration(
                    errorText:
                        !customValid && customTimeController.text.isNotEmpty
                            ? loc.valueNotValid
                            : null,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: loc.customSeconds,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
