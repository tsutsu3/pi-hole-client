import 'dart:async';

import 'package:flutter/material.dart';

import 'package:pi_hole_client/widgets/process_dialog.dart';

class ProcessModal {
  ProcessModal({required this.context});

  final BuildContext context;
  OverlayEntry? _overlayEntry;
  Timer? _timer;
  bool _isClosed = false;

  /// Opens the process dialog as an overlay.
  void open(
    String message, {
    Duration delay = const Duration(milliseconds: 100),
  }) {
    _isClosed = false;

    _timer = Timer(delay, () {
      if (_isClosed) return;
      _overlayEntry = _createOverlayEntry(message);
      final overlay = Overlay.of(context, rootOverlay: true);
      overlay.insert(_overlayEntry!);
    });
  }

  /// Closes the process dialog if it's open.
  void close() {
    _isClosed = true;
    _timer?.cancel();
    _timer = null;

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
