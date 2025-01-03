import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetModal extends StatefulWidget {
  const ResetModal({
    super.key,
    required this.onConfirm,
    this.timeRemaining = 5,
  });

  final Future<void> Function() onConfirm;
  final int timeRemaining;

  @override
  State<ResetModal> createState() => _ResetModalState();
}

class _ResetModalState extends State<ResetModal> {
  late Timer _timer;
  late int _timeRemaining;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted && _timeRemaining > 0) {
        setState(() => _timeRemaining--);
      } else if (!mounted) {
        _timer.cancel();
      }
    });
    super.initState();
    _timeRemaining = widget.timeRemaining;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return AlertDialog(
      title: Column(
        children: [
          const Icon(
            Icons.delete_rounded,
            size: 26,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              AppLocalizations.of(context)!.eraseAppData,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
      content: Text(AppLocalizations.of(context)!.eraseWarning),
      actions: [
        TextButton(
          onPressed: () {
            _timer.cancel();
            Navigator.maybePop(context);
          },
          child: Text(
            AppLocalizations.of(context)!.cancel,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        width > 380
            ? TextButton(
                onPressed: _timeRemaining == 0
                    ? () async {
                        await widget.onConfirm.call();
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      }
                    : null,
                style: ButtonStyle(
                  foregroundColor: _timeRemaining == 0
                      ? WidgetStateProperty.all(Colors.red)
                      : WidgetStateProperty.all(Colors.grey),
                  overlayColor: WidgetStateProperty.all(
                    Colors.red.withValues(alpha: 0.1),
                  ),
                ),
                child: Text(
                  _timeRemaining > 0
                      ? '${AppLocalizations.of(context)!.eraseAll} ($_timeRemaining)'
                      : AppLocalizations.of(context)!.eraseAll,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            : SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: _timeRemaining == 0 ? widget.onConfirm : null,
                      style: ButtonStyle(
                        foregroundColor: _timeRemaining == 0
                            ? WidgetStateProperty.all(Colors.red)
                            : WidgetStateProperty.all(Colors.grey),
                        overlayColor: WidgetStateProperty.all(
                          Colors.red.withValues(alpha: 0.1),
                        ),
                      ),
                      child: Text(
                        _timeRemaining > 0
                            ? '${AppLocalizations.of(context)!.eraseAll} ($_timeRemaining)'
                            : AppLocalizations.of(context)!.eraseAll,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
