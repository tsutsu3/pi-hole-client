import 'package:flutter/material.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/ui/numeric_pad.dart';
import 'package:pi_hole_client/ui2/core/ui/shake_animation.dart';
import 'package:provider/provider.dart';

class EnterPasscodeModal extends StatefulWidget {
  const EnterPasscodeModal({
    required this.onConfirm,
    required this.window,
    super.key,
  });

  final void Function() onConfirm;
  final bool window;

  @override
  State<EnterPasscodeModal> createState() => _EnterPasscodeModalState();
}

class _EnterPasscodeModalState extends State<EnterPasscodeModal> {
  String _code = '';

  final GlobalKey<ShakeAnimationState> _shakeKey =
      GlobalKey<ShakeAnimationState>();

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    final height = MediaQuery.of(context).size.height;

    Future<void> finish() async {
      if (appConfigProvider.passCode == _code) {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        widget.onConfirm();
      } else {
        _shakeKey.currentState!.shake();
        setState(() {
          _code = '';
        });
      }
    }

    if (widget.window == true) {
      return Dialog(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 800),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.maybePop(context),
                          icon: const Icon(Icons.clear_rounded),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          AppLocalizations.of(context)!.enterPasscode,
                          style: const TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: _code.length == 4 ? finish : null,
                      style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all(
                          _code.length == 4
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey,
                        ),
                      ),
                      child: Text(AppLocalizations.of(context)!.confirm),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(16)),
              NumericPad(
                shakeKey: _shakeKey,
                code: _code,
                onInput: (newCode) => setState(() => _code = newCode),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.enterPasscode),
          elevation: 5,
          actions: [
            TextButton(
              onPressed: _code.length == 4 ? finish : null,
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(
                  _code.length == 4
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                ),
              ),
              child: Text(AppLocalizations.of(context)!.confirm),
            ),
          ],
        ),
        body: SizedBox(
          height: height - 60,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumericPad(
                shakeKey: _shakeKey,
                code: _code,
                onInput: (newCode) => setState(() => _code = newCode),
              ),
            ],
          ),
        ),
      );
    }
  }
}
