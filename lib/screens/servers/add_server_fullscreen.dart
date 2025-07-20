import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/config2/api_versions.dart';
import 'package:pi_hole_client/config2/urls.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/services/status_update_service.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui2/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui2/core/ui/modals/scan_token_modal.dart';
import 'package:pi_hole_client/utils2/open_url.dart';
import 'package:provider/provider.dart';

class AddServerFullscreen extends StatefulWidget {
  const AddServerFullscreen({
    required this.window,
    required this.title,
    super.key,
    this.server,
  });

  final Server? server;
  final bool window;
  final String title;

  @override
  State<AddServerFullscreen> createState() => _AddServerFullscreenState();
}

enum ConnectionType { http, https }

class _AddServerFullscreenState extends State<AddServerFullscreen> {
  TextEditingController addressFieldController = TextEditingController();
  String? addressFieldError;
  TextEditingController portFieldController = TextEditingController();
  String? portFieldError;
  TextEditingController subrouteFieldController = TextEditingController();
  String? subrouteFieldError;
  TextEditingController aliasFieldController = TextEditingController();
  TextEditingController tokenFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  ConnectionType connectionType = ConnectionType.http;
  String piHoleVersion = SupportedApiVersions.v6;
  bool defaultCheckbox = false;
  bool allowSelfSignedCert = true;

  String? errorUrl;
  bool allDataValid = false;

  String errorMessage = 'Failed';

  bool isTokenModalOpen = false;

  bool isConnecting = false;

  String? initToken;
  String? initPassword;

  @override
  void initState() {
    super.initState();
    if (widget.server != null) {
      final splitted = widget.server!.address.split(':');
      addressFieldController.text = splitted[1].split('/')[2];
      portFieldController.text =
          splitted.length > 2 ? splitted[2].split('/')[0] : '';
      subrouteFieldController.text =
          widget.server!.address.split('/').length > 3
              ? '/${widget.server!.address.split('/')[3]}'
              : '';
      aliasFieldController.text = widget.server!.alias;
      connectionType = widget.server!.address.split(':')[0] == 'https'
          ? ConnectionType.https
          : ConnectionType.http;
      piHoleVersion = widget.server!.apiVersion;
      defaultCheckbox = widget.server!.defaultServer;
      allowSelfSignedCert = widget.server!.allowSelfSignedCert;
      _loadSecrets();
    }
  }

  void checkDataValid() {
    if (addressFieldController.text != '' &&
        addressFieldError == null &&
        subrouteFieldError == null &&
        portFieldError == null &&
        aliasFieldController.text != '' &&
        tokenFieldController.text != '' &&
        passwordFieldController.text != '') {
      setState(() {
        allDataValid = true;
      });
    } else {
      setState(() {
        allDataValid = false;
      });
    }
  }

  void validateAddress(String? value) {
    if (value != null && value != '') {
      final ipAddress =
          RegExp(r'^((25[0-5]|(2[0-4]|1\d|[1-9]|)\d)(\.(?!$)|$)){4}$');
      final domain =
          RegExp(r'^(([a-z0-9|-]+\.)*[a-z0-9|-]+\.[a-z]+)|((\w|-)+)$');
      if (ipAddress.hasMatch(value) == true || domain.hasMatch(value) == true) {
        setState(() {
          addressFieldError = null;
        });
      } else {
        setState(() {
          addressFieldError = AppLocalizations.of(context)!.invalidAddress;
        });
      }
    } else {
      setState(() {
        addressFieldError = AppLocalizations.of(context)!.ipCannotEmpty;
      });
    }
    checkDataValid();
  }

  void validateSubroute(String? value) {
    if (value != null && value != '') {
      final subrouteRegexp = RegExp(r'^\/\b([A-Za-z0-9_\-~/]*)[^\/|\.|\:]$');
      if (subrouteRegexp.hasMatch(value) == true) {
        setState(() {
          subrouteFieldError = null;
        });
      } else {
        setState(() {
          subrouteFieldError = AppLocalizations.of(context)!.invalidSubroute;
        });
      }
    } else {
      setState(() {
        subrouteFieldError = null;
      });
    }
    checkDataValid();
  }

  void validatePort(String? value) {
    if (value != null && value != '') {
      if (int.tryParse(value) != null && int.parse(value) <= 65535) {
        setState(() {
          portFieldError = null;
        });
      } else {
        setState(() {
          portFieldError = AppLocalizations.of(context)!.invalidPort;
        });
      }
    } else {
      setState(() {
        portFieldError = null;
      });
    }
    checkDataValid();
  }

