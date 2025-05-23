import 'package:flutter/material.dart';
import 'package:flutter_app_lock/flutter_app_lock.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/widgets/numeric_pad.dart';
import 'package:pi_hole_client/widgets/shake_animation.dart';
import 'package:provider/provider.dart';

class Unlock extends StatefulWidget {
  const Unlock({
    super.key,
  });

  @override
  State<Unlock> createState() => _UnlockState();
}

class _UnlockState extends State<Unlock> {
  bool isLoading = false;
  String _code = '';

  bool firstLoad = true;

  final GlobalKey<ShakeAnimationState> _shakeKey =
      GlobalKey<ShakeAnimationState>();

  Future<void> checkBiometrics() async {
    final appConfigProvider =
        Provider.of<AppConfigProvider>(context, listen: false);

    final auth = LocalAuthentication();
    final biometrics = await auth.getAvailableBiometrics();
    if (appConfigProvider.useBiometrics == true && biometrics.isNotEmpty) {
      await auth.stopAuthentication();
      if (!mounted) return;
      try {
        final didAuthenticate = await auth.authenticate(
          localizedReason: AppLocalizations.of(context)!.unlockWithFingerprint,
          options: const AuthenticationOptions(
            biometricOnly: true,
            stickyAuth: true,
          ),
        );
        if (didAuthenticate == true && mounted) {
          AppLock.of(context)!.didUnlock();
        }
      } catch (e) {
        if (!mounted) return;
        if (e.toString().contains('LockedOut')) {
          showErrorSnackBar(
            context: context,
            appConfigProvider: appConfigProvider,
            label: AppLocalizations.of(context)!
                .fingerprintAuthUnavailableAttempts,
          );
        } else {
          showErrorSnackBar(
            context: context,
            appConfigProvider: appConfigProvider,
            label: AppLocalizations.of(context)!.fingerprintAuthUnavailable,
          );
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkBiometrics();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    void updateCode(String value) {
      setState(() => _code = value);
      if (_code.length == 4 && _code == appConfigProvider.passCode) {
        AppLock.of(context)!.didUnlock();
      } else if (_code.length == 4 && _code != appConfigProvider.passCode) {
        _shakeKey.currentState!.shake();
        setState(() {
          _code = '';
        });
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ConstrainedBox(
                  constraints: width <= ResponsiveConstants.medium
                      ? const BoxConstraints.expand()
                      : const BoxConstraints(
                          maxWidth: 600,
                          maxHeight: 800,
                        ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: width <= ResponsiveConstants.medium
                        ? null
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(height: 16),
                        if (height - 180 >= 426)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 30),
                                child: Icon(
                                  Icons.lock_open_rounded,
                                  size: 30,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  AppLocalizations.of(context)!.enterCodeUnlock,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 22),
                                ),
                              ),
                            ],
                          )
                        else
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.lock_open_rounded,
                                size: 30,
                              ),
                              const SizedBox(width: 30),
                              Text(
                                AppLocalizations.of(context)!.enterCodeUnlock,
                                style: const TextStyle(fontSize: 22),
                              ),
                            ],
                          ),
                        NumericPad(
                          shakeKey: _shakeKey,
                          code: _code,
                          onInput: (newCode) =>
                              _code.length < 4 ? updateCode(newCode) : {},
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          AnimatedOpacity(
            opacity: isLoading == true ? 1 : 0,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: IgnorePointer(
              ignoring: isLoading == true ? false : true,
              child: Container(
                width: double.maxFinite,
                height: height,
                color: const Color.fromRGBO(0, 0, 0, 0.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      AppLocalizations.of(context)!.connecting,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
