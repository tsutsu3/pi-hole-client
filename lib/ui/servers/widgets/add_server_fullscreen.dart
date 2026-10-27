import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/domain/model/app/app_log.dart';
import 'package:pi_hole_client/domain/model/server/api_versions.dart';
import 'package:pi_hole_client/domain/model/server/secret_input.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/certificate/certificate_trust_flow.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/components/totp_input_modal.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/urls.dart';
import 'package:pi_hole_client/ui/core/ui/modals/scan_token_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/ui/servers/view_models/add_server_viewmodel.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:pi_hole_client/utils/open_url.dart';
import 'package:pi_hole_client/utils/tls_certificate.dart';
import 'package:pi_hole_client/utils/url.dart';
import 'package:pi_hole_client/utils/validators.dart';
import 'package:provider/provider.dart';

class AddServerFullscreen extends StatefulWidget {
  const AddServerFullscreen({
    required this.window,
    required this.title,
    super.key,
    this.server,
    this.fetchTlsCertificate = fetchTlsCertificateInfo,
  });

  final Server? server;
  final bool window;
  final String title;
  final TlsCertificateFetcher fetchTlsCertificate;

  @override
  State<AddServerFullscreen> createState() => _AddServerFullscreenState();
}

enum ConnectionType { http, https }

enum _SecretsLoadStatus { loading, loaded, failed }

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
  bool allowUntrustedCert = true;
  bool ignoreCertificateErrors = false;
  String? pinnedCertificateSha256;

  bool isConnecting = false;

  /// Created lazily on the first connect/save so that simply opening this
  /// screen (e.g. the add-server dialog) does not require the repository-bundle
  /// factory and status view model to be in scope.
  AddServerViewModel? _viewModel;

  /// The stored password (v6) or token (v5) of the edited server.
  String? _loadedSecret;
  bool _advancedOptionsExpanded = false;

  /// State of the stored secrets on the edit screen.
  _SecretsLoadStatus _secretsLoadStatus = _SecretsLoadStatus.loaded;

  @override
  void initState() {
    super.initState();
    if (widget.server != null) {
      final address = widget.server!.address;
      final uri = Uri.parse(address);
      final splitted = address.split(':');

      // Use Uri for the host and path so multi-segment subroutes such as
      // `/api/v1` are handled correctly.
      addressFieldController.text = uri.host;

      // Uri normalizes explicit default ports such as :80 and :443, so preserve
      // the port from the original URL instead.
      portFieldController.text = splitted.length > 2
          ? splitted[2].split('/')[0]
          : '';

      // A bare '/' carries no routing information, so normalize it to empty.
      subrouteFieldController.text = uri.path == '/' ? '' : uri.path;
      aliasFieldController.text = widget.server!.alias;
      connectionType = uri.scheme == 'https'
          ? ConnectionType.https
          : ConnectionType.http;
      piHoleVersion = widget.server!.apiVersion;
      defaultCheckbox = widget.server!.defaultServer;
      allowUntrustedCert = widget.server!.allowUntrustedCert;
      ignoreCertificateErrors = widget.server!.ignoreCertificateErrors;
      pinnedCertificateSha256 = widget.server!.pinnedCertificateSha256;
      // For edit mode, expand Advanced Options if HTTPS
      _advancedOptionsExpanded = connectionType == ConnectionType.https;
      _secretsLoadStatus = _SecretsLoadStatus.loading;
      _loadSecrets();
    }
  }

  @override
  void dispose() {
    _viewModel?.dispose();
    super.dispose();
  }

  /// Lazily builds the view model on first use, reading its dependencies from
  /// the provider scope only when a connect/save is actually triggered.
  AddServerViewModel _ensureViewModel() {
    return _viewModel ??= AddServerViewModel(
      serversViewModel: context.read<ServersViewModel>(),
      statusViewModel: context.read<StatusViewModel>(),
      createBundle: context.read<CreateRepositoryBundle>(),
    );
  }

  /// Rebuilds so the Save/Connect button re-evaluates [validData].
  void checkDataValid() {
    setState(() {});
  }

  /// Runs [isValid] on a non-empty [value] and stores the resulting error via
  /// [setError]: [invalidMessage] when invalid, [emptyMessage] when empty.
  void _validateField(
    String? value, {
    required bool Function(String) isValid,
    required String invalidMessage,
    required String? emptyMessage,
    required void Function(String?) setError,
  }) {
    final String? error;
    if (value != null && value != '') {
      error = isValid(value) ? null : invalidMessage;
    } else {
      error = emptyMessage;
    }
    setState(() => setError(error));
    checkDataValid();
  }

  void validateAddress(String? value) => _validateField(
    value,
    isValid: isValidServerAddress,
    invalidMessage: AppLocalizations.of(context).invalidAddress,
    emptyMessage: AppLocalizations.of(context).ipCannotEmpty,
    setError: (e) => addressFieldError = e,
  );

  void validateSubroute(String? value) => _validateField(
    value,
    isValid: isValidSubroute,
    invalidMessage: AppLocalizations.of(context).invalidSubroute,
    emptyMessage: null,
    setError: (e) => subrouteFieldError = e,
  );

  void validatePort(String? value) => _validateField(
    value,
    isValid: isValidPort,
    invalidMessage: AppLocalizations.of(context).invalidPort,
    emptyMessage: null,
    setError: (e) => portFieldError = e,
  );

  String _serverUrlFromForm() => buildServerUrl(
    scheme: connectionType.name,
    host: addressFieldController.text,
    port: portFieldController.text,
    subroute: subrouteFieldController.text,
  );

  /// The password (v6) or token (v5) field of the selected version.
  String _secretFromForm() => piHoleVersion == SupportedApiVersions.v6
      ? passwordFieldController.text
      : tokenFieldController.text;

  /// Loads the stored secrets of the edited server into the form.
  Future<void> _loadSecrets() async {
    ({String token, String password})? creds;
    try {
      final serversViewModel = context.read<ServersViewModel>();
      final result = await serversViewModel.fetchCredentials(
        widget.server!.address,
      );
      creds = result.getOrNull();
    } catch (e) {
      creds = null;
    }

    if (!mounted) return;

    setState(() {
      if (creds == null) {
        _secretsLoadStatus = _SecretsLoadStatus.failed;

        return;
      }

      passwordFieldController.text = creds.password;
      tokenFieldController.text = creds.token;
      _loadedSecret = widget.server!.apiVersion == SupportedApiVersions.v6
          ? creds.password
          : creds.token;
      _secretsLoadStatus = _SecretsLoadStatus.loaded;
    });
  }

  void _reloadSecrets() {
    setState(() => _secretsLoadStatus = _SecretsLoadStatus.loading);
    _loadSecrets();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    if (widget.window) {
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
                          tooltip: AppLocalizations.of(
                            context,
                          ).howCreateConnection,
                        ),
                        IconButton(
                          tooltip: widget.server != null
                              ? AppLocalizations.of(context).save
                              : AppLocalizations.of(context).connect,
                          onPressed: validData()
                              ? widget.server != null
                                    ? updateServer
                                    : createServer
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
                  tooltip: AppLocalizations.of(context).howCreateConnection,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    tooltip: widget.server != null
                        ? AppLocalizations.of(context).save
                        : AppLocalizations.of(context).connect,
                    onPressed: validData()
                        ? widget.server != null
                              ? updateServer
                              : createServer
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
            opacity: isConnecting ? 1 : 0,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: IgnorePointer(
              ignoring: !isConnecting,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Container(
                  width: mediaQuery.size.width,
                  height: mediaQuery.size.height,
                  color: const Color.fromRGBO(0, 0, 0, 0.7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(color: Colors.white),
                      const SizedBox(height: 30),
                      Text(
                        AppLocalizations.of(context).connecting,
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

  /// Shows a snackbar with an error message
  void handleApiErrorResult({
    required BuildContext context,
    required AppConfigViewModel appConfigViewModel,
    required Exception error,
    required String version,
  }) {
    final loc = AppLocalizations.of(context);

    String label;

    if (error is TotpRateLimitException) {
      label = loc.mfaRateLimited;
    } else if (error is HttpStatusCodeException) {
      switch (error.statusCode) {
        case 401:
          // Authentication failure - distinct from a network problem.
          label = version == SupportedApiVersions.v6
              ? loc.loginPasswordIncorrect
              : loc.loginTokenInvalid;
        case 495:
          label = loc.sslErrorLong;
        case 503:
          label = loc.checkAddress;
        case 504:
          label = loc.connectionTimeout;
        default:
          label = loc.cantReachServer;
      }
    } else {
      label = loc.unknownError;
    }

    showErrorSnackBar(
      context: context,
      appConfigViewModel: appConfigViewModel,
      label: label,
    );

    appConfigViewModel.addLog(
      AppLog(
        type: 'login',
        dateTime: DateTime.now(),
        message: error.toString(),
      ),
    );
  }

  /// Hides the connecting overlay after an unexpected error in the save
  /// command. Command.globalExceptionHandler has already reported the error.
  void _onSaveError(AppConfigViewModel appConfigViewModel) {
    if (!mounted) return;
    setState(() {
      isConnecting = false;
    });
    showErrorSnackBar(
      context: context,
      appConfigViewModel: appConfigViewModel,
      label: AppLocalizations.of(context).unknownError,
    );
  }

  Future<void> createServer() async {
    final appConfigViewModel = context.read<AppConfigViewModel>();
    final viewModel = _ensureViewModel();
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      isConnecting = true;
    });
    if (!allowUntrustedCert) {
      pinnedCertificateSha256 = null;
    }

    final url = _serverUrlFromForm();

    final CreateOutcome outcome;
    try {
      outcome = await viewModel.createServer.runAsync(
        CreateServerRequest(
          url: url,
          alias: aliasFieldController.text,
          apiVersion: piHoleVersion,
          allowUntrustedCert: allowUntrustedCert,
          ignoreCertificateErrors: ignoreCertificateErrors,
          pinnedCertificateSha256: pinnedCertificateSha256,
          secret: NewSecret(_secretFromForm()),
          defaultServer: defaultCheckbox,
          resolveCertificate: (serverObj) => CertificateTrustFlow(
            appConfigViewModel: appConfigViewModel,
            fetch: widget.fetchTlsCertificate,
          ).checkBeforeSave(context, serverObj),
          resolveTotp: ({error}) => showTotpInputModal(context, error: error),
        ),
      );
    } catch (_) {
      _onSaveError(appConfigViewModel);
      return;
    }

    if (!mounted) return;
    setState(() {
      isConnecting = false;
    });
    switch (outcome) {
      case CreateInitial():
      case CreateCancelled():
        break;
      case CreateDuplicateUrl():
        showErrorSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context).connectionAlreadyExists,
        );
      case CreateUrlCheckFailed():
        showErrorSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context).cannotCheckUrlSaved,
        );
      case CreateApiError(:final error, :final version):
        handleApiErrorResult(
          context: context,
          appConfigViewModel: appConfigViewModel,
          error: error,
          version: version,
        );
      case CreateDbError():
        showErrorSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context).cantSaveConnectionData,
        );
      case CreateSuccess():
        await Navigator.maybePop(context);
        if (!mounted) return;
        showSuccessSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context).connectedSuccessfully,
        );
    }
  }

  Future<void> updateServer() async {
    final appConfigViewModel = context.read<AppConfigViewModel>();
    final viewModel = _ensureViewModel();
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      isConnecting = true;
    });

    if (!allowUntrustedCert) {
      pinnedCertificateSha256 = null;
    }

    final newUrl = _serverUrlFromForm();

    // A version switch uses the other field, so its value is always new.
    final value = _secretFromForm();
    final isUnchanged =
        piHoleVersion == widget.server!.apiVersion && value == _loadedSecret;
    final secret = isUnchanged ? UnchangedSecret(value) : NewSecret(value);

    final UpdateOutcome outcome;
    try {
      outcome = await viewModel.updateServer.runAsync(
        UpdateServerRequest(
          url: newUrl,
          alias: aliasFieldController.text,
          apiVersion: piHoleVersion,
          allowUntrustedCert: allowUntrustedCert,
          ignoreCertificateErrors: ignoreCertificateErrors,
          pinnedCertificateSha256: pinnedCertificateSha256,
          secret: secret,
          defaultServer: defaultCheckbox,
          oldServer: widget.server!,
          resolveCertificate: (serverObj) => CertificateTrustFlow(
            appConfigViewModel: appConfigViewModel,
            fetch: widget.fetchTlsCertificate,
          ).checkBeforeSave(context, serverObj),
          resolveTotp: ({error}) => showTotpInputModal(context, error: error),
        ),
      );
    } catch (_) {
      _onSaveError(appConfigViewModel);
      return;
    }

    if (!mounted) return;
    setState(() {
      isConnecting = false;
    });
    switch (outcome) {
      case UpdateInitial():
      case UpdateCancelled():
        break;
      case UpdateDuplicateUrl():
        showErrorSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context).connectionAlreadyExists,
        );
      case UpdateUrlCheckFailed():
        showErrorSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context).cannotCheckUrlSaved,
        );
      case UpdateApiError(:final error, :final version):
        handleApiErrorResult(
          context: context,
          appConfigViewModel: appConfigViewModel,
          error: error,
          version: version,
        );
      case UpdateDbError():
        showErrorSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context).cantSaveConnectionData,
        );
      case UpdateSuccess():
        await Navigator.maybePop(context);
        if (!mounted) return;
        showSuccessSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context).editServerSuccessfully,
        );
    }
  }

  bool validData() {
    final fieldsFilled =
        addressFieldController.text != '' &&
        subrouteFieldError == null &&
        addressFieldError == null &&
        portFieldError == null &&
        aliasFieldController.text != '';
    if (!fieldsFilled) return false;

    return _secretsLoadStatus == _SecretsLoadStatus.loaded;
  }

  Widget _buildSecretsLoadError(BuildContext context) {
    final errorColor = Theme.of(context).colorScheme.error;

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Icon(Icons.error_outline_rounded, size: 20, color: errorColor),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              AppLocalizations.of(context).couldntLoadCredentials,
              style: TextStyle(color: errorColor),
            ),
          ),
          TextButton(
            onPressed: _reloadSecrets,
            style: TextButton.styleFrom(foregroundColor: errorColor),
            child: Text(AppLocalizations.of(context).reload),
          ),
        ],
      ),
    );
  }

  void openScanTokenModal() {
    showDialog(
      context: context,
      useRootNavigator:
          false, // Prevents unexpected app exit on mobile when pressing back
      builder: (context) => ScanTokenModal(
        qrScanned: (value) => setState(() => tokenFieldController.text = value),
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
                    labelText: AppLocalizations.of(context).token,
                  ),
                ),
              ),
              if (Platform.isAndroid || Platform.isIOS) ...[
                const SizedBox(width: 16),
                IconButton(
                  onPressed: openScanTokenModal,
                  icon: const Icon(Icons.qr_code_rounded),
                  tooltip: AppLocalizations.of(context).scanQrCode,
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
                  child: Text(AppLocalizations.of(context).tokenInstructions),
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
                    labelText: AppLocalizations.of(context).password,
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
    final appColors = Theme.of(context).extension<AppColors>()!;

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.05),
                ),
                child: Column(
                  children: [
                    Text(
                      _serverUrlFromForm(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              SectionLabel(
                label: AppLocalizations.of(context).connection,
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
                    labelText: AppLocalizations.of(context).serverName,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: double.maxFinite,
                child: SegmentedButton<ConnectionType>(
                  segments: const [
                    ButtonSegment(
                      value: ConnectionType.http,
                      label: Text('HTTP'),
                    ),
                    ButtonSegment(
                      value: ConnectionType.https,
                      label: Text('HTTPS'),
                    ),
                  ],
                  selected: <ConnectionType>{connectionType},
                  onSelectionChanged: (value) => setState(() {
                    connectionType = value.first;
                    // Expand Advanced Options when HTTPS is selected, collapse for HTTP
                    _advancedOptionsExpanded =
                        connectionType == ConnectionType.https;
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  onChanged: validateAddress,
                  controller: addressFieldController,
                  decoration: InputDecoration(
                    errorText: addressFieldError,
                    prefixIcon: const Icon(Icons.link),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: AppLocalizations.of(context).address,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  onChanged: validatePort,
                  controller: portFieldController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    errorText: portFieldError,
                    prefixIcon: const Icon(Icons.numbers),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: AppLocalizations.of(context).port,
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
                  key: ValueKey(_advancedOptionsExpanded),
                  tilePadding: EdgeInsets.zero,
                  initiallyExpanded: _advancedOptionsExpanded,
                  onExpansionChanged: (expanded) {
                    setState(() {
                      _advancedOptionsExpanded = expanded;
                    });
                  },
                  title: SectionLabel(
                    label: AppLocalizations.of(context).advancedOptions,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  children: [
                    TextFormField(
                      onChanged: validateSubroute,
                      controller: subrouteFieldController,
                      decoration: InputDecoration(
                        errorText: subrouteFieldError,
                        errorMaxLines: 2,
                        prefixIcon: const Icon(Icons.route_rounded),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: AppLocalizations.of(context).subrouteField,
                        hintText: AppLocalizations.of(context).subrouteExample,
                        helperText: AppLocalizations.of(context).subrouteHelper,
                      ),
                    ),
                    const SizedBox(height: 12),
                    CheckboxListTile(
                      contentPadding: const EdgeInsets.only(right: 8),
                      value: allowUntrustedCert,
                      onChanged:
                          connectionType == ConnectionType.https &&
                              !ignoreCertificateErrors
                          ? (v) => setState(() {
                              allowUntrustedCert = v!;
                              if (!allowUntrustedCert) {
                                pinnedCertificateSha256 = null;
                              }
                            })
                          : null,
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context).allowUntrustedCert,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.help_outline_rounded),
                            onPressed: () => openUrl(Urls.certConfigGuide),
                            tooltip: AppLocalizations.of(
                              context,
                            ).learnMoreAboutCertificates,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 40,
                              minHeight: 40,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        AppLocalizations.of(
                          context,
                        ).allowUntrustedCertDescription,
                        style: TextStyle(
                          fontSize: 12,
                          color: appColors.queryOrange,
                        ),
                      ),
                    ),
                    CheckboxListTile(
                      contentPadding: const EdgeInsets.only(right: 8),
                      value: ignoreCertificateErrors,
                      onChanged: connectionType == ConnectionType.https
                          ? (v) => setState(() => ignoreCertificateErrors = v!)
                          : null,
                      title: Text(
                        AppLocalizations.of(context).dontCheckCertificate,
                      ),
                      subtitle: Text(
                        AppLocalizations.of(
                          context,
                        ).dontCheckCertificateDescription,
                        style: TextStyle(
                          fontSize: 12,
                          color: appColors.queryRed,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              SectionLabel(
                label: AppLocalizations.of(context).version,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context).versionDescription,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: double.maxFinite,
                child: SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(
                      value: SupportedApiVersions.v5,
                      label: Text(SupportedApiVersions.v5),
                    ),
                    ButtonSegment(
                      value: SupportedApiVersions.v6,
                      label: Text(SupportedApiVersions.v6),
                    ),
                  ],
                  selected: <String>{piHoleVersion},
                  onSelectionChanged: (value) {
                    final newVersion = value.first;
                    setState(() {
                      piHoleVersion = newVersion;
                      if (newVersion == SupportedApiVersions.v5) {
                        passwordFieldController.clear();
                      } else {
                        tokenFieldController.clear();
                      }
                    });
                  },
                ),
              ),
              SectionLabel(
                label: AppLocalizations.of(context).authentication,
                padding: const EdgeInsets.only(top: 20),
              ),
              if (_secretsLoadStatus == _SecretsLoadStatus.failed)
                _buildSecretsLoadError(context),
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
                      setState(() => defaultCheckbox = !defaultCheckbox),
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      setState(() => defaultCheckbox = !defaultCheckbox),
                    },
                    child: Text(AppLocalizations.of(context).defaultConnection),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