  Future<void> _loadSecrets() async {
    if (widget.server != null) {
      try {
        final password = await widget.server!.sm.password;
        final token = await widget.server!.sm.token;

        if (mounted) {
          setState(() {
            passwordFieldController.text = password ?? '';
            tokenFieldController.text = token ?? '';
            initToken = token ?? '';
            initPassword = password ?? '';
          });
        }
      } catch (e) {
        if (mounted) {
          setState(() {
            passwordFieldController.text = '';
            tokenFieldController.text = '';
            initToken = '';
            initPassword = '';
          });
        }
      }
    } else {
      if (mounted) {
        setState(() {
          passwordFieldController.text = '';
          tokenFieldController.text = '';
          initToken = '';
          initPassword = '';
        });
      }
    }
  }

  Future<void> _restoreSecrets() async {
    if (widget.server != null) {
      await widget.server?.sm.savePassword(initPassword!);
      await widget.server?.sm.saveToken(initToken!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final serversProvider = Provider.of<ServersProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);
    final statusUpdateService = context.read<StatusUpdateService>();

    final mediaQuery = MediaQuery.of(context);

    /// Shows a snackbar with an error message
    void handleApiErrorResult({
      required BuildContext context,
      required AppConfigProvider appConfigProvider,
      required LoginQueryResponse? result,
      required String version,
    }) {
      final loc = AppLocalizations.of(context)!;

      String label;

      if (result?.result == APiResponseType.socket) {
        label = loc.checkAddress;
      } else if (result?.result == APiResponseType.timeout) {
        label = loc.connectionTimeout;
      } else if (result?.result == APiResponseType.noConnection) {
        label = loc.cantReachServer;
      } else if (result?.result == APiResponseType.authError) {
        label = version == 'v6' ? loc.passwordNotValid : loc.tokenNotValid;
      } else if (result?.result == APiResponseType.sslError) {
        label = loc.sslErrorLong;
      } else {
        label = loc.unknownError;
      }

      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: label,
      );

      if (result?.log != null) {
        appConfigProvider.addLog(result!.log!);
      }
    }

    Future<void> connect() async {
      FocusManager.instance.primaryFocus?.unfocus();
      setState(() {
        isConnecting = true;
      });
      final url =
          '${connectionType.name}://${addressFieldController.text}${portFieldController.text != '' ? ':${portFieldController.text}' : ''}${subrouteFieldController.text}';
      final exists = await serversProvider.checkUrlExists(url);

      if (!context.mounted) return;

      if (exists['result'] == 'success' && exists['exists'] == true) {
        setState(() {
          errorUrl = AppLocalizations.of(context)!.connectionAlreadyExists;
          isConnecting = false;
        });
      } else if (exists['result'] == 'fail') {
        setState(() {
          errorUrl = null;
          isConnecting = false;
        });
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.cannotCheckUrlSaved,
        );
      } else {
        setState(() {
          errorUrl = null;
        });
        final serverObj = Server(
          address: url,
          alias: aliasFieldController.text,
          defaultServer: false,
          apiVersion: piHoleVersion,
          allowSelfSignedCert: allowSelfSignedCert,
        );
        await serverObj.sm.savePassword(passwordFieldController.text);
        await serverObj.sm.saveToken(tokenFieldController.text);
        final result =
            await serversProvider.loadApiGateway(serverObj)?.loginQuery();
        if (!context.mounted) return;
        if (result?.result == APiResponseType.success) {
          await Navigator.maybePop(context);
          if (!context.mounted) return;
          showSuccessSnackBar(
            context: context,
            appConfigProvider: appConfigProvider,
            label: AppLocalizations.of(context)!.connectedSuccessfully,
          );
          await serversProvider.addServer(
            Server(
              address: serverObj.address,
              alias: serverObj.alias,
              defaultServer: defaultCheckbox,
              apiVersion: piHoleVersion,
              enabled: result!.status == 'enabled' ? true : false,
              allowSelfSignedCert: allowSelfSignedCert,
              sm: serverObj.sm,
            ),
          );
        } else {
          if (mounted) {
            setState(() {
              isConnecting = false;
              _restoreSecrets();
            });

            await serverObj.sm.deletePassword();
            await serverObj.sm.deleteToken();
            if (!context.mounted) return;

            handleApiErrorResult(
              context: context,
              appConfigProvider: appConfigProvider,
              result: result,
              version: piHoleVersion,
            );
          } else {
            isConnecting = false;
          }
        }
      }
    }

