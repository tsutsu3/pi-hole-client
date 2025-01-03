import 'package:flutter/material.dart';

import 'package:pi_hole_client/widgets/process_dialog.dart';

class ProcessModal {
  final BuildContext context;
  OverlayEntry? _overlayEntry;

  ProcessModal({required this.context});

  /// Opens the process dialog as an overlay.
  void open(String message) {
    if (_overlayEntry != null) return; // If already open, do nothing

    _overlayEntry = _createOverlayEntry(message);
    Overlay.of(context).insert(_overlayEntry!);
  }

  /// Closes the process dialog if it's open.
  void close() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  /// Creates an overlay entry for the process dialog.
  OverlayEntry _createOverlayEntry(String message) {
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          ModalBarrier(
            dismissible: false,
            color: Colors.black.withValues(alpha: 0.5),
          ),
          Center(
            child: ProcessDialog(
              message: message,
            ),
          ),
        ],
      ),
    );
  }
}
