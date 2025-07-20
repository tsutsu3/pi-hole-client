import 'package:flutter/material.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/ui/components/numeric_pad.dart';
import 'package:provider/provider.dart';

class CreatePassCodeModal extends StatefulWidget {
  const CreatePassCodeModal({super.key});

  @override
  State<CreatePassCodeModal> createState() => _CreatePassCodeModalState();
}

class _CreatePassCodeModalState extends State<CreatePassCodeModal> {
  int _step = 0;
  String _code = '';
  String _repeatedCode = '';

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    final height = MediaQuery.of(context).size.height;

    Future<void> finish() async {
      if (_code == _repeatedCode) {
        final result = await appConfigProvider.setPassCode(_repeatedCode);
        if (!context.mounted) return;

        if (result == true) {
          await Navigator.maybePop(context);
        } else {
          showErrorSnackBar(
            context: context,
            appConfigProvider: appConfigProvider,
            label: AppLocalizations.of(context)!.passCodeNotSaved,
          );
        }
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.passcodesDontMatch,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _step == 0
              ? AppLocalizations.of(context)!.enterPasscode
              : AppLocalizations.of(context)!.repeatPasscode,
        ),
        elevation: 5,
        actions: [
          TextButton(
            onPressed: _step == 0
                ? _code.length == 4
                    ? () => setState(() => _step = 1)
                    : null
                : _repeatedCode.length == 4
                    ? finish
                    : null,
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(
                _step == 0
                    ? _code.length == 4
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey
                    : _repeatedCode.length == 4
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
              ),
            ),
            child: Text(
              _step == 0
                  ? AppLocalizations.of(context)!.next
                  : AppLocalizations.of(context)!.finish,
            ),
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
              code: _step == 0 ? _code : _repeatedCode,
              onInput: (newCode) => _step == 0
                  ? setState(() => _code = newCode)
                  : setState(() => _repeatedCode = newCode),
            ),
          ],
        ),
      ),
    );
  }
}
