// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';

class RemovePasscodeModal extends StatelessWidget {
  const RemovePasscodeModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    void removePasscode() async {
      final deleted = await appConfigProvider.setPassCode(null);
      if (deleted == true) {
        Navigator.maybePop(context);
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.connectionCannotBeRemoved,
        );
      }
    }

    return AlertDialog(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      title: Column(
        children: [
          const Icon(
            Icons.delete,
            size: 26,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              AppLocalizations.of(context)!.removePasscode,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
      content: Text(AppLocalizations.of(context)!.areSureRemovePasscode),
      actions: [
        TextButton(
          onPressed: () => {Navigator.maybePop(context)},
          child: Text(AppLocalizations.of(context)!.cancel),
        ),
        TextButton(
          onPressed: removePasscode,
          child: Text(AppLocalizations.of(context)!.remove),
        ),
      ],
    );
  }
}
