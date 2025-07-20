import 'package:flutter/material.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:provider/provider.dart';

class RemovePasscodeModal extends StatelessWidget {
  const RemovePasscodeModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    Future<void> removePasscode() async {
      final deleted = await appConfigProvider.setPassCode(null);
      if (!context.mounted) return;

      if (deleted == true) {
        await Navigator.maybePop(context);
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.connectionCannotBeRemoved,
        );
      }
    }

    return AlertDialog(
      backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
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
