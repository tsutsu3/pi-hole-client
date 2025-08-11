import 'package:flutter/material.dart';

class ProcessDialog extends StatelessWidget {
  const ProcessDialog({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        backgroundColor: Theme.of(context)
            .dialogTheme
            .backgroundColor!
            .withValues(alpha: 0.85),
        shadowColor: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 40),
              Text(message),
            ],
          ),
        ),
      ),
    );
  }
}
