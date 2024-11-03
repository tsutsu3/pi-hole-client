import 'package:flutter/material.dart';

import 'package:pi_hole_client/widgets/process_dialog.dart';

class ProcessModal {
  late BuildContext context;

  ProcessModal({required this.context});

  void open(String message) async {
    await Future.delayed(
        const Duration(seconds: 0),
        () => {
              if (context.mounted)
                {
                  showDialog(
                    context: context,
                    builder: (c) {
                      context = c;
                      return ProcessDialog(
                        message: message,
                      );
                    },
                    barrierDismissible: false,
                    useSafeArea: true,
                  )
                }
            });
  }

  void close() {
    if (context.mounted) {
      Navigator.pop(context);
    }
  }
}
