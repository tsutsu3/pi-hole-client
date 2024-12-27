import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/widgets/process_dialog.dart';

class ProcessModal {
  final BuildContext context;

  bool _isOpenModal = false;
  Timer? _closeTimer;
  BuildContext? _dialogContext;

  ProcessModal({required this.context});

  /// Opens the modal. If other modals are open, they are closed first.
  void open(String message) {
    if (_isOpenModal) return;

    _isOpenModal = true;
    logger.d('Modal opened');

    // Ensure other modals are closed before opening ProcessModal.
    Future.delayed(Duration.zero, () {
      if (!context.mounted) return;

      showDialog(
        context: context,
        builder: (dialogContext) {
          _dialogContext = dialogContext;
          return ProcessDialog(message: message);
        },
        barrierDismissible: false,
        useSafeArea: true,
      ).then((_) {
        if (_isOpenModal) {
          _resetState();
          logger.d('Modal closed via then');
        }
      });

      // TODO: Close the modal reliably without a timer
      // Schedule a timer to close the modal after 1 seconds.
      // If `close()` fails for any reason, this prevents the loading from continuing indefinitely.
      _closeTimer = Timer(const Duration(milliseconds: 1000), close);
    });
  }

  /// Closes the modal if it is open.
  void close() {
    if (!_isOpenModal || _dialogContext == null) return;

    try {
      _closeTimer?.cancel();
      _closeTimer = null;

      if (Navigator.of(_dialogContext!).canPop()) {
        Navigator.of(_dialogContext!).pop();
        logger.d('Modal closed successfully');
      } else {
        logger.w('Modal cannot pop');
      }
    } catch (e) {
      logger.e('Error closing modal: $e');
    } finally {
      _resetState();
    }
  }

  /// Resets the internal state of the modal.
  void _resetState() {
    _isOpenModal = false;
    _dialogContext = null;
    logger.d('Modal state reset');
  }
}