    Future<void> save() async {
      FocusManager.instance.primaryFocus?.unfocus();
      setState(() {
        errorUrl = null;
        isConnecting = true;
      });

      final serverObj = Server(
        address: widget.server!.address,
        alias: aliasFieldController.text,
        defaultServer: false,
        apiVersion: piHoleVersion,
        allowSelfSignedCert: allowSelfSignedCert,
      );
      await serverObj.sm.savePassword(passwordFieldController.text);
      await serverObj.sm.saveToken(tokenFieldController.text);
      if (serversProvider.selectedServer != null) {
        statusUpdateService.stopAutoRefresh();
      }
      final result = await serversProvider
          .createApiGateway(serverObj)
          ?.loginQuery(refresh: true);

      if (result?.result == APiResponseType.success) {
        final server = serverObj.copyWith(
          defaultServer: defaultCheckbox,
        );
        final result = await serversProvider.editServer(server);
        if (context.mounted) {
          if (result == true) {
            await Navigator.maybePop(context);
            if (!context.mounted) return;

            showSuccessSnackBar(
              context: context,
              appConfigProvider: appConfigProvider,
              label: AppLocalizations.of(context)!.editServerSuccessfully,
            );
          } else {
            setState(() {
              isConnecting = false;
            });
            showErrorSnackBar(
              context: context,
              appConfigProvider: appConfigProvider,
              label: AppLocalizations.of(context)!.cantSaveConnectionData,
            );
          }
        }
      } else {
        if (context.mounted) {
          setState(() {
            isConnecting = false;
            _restoreSecrets();
          });

          handleApiErrorResult(
            context: context,
            appConfigProvider: appConfigProvider,
            result: result,
            version: piHoleVersion,
          );
        } else {
          isConnecting = false;
        }
      }

      if (serversProvider.selectedServer != null) {
        statusUpdateService.startAutoRefresh();
      }
    }

    bool validData() {
      if (addressFieldController.text != '' &&
          subrouteFieldError == null &&
          addressFieldError == null &&
          aliasFieldController.text != '') {
        return true;
      } else {
        return false;
      }
    }

    void openScanTokenModal() {
      showDialog(
        context: context,
        useRootNavigator:
            false, // Prevents unexpected app exit on mobile when pressing back
        builder: (context) => ScanTokenModal(
          qrScanned: (value) =>
              setState(() => tokenFieldController.text = value),
        ),
      );
    }

