import 'package:flutter/material.dart';

class ProcessDialog extends StatelessWidget {
  const ProcessDialog({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        backgroundColor: Theme.of(context).dialogBackgroundColor,
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
