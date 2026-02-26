import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/app_lock/widgets/create_pass_code_modal.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/app_lock/widgets/remove_passcode_modal.dart';
import 'package:provider/provider.dart';

class AppUnlockSetupModal extends StatefulWidget {
  const AppUnlockSetupModal({
    required this.topBarHeight,
    required this.useBiometrics,
    required this.window,
    super.key,
  });

  final double topBarHeight;
  final bool useBiometrics;
  final bool window;

  @override
  State<AppUnlockSetupModal> createState() => _AppUnlockSetupModalState();
}

class _AppUnlockSetupModalState extends State<AppUnlockSetupModal> {
  List<BiometricType> availableBiometrics = [];
  bool validVibrator = false;

  Future<void> checkAvailableBiometrics() async {
    try {
      final auth = LocalAuthentication();
      final biometrics = await auth.getAvailableBiometrics();
      setState(() => availableBiometrics = biometrics);
    } catch (_) {
      // NO BIOMETRICS //
    }
  }

  @override
  void initState() {
    checkAvailableBiometrics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appConfigViewModel = Provider.of<AppConfigViewModel>(context);
    final colors = appConfigViewModel.colors;

    final mediaQuery = MediaQuery.of(context);

    void openPassCodeDialog() {
      Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context) => const CreatePassCodeModal(),
        ),
      );
    }

    void openRemovePasscode() {
      showDialog(
        context: context,
        useRootNavigator:
            false, // Prevents unexpected app exit on mobile when pressing back
        builder: (context) => const RemovePasscodeModal(),
        barrierDismissible: false,
      );
    }

    Future<void> enableDisableBiometricsUnlock(bool status) async {
      if (status == true) {
        final auth = LocalAuthentication();
        final biometrics = await auth.getAvailableBiometrics();
        if (biometrics.isNotEmpty) {
          await auth.stopAuthentication();
          try {
            final didAuthenticate = await auth.authenticate(
              localizedReason: 'Unlock the app',
              biometricOnly: true,
              persistAcrossBackgrounding: true,
            );
            if (didAuthenticate == true) {
              final result = await appConfigViewModel.setUseBiometrics(true);
              if (!context.mounted) return;
              if (result == false) {
                showErrorSnackBar(
                  context: context,
                  appConfigViewModel: appConfigViewModel,
                  label: AppLocalizations.of(
                    context,
                  )!.biometricUnlockNotActivated,
                );
              }
            }
          } catch (e) {
            if (!context.mounted) return;
            if (e.toString().contains('LockedOut')) {
              showErrorSnackBar(
                context: context,
                appConfigViewModel: appConfigViewModel,
                label: AppLocalizations.of(
                  context,
                )!.fingerprintAuthUnavailableAttempts,
              );
            } else {
              showErrorSnackBar(
                context: context,
                appConfigViewModel: appConfigViewModel,
                label: AppLocalizations.of(context)!.fingerprintAuthUnavailable,
              );
            }
          }
        } else {
          if (!context.mounted) return;
          showNeutralSnackBar(
            context: context,
            appConfigViewModel: appConfigViewModel,
            label: AppLocalizations.of(context)!.noAvailableBiometrics,
          );
        }
      } else {
        final result = await appConfigViewModel.setUseBiometrics(false);
        if (!context.mounted) return;
        if (result == false) {
          showErrorSnackBar(
            context: context,
            appConfigViewModel: appConfigViewModel,
            label: AppLocalizations.of(context)!.biometricUnlockNotDisabled,
          );
        }
      }
    }

    Widget content() {
      final scrollableContent = <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 24),
              child: Icon(Icons.password_rounded, size: 26),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                AppLocalizations.of(context)!.appUnlock,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 24, top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: appConfigViewModel.passCode != null
                  ? colors.commonGreen ?? Colors.green
                  : colors.commonRed ?? Colors.red,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: appConfigViewModel.passCode != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check,
                      color: colors.commonGreen ?? Colors.green,
                      size: 20,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      AppLocalizations.of(context)!.statusEnabled,
                      style: TextStyle(
                        color: colors.commonGreen ?? Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.close,
                      color: colors.commonRed ?? Colors.red,
                      size: 20,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      AppLocalizations.of(context)!.statusDisabled,
                      style: TextStyle(
                        color: colors.commonRed ?? Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
        ),
        if (appConfigViewModel.passCode != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: openPassCodeDialog,
                      style: ButtonStyle(
                        shadowColor: WidgetStateProperty.all(
                          Colors.transparent,
                        ),
                      ),
                      child: Row(
                        children: [
                          if (mediaQuery.size.width > 380)
                            const Icon(Icons.update),
                          if (mediaQuery.size.width > 380)
                            const SizedBox(width: 10),
                          Text(AppLocalizations.of(context)!.updatePasscode),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: openRemovePasscode,
                      style: ButtonStyle(
                        shadowColor: WidgetStateProperty.all(
                          Colors.transparent,
                        ),
                      ),
                      child: Row(
                        children: [
                          if (mediaQuery.size.width > 380)
                            const Icon(Icons.delete),
                          if (mediaQuery.size.width > 380)
                            const SizedBox(width: 10),
                          Text(AppLocalizations.of(context)!.removePasscode),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton.icon(
              onPressed: openPassCodeDialog,
              style: ButtonStyle(
                shadowColor: WidgetStateProperty.all(Colors.transparent),
              ),
              icon: const Icon(Icons.pin_outlined),
              label: Text(AppLocalizations.of(context)!.setPassCode),
            ),
          ),
        if (appConfigViewModel.biometricsSupport == true)
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: appConfigViewModel.passCode != null
                  ? () => enableDisableBiometricsUnlock(
                      !appConfigViewModel.useBiometrics,
                    )
                  : null,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 30,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.fingerprint,
                          color: appConfigViewModel.passCode != null
                              ? null
                              : colors.queryGrey ?? Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          AppLocalizations.of(context)!.useFingerprint,
                          style: TextStyle(
                            fontSize: 16,
                            color: appConfigViewModel.passCode != null
                                ? null
                                : colors.queryGrey ?? Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Switch(
                      value: appConfigViewModel.useBiometrics,
                      onChanged: appConfigViewModel.passCode != null
                          ? enableDisableBiometricsUnlock
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ];

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(children: scrollableContent),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.maybePop(context),
                  child: Text(AppLocalizations.of(context)!.close),
                ),
              ],
            ),
          ),
        ],
      );
    }

    if (widget.window == true) {
      return Dialog(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: content(),
        ),
      );
    } else {
      return Container(
        height: (mediaQuery.size.height - widget.topBarHeight) > 460
            ? 460
            : mediaQuery.size.height - widget.topBarHeight,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          color: Theme.of(context).dialogTheme.backgroundColor,
        ),
        child: content(),
      );
    }
  }
}
