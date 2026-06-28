import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/types/resolve_totp.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/responsive.dart';

/// Shows a dialog asking the user for a 6-digit TOTP (2FA) code.
///
/// Returns the entered code, or `null` when the user cancels. [error] is set on
/// a re-prompt after the server rejected a code, selecting the message shown
/// above the field.
Future<String?> showTotpInputModal(
  BuildContext context, {
  TotpPromptError? error,
}) {
  final width = MediaQuery.of(context).size.width;

  if (width > ResponsiveConstants.medium) {
    return showDialog<String>(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (dialogContext) => _TotpInputModal(error: error, window: true),
    );
  }

  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: false,
    builder: (dialogContext) => _TotpInputModal(error: error, window: false),
  );
}

class _TotpInputModal extends StatefulWidget {
  const _TotpInputModal({required this.window, this.error});

  final TotpPromptError? error;
  final bool window;

  @override
  State<_TotpInputModal> createState() => _TotpInputModalState();
}

class _TotpInputModalState extends State<_TotpInputModal> {
  final int _codeLength = 6;
  late final List<TextEditingController> _controllers = List.generate(
    _codeLength,
    (_) => TextEditingController(),
  );
  late final List<FocusNode> _focusNodes = List.generate(
    _codeLength,
    (_) => FocusNode(),
  );

  String get _code => _controllers.map((controller) => controller.text).join();

  bool get _isValid =>
      _controllers.every((controller) => controller.text.length == 1);

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _submit() {
    if (!_isValid) return;
    Navigator.pop(context, _code);
  }

  Future<void> _pasteCodeFromClipboard() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    if (!mounted) return;

    final digits = clipboardData?.text?.replaceAll(RegExp(r'\D'), '') ?? '';
    if (digits.length != _codeLength) {
      _clearCode();
      return;
    }

    _fillCode(digits);
  }

  void _clearCode() {
    for (var i = 0; i < _codeLength; i++) {
      _setControllerText(i, '');
    }
    _focusNodes[0].requestFocus();
    setState(() {});
  }

  void _fillCode(String digits) {
    final code = digits.length > _codeLength
        ? digits.substring(0, _codeLength)
        : digits;

    for (var i = 0; i < _codeLength; i++) {
      _setControllerText(i, i < code.length ? code[i] : '');
    }

    final focusIndex = code.length >= _codeLength
        ? _codeLength - 1
        : code.length;
    _focusNodes[focusIndex].requestFocus();
    setState(() {});
    if (_isValid) _submit();
  }

  void _handleCodeChanged(int index, String value) {
    final digits = value.replaceAll(RegExp(r'\D'), '');

    if (digits.isEmpty) {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
      setState(() {});
      return;
    }

    if (digits.length == 1) {
      _setControllerText(index, digits);
      if (index < _codeLength - 1) {
        _focusNodes[index + 1].requestFocus();
      }
      setState(() {});
      if (_isValid) _submit();
      return;
    }

    // Paste or fast typing scenario
    for (var i = index; i < _codeLength; i++) {
      final digitIndex = i - index;
      _setControllerText(
        i,
        digitIndex < digits.length ? digits[digitIndex] : '',
      );
    }

    final nextIndex = (index + digits.length).clamp(0, _codeLength - 1);
    _focusNodes[nextIndex].requestFocus();
    setState(() {});
    if (_isValid) _submit();
  }

  void _setControllerText(int index, String text) {
    final controller = _controllers[index];
    if (controller.text == text) return;
    controller.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  KeyEventResult _handleKeyEvent(int index, KeyEvent event) {
    if (event is! KeyDownEvent ||
        event.logicalKey != LogicalKeyboardKey.backspace ||
        _controllers[index].text.isNotEmpty ||
        index == 0) {
      return KeyEventResult.ignored;
    }

    _focusNodes[index - 1].requestFocus();
    _setControllerText(index - 1, '');
    setState(() {});
    return KeyEventResult.handled;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final errorText = switch (widget.error) {
      null => null,
      TotpPromptError.invalid => loc.mfaInvalidCode,
      TotpPromptError.reused => loc.mfaReusedCode,
    };

    final inputFields = LayoutBuilder(
      builder: (context, constraints) {
        final preferredSpacing = constraints.maxWidth < 280 ? 4.0 : 6.0;
        final spacing = preferredSpacing.clamp(
          0.0,
          constraints.maxWidth / (_codeLength - 1),
        );
        final inputBorder = OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: errorText == null
                ? theme.colorScheme.outline
                : theme.colorScheme.error,
          ),
        );
        final availableFieldWidth =
            (constraints.maxWidth - spacing * (_codeLength - 1)) / _codeLength;
        final fieldWidth = availableFieldWidth.clamp(0.0, 52.0);
        final totalWidth =
            fieldWidth * _codeLength + spacing * (_codeLength - 1);

        return Center(
          child: SizedBox(
            width: totalWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          loc.mfaCodeLabel,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: _pasteCodeFromClipboard,
                      icon: const Icon(Icons.content_paste_rounded, size: 16),
                      label: Text(
                        MaterialLocalizations.of(context).pasteButtonLabel,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: List.generate(_codeLength, (index) {
                    return Padding(
                      padding: EdgeInsetsDirectional.only(
                        end: index == _codeLength - 1 ? 0 : spacing,
                      ),
                      child: SizedBox(
                        width: fieldWidth,
                        height: 56,
                        child: Focus(
                          onKeyEvent: (_, event) =>
                              _handleKeyEvent(index, event),
                          child: TextField(
                            controller: _controllers[index],
                            focusNode: _focusNodes[index],
                            autofocus: index == 0,
                            keyboardType: TextInputType.number,
                            textInputAction: index == _codeLength - 1
                                ? TextInputAction.done
                                : TextInputAction.next,
                            textAlign: TextAlign.center,
                            maxLength: _codeLength,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) =>
                                _handleCodeChanged(index, value),
                            onSubmitted: (_) {
                              if (index == _codeLength - 1) {
                                _submit();
                              } else {
                                _focusNodes[index + 1].requestFocus();
                              }
                            },
                            decoration: InputDecoration(
                              counterText: '',
                              border: inputBorder,
                              enabledBorder: inputBorder,
                              focusedBorder: inputBorder.copyWith(
                                borderSide: BorderSide(
                                  color: errorText == null
                                      ? theme.colorScheme.primary
                                      : theme.colorScheme.error,
                                  width: 2,
                                ),
                              ),
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );

    Widget content() {
      return Container(
        constraints: const BoxConstraints(minHeight: 360),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.password_rounded,
                        size: 24,
                        color: theme.colorScheme.secondary,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(36),
                        child: Text(
                          loc.mfaDialogTitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      Text(
                        loc.mfaDialogDescription,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        loc.mfaDialogInstruction,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 36),
                      inputFields,
                      if (errorText != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          errorText,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.error,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(loc.cancel),
                  ),
                  TextButton(
                    onPressed: _isValid ? _submit : null,
                    child: Text(loc.confirm),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    if (widget.window == true) {
      return Dialog(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 480),
          child: Padding(padding: const EdgeInsets.all(24), child: content()),
        ),
      );
    }

    return Padding(
      padding: mediaQuery.viewInsets,
      child: SafeArea(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 480),
          child: Padding(padding: const EdgeInsets.all(24), child: content()),
        ),
      ),
    );
  }
}