    Widget buildV5Settings(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: tokenFieldController,
                    onChanged: (value) => checkDataValid(),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.key_rounded),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: AppLocalizations.of(context)!.token,
                    ),
                  ),
                ),
                if (Platform.isAndroid || Platform.isIOS) ...[
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: openScanTokenModal,
                    icon: const Icon(Icons.qr_code_rounded),
                    tooltip: AppLocalizations.of(context)!.scanQrCode,
                  ),
                ],
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    Icons.info_rounded,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: Text(
                      AppLocalizations.of(context)!.tokenInstructions,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget buildV6Settings(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordFieldController,
                    onChanged: (value) => checkDataValid(),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.key_rounded),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: AppLocalizations.of(context)!.password,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget formItems() {
      return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: 0.05),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${connectionType.name}://${addressFieldController.text}${portFieldController.text != '' ? ':${portFieldController.text}' : ''}${subrouteFieldController.text}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                SectionLabel(
                  label: AppLocalizations.of(context)!.connection,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: aliasFieldController,
                    onChanged: (value) => checkDataValid(),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.badge_outlined),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: AppLocalizations.of(context)!.serverName,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.maxFinite,
                  child: SegmentedButton<ConnectionType>(
                    segments: [
                      ButtonSegment(
                        value: ConnectionType.http,
                        label: const Text('HTTP'),
                        enabled: widget.server != null ? false : true,
                      ),
                      ButtonSegment(
                        value: ConnectionType.https,
                        label: const Text('HTTPS'),
                        enabled: widget.server != null ? false : true,
                      ),
                    ],
                    selected: <ConnectionType>{connectionType},
                    onSelectionChanged: (value) =>
                        setState(() => connectionType = value.first),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    onChanged: validateAddress,
                    controller: addressFieldController,
                    enabled: widget.server != null ? false : true,
                    decoration: InputDecoration(
                      errorText: addressFieldError,
                      prefixIcon: const Icon(Icons.link),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: AppLocalizations.of(context)!.address,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: TextFormField(
                    onChanged: validatePort,
                    controller: portFieldController,
                    enabled: widget.server != null ? false : true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorText: portFieldError,
                      prefixIcon: const Icon(Icons.numbers),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: AppLocalizations.of(context)!.port,
                    ),
                  ),
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    title: SectionLabel(
                      label: AppLocalizations.of(context)!.advancedOptions,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    children: [
                      TextFormField(
                        onChanged: validateSubroute,
                        controller: subrouteFieldController,
                        enabled: widget.server != null ? false : true,
                        decoration: InputDecoration(
                          errorText: subrouteFieldError,
                          prefixIcon: const Icon(Icons.route_rounded),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelText:
                              AppLocalizations.of(context)!.subrouteField,
                          hintText:
                              AppLocalizations.of(context)!.subrouteExample,
                          helperText:
                              AppLocalizations.of(context)!.subrouteHelper,
                        ),
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        contentPadding: const EdgeInsets.only(right: 8),
                        value: allowSelfSignedCert,
                        onChanged: connectionType == ConnectionType.https
                            ? (v) => setState(() => allowSelfSignedCert = v!)
                            : null,
                        title: Text(
                          AppLocalizations.of(context)!
                              .allowSelfSignedCertificates,
                        ),
                        subtitle: Text(
                          AppLocalizations.of(context)!.onlyAvailableWithHttps,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                SectionLabel(
                  label: AppLocalizations.of(context)!.version,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!.versionDescription,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.maxFinite,
                  child: SegmentedButton<String>(
                    segments: [
                      ButtonSegment(
                        value: SupportedApiVersions.v5,
                        label: const Text(SupportedApiVersions.v5),
                        enabled: widget.server != null ? false : true,
                      ),
                      ButtonSegment(
                        value: SupportedApiVersions.v6,
                        label: const Text(SupportedApiVersions.v6),
                        enabled: widget.server != null ? false : true,
                      ),
                    ],
                    selected: <String>{piHoleVersion},
                    onSelectionChanged: (value) =>
                        setState(() => piHoleVersion = value.first),
                  ),
                ),
                SectionLabel(
                  label: AppLocalizations.of(context)!.authentication,
                  padding: const EdgeInsets.only(top: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: piHoleVersion == SupportedApiVersions.v5
                      ? buildV5Settings(context)
                      : buildV6Settings(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: defaultCheckbox,
                      onChanged: (value) => {
                        setState(
                          () => defaultCheckbox = !defaultCheckbox,
                        ),
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        setState(
                          () => defaultCheckbox = !defaultCheckbox,
                        ),
                      },
                      child: Text(
                        AppLocalizations.of(context)!.defaultConnection,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (errorUrl != null)
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    errorUrl!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
        ],
      );
    }

    if (widget.window == true) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(vertical: 24),
        child: SizedBox(
          width: 400,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.maybePop(context),
                          icon: const Icon(Icons.clear_rounded),
                        ),
                        Text(
                          widget.title,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => openUrl(Urls.createAConnection),
                          icon: const Icon(Icons.help_outline_rounded),
                          tooltip:
                              AppLocalizations.of(context)!.howCreateConnection,
                        ),
                        IconButton(
                          tooltip: widget.server != null
                              ? AppLocalizations.of(context)!.save
                              : AppLocalizations.of(context)!.connect,
                          onPressed: validData()
                              ? widget.server != null
                                  ? save
                                  : connect
                              : null,
                          icon: widget.server != null
                              ? const Icon(Icons.save_rounded)
                              : const Icon(Icons.login_rounded),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(child: formItems()),
            ],
          ),
        ),
      );
    } else {
      return Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              actions: [
                IconButton(
                  onPressed: () => openUrl(Urls.createAConnection),
                  icon: const Icon(Icons.help_outline_rounded),
                  tooltip: AppLocalizations.of(context)!.howCreateConnection,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    tooltip: widget.server != null
                        ? AppLocalizations.of(context)!.save
                        : AppLocalizations.of(context)!.connect,
                    onPressed: validData()
                        ? widget.server != null
                            ? save
                            : connect
                        : null,
                    icon: widget.server != null
                        ? const Icon(Icons.save_rounded)
                        : const Icon(Icons.login_rounded),
                  ),
                ),
              ],
              toolbarHeight: 70,
            ),
            body: formItems(),
          ),
          AnimatedOpacity(
            opacity: isConnecting == true ? 1 : 0,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: IgnorePointer(
              ignoring: isConnecting == true ? false : true,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Container(
                  width: mediaQuery.size.width,
                  height: mediaQuery.size.height,
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
          ),
        ],
      );
    }
  }
}
