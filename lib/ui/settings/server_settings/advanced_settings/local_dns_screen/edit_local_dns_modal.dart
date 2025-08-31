import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:pi_hole_client/domain/models_old/devices.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';

class EditLocalDnsModal extends StatefulWidget {
  const EditLocalDnsModal({
    required this.localDns,
    required this.keyItem,
    required this.title,
    required this.icon,
    required this.onConfirm,
    required this.window,
    this.devices,
    super.key,
  });

  final LocalDns localDns;
  final String keyItem;
  final String title;
  final IconData icon;
  final void Function(LocalDns) onConfirm;
  final bool window;
  final List<DeviceInfo>? devices;

  @override
  State<EditLocalDnsModal> createState() => _EditLocalDnsModalState();
}

class _EditLocalDnsModalState extends State<EditLocalDnsModal> {
  final TextEditingController localDnsController = TextEditingController();
  String? localDnsError;
  bool status = true;
  bool allDataValid = false;
  List<int> selectedGroups = [];

  @override
  void initState() {
    super.initState();
    if (widget.keyItem == 'name') {
      localDnsController.text = widget.localDns.name;
    }
    if (widget.keyItem == 'ip') {
      localDnsController.text = widget.localDns.ip;
    }
  }

  void validateName(String? value) {
    if (value == widget.localDns.name) {
      setState(() {
        allDataValid = false;
      });
    } else {
      if (value != null && value != '') {
        setState(() {
          localDnsError = null;
        });
      } else {
        setState(() {
          localDnsError = 'Invalid Hostname'; // TODO: i18n
        });
      }
      setState(() {
        allDataValid = true;
      });
    }
  }

  void validateIp(String? value) {
    if (value == widget.localDns.ip) {
      setState(() {
        allDataValid = false;
      });
    } else {
      if (value != null && value != '') {
        final ipRegex = RegExp(
          r'^(([0-9]{1,3}\.){3}[0-9]{1,3}|[a-z0-9-]+(\.[a-z0-9-]+)*\.[a-z]{2,})$',
        );
        if (ipRegex.hasMatch(value) == true) {
          setState(() {
            localDnsError = null;
            setState(() {
              allDataValid = true;
            });
          });
        } else {
          setState(() {
            localDnsError = 'Invalid IP address'; // TODO: i18n
          });
        }
      } else {
        setState(() {
          localDnsError = 'Invalid IP address'; // TODO: i18n
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

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
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            widget.icon,
                            size: 24,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              widget.title,
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        ],
                      ),
                      if (widget.keyItem == 'name')
                        SizedBox(
                          width: double.infinity,
                          child: TextField(
                            controller: localDnsController,
                            onChanged: validateName,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.computer_rounded),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              labelText: AppLocalizations.of(context)!.hostname,
                              errorText: localDnsError,
                            ),
                          ),
                        ),
                      if (widget.keyItem == 'ip')
                        SizedBox(
                          width: double.infinity,
                          child: TextField(
                            controller: localDnsController,
                            onChanged: validateIp,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.location_on_rounded),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              labelText: AppLocalizations.of(
                                context,
                              )!.ipAddress,
                              errorText: localDnsError,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: isLandscape
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
                            if (widget.keyItem == 'name') {
                              widget.onConfirm(
                                widget.localDns.copyWith(
                                  name: localDnsController.text,
                                ),
                              );
                            }
                            if (widget.keyItem == 'ip') {
                              widget.onConfirm(
                                widget.localDns.copyWith(
                                  ip: localDnsController.text,
                                ),
                              );
                            }
                            Navigator.maybePop(context);
                          }
                        : null,
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(
                        allDataValid == true ? null : Colors.grey,
                      ),
                    ),
                    child: Text(AppLocalizations.of(context)!.edit),
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
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 480),
          child: Padding(
            padding: isLandscape
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
          decoration: BoxDecoration(
            color: Theme.of(context).dialogTheme.backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
          ),
          child: SafeArea(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 480),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: content(),
              ),
            ),
          ),
        ),
      );
    }
  }
}
