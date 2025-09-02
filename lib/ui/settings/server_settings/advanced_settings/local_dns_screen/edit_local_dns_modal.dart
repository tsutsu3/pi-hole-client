import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/auto_complate_field.dart';

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
  final void Function(LocalDns, String) onConfirm;
  final bool window;
  final List<DeviceOption>? devices;

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

  void validateHostName(String? value) {
    final locale = AppLocalizations.of(context)!;
    if (value == widget.localDns.name) {
      setState(() {
        localDnsError = null;
        allDataValid = false;
      });
    } else {
      if (value != null && value != '') {
        final hostNameRegex = RegExp(r'^[a-zA-Z0-9-_\.]+$');
        if (hostNameRegex.hasMatch(value) == true) {
          setState(() {
            localDnsError = null;
            allDataValid = true;
          });
        } else {
          setState(() {
            localDnsError = locale.invalidHostname;
            allDataValid = false;
          });
        }
      } else {
        setState(() {
          localDnsError = locale.invalidHostname;
          allDataValid = false;
        });
      }
    }
  }

  void validateIp(String? value) {
    final locale = AppLocalizations.of(context)!;
    if (value == widget.localDns.ip) {
      setState(() {
        localDnsError = null;
        allDataValid = false;
      });
    } else {
      if (value != null && value != '') {
        final ipRegex = RegExp(
          '^('
          r'(25[0-5]|2[0-4][0-9]|1\d{2}|[1-9]?\d)(\.(25[0-5]|2[0-4][0-9]|1\d{2}|[1-9]?\d)){3}' // IPv4
          '|'
          r'((([0-9a-f]{1,4}:){7}([0-9a-f]{1,4}|:))|(([0-9a-f]{1,4}:){6}(:[0-9a-f]{1,4}|((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9a-f]{1,4}:){5}(((:[0-9a-f]{1,4}){1,2})|:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9a-f]{1,4}:){4}(((:[0-9a-f]{1,4}){1,3})|((:[0-9a-f]{1,4})?:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9a-f]{1,4}:){3}(((:[0-9a-f]{1,4}){1,4})|((:[0-9a-f]{1,4}){0,2}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9a-f]{1,4}:){2}(((:[0-9a-f]{1,4}){1,5})|((:[0-9a-f]{1,4}){0,3}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9a-f]{1,4}:){1}(((:[0-9a-f]{1,4}){1,6})|((:[0-9a-f]{1,4}){0,4}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(:(((:[0-9a-f]{1,4}){1,7})|((:[0-9a-f]{1,4}){0,5}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:)))(%.+)?\s*$' // IPv6
          r')$',
        );
        if (ipRegex.hasMatch(value) == true) {
          setState(() {
            localDnsError = null;
            allDataValid = true;
          });
        } else {
          setState(() {
            localDnsError = locale.invalidIpAddress;
            allDataValid = false;
          });
        }
      } else {
        setState(() {
          localDnsError = locale.invalidIpAddress;
          allDataValid = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final locale = AppLocalizations.of(context)!;

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
                            onChanged: validateHostName,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.computer_rounded),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              labelText: locale.hostname,
                              error: localDnsError != null
                                  ? Text(
                                      localDnsError ?? '',
                                      overflow: TextOverflow.visible,
                                      softWrap: true,
                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.error,
                                        fontSize: 12,
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      if (widget.keyItem == 'ip')
                        AutoCompleteField<DeviceOption>(
                          icon: Icons.location_on_rounded,
                          labelText: locale.ipAddress,
                          hintText: locale.ipAddress,
                          items: widget.devices!,
                          controller: localDnsController,
                          onChanged: validateIp,
                          textOf: (item) => item.ip,
                          subtitleOf: (item) =>
                              '${item.hwaddr} (${item.macVendor})',
                          visualDensity: const VisualDensity(vertical: -4),
                          expandAnimationDurationMilliseconds: 160,
                          initialText: localDnsController.text,
                          errorText: localDnsError != null
                              ? locale.invalidIpAddress
                              : null,
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
                    child: Text(locale.cancel),
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
                                widget.localDns.ip,
                              );
                            }
                            if (widget.keyItem == 'ip') {
                              widget.onConfirm(
                                widget.localDns.copyWith(
                                  ip: localDnsController.text,
                                ),
                                widget.localDns.ip,
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
                    child: Text(locale.edit),
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
