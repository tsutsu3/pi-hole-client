import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({
    required this.onConfirm,
    super.key,
    this.timeRemaining = 5,
  });

  final Future<void> Function() onConfirm;
  final int timeRemaining;

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  late Timer _timer;
  late int _timeRemaining;

  @override
  void initState() {
    super.initState();
    _timeRemaining = widget.timeRemaining;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted && _timeRemaining > 0) {
        setState(() => _timeRemaining--);
      } else if (!mounted) {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.eraseAppData),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final contentWidth = constraints.maxWidth > ResponsiveConstants.medium
              ? ResponsiveConstants.medium
              : constraints.maxWidth * 0.8;
          return Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: contentWidth),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.delete_rounded,
                        size: 60,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.eraseAppData,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 48),
                      Text(
                        AppLocalizations.of(context)!.eraseWarning,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              _timer.cancel();
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              AppLocalizations.of(context)!.cancel,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                          TextButton(
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
