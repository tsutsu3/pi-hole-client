import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';

class AddLocalDnsModal extends StatefulWidget {
  const AddLocalDnsModal({
    required this.addLocalDns,
    required this.window,
    super.key,
  });

  final void Function(Map<String, dynamic>) addLocalDns;
  final bool window;

  @override
  State<AddLocalDnsModal> createState() => _AddLocalDnsModalState();
}

class _AddLocalDnsModalState extends State<AddLocalDnsModal> {
  final TextEditingController ipController = TextEditingController();
  final TextEditingController hostNameController = TextEditingController();

  String? ipError;
  String? hostNameError;
  bool wildcard = false;
  bool allDataValid = false;

  @override
  void initState() {
    super.initState();
  }

  /// Validate the IP address format
  void validateIp(String? value) {
    if (value != null && value != '') {
      final ipRegex = RegExp(
        r'^(([0-9]{1,3}\.){3}[0-9]{1,3}|[a-z0-9-]+(\.[a-z0-9-]+)*\.[a-z]{2,})$',
      );
      if (ipRegex.hasMatch(value) == true) {
        setState(() {
          ipError = null;
        });
      } else {
        setState(() {
          ipError = 'Invalid IP address'; // TODO: i18n
        });
      }
    } else {
      setState(() {
        ipError = null;
      });
    }
    validateAllData();
  }

  /// Validate the host name format
  void validateHostName(String? value) {
    if (value != null && value != '') {
      setState(() {
        hostNameError = null;
      });
    } else {
      setState(() {
        hostNameError = 'Invalid hostname'; // TODO: i18n
      });
    }
    validateAllData();
  }

  void validateAllData() {
    if (ipController.text != '' &&
        ipError == null &&
        hostNameController.text != '' &&
        hostNameError == null) {
      setState(() {
        allDataValid = true;
      });
    } else {
      setState(() {
        allDataValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final isKeyboardVisible = mediaQuery.viewInsets.bottom > 0;

    Widget content() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.domain_add_rounded,
                        size: 24,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Add Local DNS', // TODO: i18n
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(top: 20),
                    child: TextField(
                      controller: hostNameController,
                      onChanged: validateHostName,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.domain_rounded),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: 'Host Name', // TODO: i18n
                        errorText: hostNameError,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(top: 20),
                    child: TextField(
                      controller: ipController,
                      onChanged: validateIp,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.domain_rounded),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: 'IP Address', // TODO: i18n
                        errorText: ipError,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: (isLandscape && isKeyboardVisible)
                ? EdgeInsets.zero
                : const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.maybePop(context),
                  child: Text(AppLocalizations.of(context)!.cancel),
                ),
                const SizedBox(width: 14),
                TextButton(
                  onPressed: allDataValid == true
                      ? () {
                          widget.addLocalDns({
                            'ip': ipController.text,
                            'name': hostNameController.text,
                          });
                          Navigator.maybePop(context);
                        }
                      : null,
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(
                      allDataValid == true ? null : Colors.grey,
                    ),
                  ),
                  child: Text(AppLocalizations.of(context)!.add),
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
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: (isLandscape && isKeyboardVisible)
                ? const EdgeInsets.symmetric(horizontal: 16)
                : const EdgeInsets.all(16),
            child: content(),
          ),
        ),
      );
    } else {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).dialogTheme.backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
          ),
          child: SafeArea(child: content()),
        ),
      );
    }
  }
}
