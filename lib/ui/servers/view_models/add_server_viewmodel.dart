// NOTE: This view model intentionally depends on [ServersViewModel] and
// [StatusViewModel] (a cross-view-model dependency). The server-list mutations
// (addServer/editServer/replaceServer) are Commands whose notify/refresh side
// effects must be preserved, so the orchestration reuses them rather than the
// lower-level repositories. The certificate UI (pin dialog, ssl error snackbar)
// stays in the widget and is injected per request via [resolveCertificate].

/// @docImport 'package:pi_hole_client/ui/servers/widgets/add_server_fullscreen.dart';
library;

import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/domain/model/server/api_versions.dart';
import 'package:pi_hole_client/domain/model/server/secret_input.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/domain/model/server/server_auth.dart';
import 'package:pi_hole_client/domain/use_cases/server_connection/connect_server_usecase.dart';
import 'package:pi_hole_client/domain/use_cases/server_connection/resolve_totp.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/url.dart';

/// Resolves and validates the certificate for [server], returning the updated
/// server (possibly with a pinned fingerprint) or `null` when the user cancels
/// or the certificate is rejected. The dialog and ssl-error snackbar live in the
/// widget; the view model only decides what to do with the result.
///
/// In the app, it calls `validateAndUpdateServerCertificate` in
/// [AddServerFullscreen].
typedef ResolveCertificate = Future<Server?> Function(Server server);

/// Request for [AddServerViewModel.createServer] (adding a new server).
class CreateServerRequest {
  const CreateServerRequest({
    required this.url,
    required this.alias,
    required this.apiVersion,
    required this.allowUntrustedCert,
    required this.ignoreCertificateErrors,
    required this.pinnedCertificateSha256,
    required this.secret,
    required this.defaultServer,
    required this.resolveCertificate,
    required this.resolveTotp,
  });

  final String url;
  final String alias;
  final String apiVersion;
  final bool allowUntrustedCert;
  final bool ignoreCertificateErrors;
  final String? pinnedCertificateSha256;

  /// The password (v6) or token (v5). Always a [NewSecret]
  final SecretInput secret;
  final bool defaultServer;
  final ResolveCertificate resolveCertificate;
  final ResolveTotp resolveTotp;
}

/// Request for [AddServerViewModel.updateServer] (editing an existing server).
class UpdateServerRequest {
  const UpdateServerRequest({
    required this.url,
    required this.alias,
    required this.apiVersion,
    required this.allowUntrustedCert,
    required this.ignoreCertificateErrors,
    required this.pinnedCertificateSha256,
    required this.secret,
    required this.defaultServer,
    required this.oldServer,
    required this.resolveCertificate,
    required this.resolveTotp,
  });

  final String url;
  final String alias;
  final String apiVersion;
  final bool allowUntrustedCert;
  final bool ignoreCertificateErrors;
  final String? pinnedCertificateSha256;

  /// The password (v6) or token (v5) for [apiVersion].
  final SecretInput secret;
  final bool defaultServer;
  final Server oldServer;
  final ResolveCertificate resolveCertificate;
  final ResolveTotp resolveTotp;
}

// ==================================================================
// Outcome of [AddServerViewModel.createServer], mapped to UI by the widget.
// ==================================================================
sealed class CreateOutcome {
  const CreateOutcome();
}

final class CreateInitial extends CreateOutcome {
  const CreateInitial();
}

final class CreateSuccess extends CreateOutcome {
  const CreateSuccess(this.server);
  final Server server;
}

final class CreateCancelled extends CreateOutcome {
  const CreateCancelled();
}

final class CreateDuplicateUrl extends CreateOutcome {
  const CreateDuplicateUrl();
}

final class CreateUrlCheckFailed extends CreateOutcome {
  const CreateUrlCheckFailed();
}

final class CreateApiError extends CreateOutcome {
  const CreateApiError(this.error, this.version);
  final Exception error;
  final String version;
}

final class CreateDbError extends CreateOutcome {
  const CreateDbError();
}

// ==================================================================
// Outcome of [AddServerViewModel.updateServer], mapped to UI by the widget.
// ==================================================================
sealed class UpdateOutcome {
  const UpdateOutcome();
}

final class UpdateInitial extends UpdateOutcome {
  const UpdateInitial();
}

final class UpdateSuccess extends UpdateOutcome {
  const UpdateSuccess();
}

final class UpdateCancelled extends UpdateOutcome {
  const UpdateCancelled();
}

final class UpdateDuplicateUrl extends UpdateOutcome {
  const UpdateDuplicateUrl();
}

final class UpdateUrlCheckFailed extends UpdateOutcome {
  const UpdateUrlCheckFailed();
}

final class UpdateApiError extends UpdateOutcome {
  const UpdateApiError(this.error, this.version);
  final Exception error;
  final String version;
}

final class UpdateDbError extends UpdateOutcome {
  const UpdateDbError();
}

/// Result of a server-URL uniqueness check.
enum _UrlCheck { available, duplicate, failed }

/// Orchestrates adding ([createServer]) and editing ([updateServer]) a Pi-hole
/// server.
///
/// The view model owns the pure orchestration (URL uniqueness check, credential
/// storage, session creation/teardown, blocking-status probe, DB commit and
/// rollback). UI reactions (snackbars, navigation, the certificate dialog and
/// the connecting overlay) stay in the widget and are driven by the returned
/// sealed outcomes.
class AddServerViewModel extends ChangeNotifier {
  AddServerViewModel({
    required ServersViewModel serversViewModel,
    required StatusViewModel statusViewModel,
    required CreateRepositoryBundle createBundle,
  }) : _serversViewModel = serversViewModel,
       _statusViewModel = statusViewModel,
       _createBundle = createBundle {
    createServer = Command.createAsync<CreateServerRequest, CreateOutcome>(
      _createServer,
      initialValue: const CreateInitial(),
    );
    updateServer = Command.createAsync<UpdateServerRequest, UpdateOutcome>(
      _updateServer,
      initialValue: const UpdateInitial(),
    );
    createServer.addListener(notifyListeners);
    updateServer.addListener(notifyListeners);
  }

  final ServersViewModel _serversViewModel;
  final StatusViewModel _statusViewModel;
  final CreateRepositoryBundle _createBundle;

  late final Command<CreateServerRequest, CreateOutcome> createServer;
  late final Command<UpdateServerRequest, UpdateOutcome> updateServer;

  /// Maps [ServersViewModel.checkUrlExists]'s map result to a typed [_UrlCheck].
  Future<_UrlCheck> _checkUrl(String url) async {
    final result = await _serversViewModel.checkUrlExists(url);
    if (result['result'] == 'fail') return _UrlCheck.failed;

    return result['exists'] == true ? _UrlCheck.duplicate : _UrlCheck.available;
  }

  /// Adds a new server.
  ///
  /// Steps:
  ///   1. Check the URL is not in use.
  ///   2. Resolve the certificate.
  ///   3. Check the connection. The password / token is passed in, not stored.
  ///   4. Save the password / token.
  ///   5. Save the server to the DB.
  ///
  /// Nothing is stored before step 4. When step 4 or 5 fails, what this
  /// attempt stored is removed.
  ///
  /// Returns [CreateSuccess], [CreateCancelled], [CreateDuplicateUrl],
  /// [CreateUrlCheckFailed], [CreateApiError] or [CreateDbError].
  Future<CreateOutcome> _createServer(CreateServerRequest req) async {
    switch (await _checkUrl(req.url)) {
      case _UrlCheck.duplicate:
        return const CreateDuplicateUrl();
      case _UrlCheck.failed:
        return const CreateUrlCheckFailed();
      case _UrlCheck.available:
        break;
    }

    final resolved = await req.resolveCertificate(
      Server(
        address: req.url,
        alias: req.alias,
        apiVersion: req.apiVersion,
        allowUntrustedCert: req.allowUntrustedCert,
        ignoreCertificateErrors: req.ignoreCertificateErrors,
        pinnedCertificateSha256: req.pinnedCertificateSha256,
      ),
    );
    if (resolved == null) {
      return const CreateCancelled();
    }

    final server = resolved.copyWith(defaultServer: req.defaultServer);
    final secret = req.secret.value;
    final bundle = _createBundleWithSecret(server, secret);
    final outcome = await _connect(
      bundle,
      server,
      secret,
      SessionPolicy.forceNew,
      req.resolveTotp,
    );

    final ConnectSuccess connected;
    switch (outcome) {
      case ConnectCancelled():
        return const CreateCancelled();
      case ConnectFailed(:final error, :final sessionCreated):
        await _cleanupFailedAttempt(
          bundle: bundle,
          address: req.url,
          isNewAddress: true,
          sessionCreated: sessionCreated,
        );

        return CreateApiError(error, req.apiVersion);
      case ConnectSuccess():
        connected = outcome;
    }

    var saved = await _saveSecret(server, secret);
    if (saved) {
      try {
        await _serversViewModel.addServer.runAsync(server);
      } catch (e, s) {
        logger.e('Failed to save new server', error: e, stackTrace: s);
        saved = false;
      }
    }
    if (!saved) {
      await _cleanupFailedAttempt(
        bundle: bundle,
        address: req.url,
        isNewAddress: true,
        sessionCreated: connected.sessionCreated,
        secretSaved: true,
      );

      return const CreateDbError();
    }

    return CreateSuccess(server);
  }

  /// Edits an existing server.
  ///
  /// Steps:
  ///   1. Check the new URL is not in use (only when the address changed).
  ///   2. Resolve the certificate.
  ///   3. Check the connection. The password / token is passed in, not stored.
  ///   4. Save the password / token, if it is new.
  ///   5. Save the server to the DB.
  ///   6. Clean up the old server.
  ///
  /// A new address, a version switch or a [NewSecret] is checked with a new
  /// session. Otherwise the current session is used while it still works.
  ///
  /// Auto refresh is stopped while it runs and started again on every exit.
  ///
  /// Returns [UpdateSuccess], [UpdateCancelled], [UpdateDuplicateUrl],
  /// [UpdateUrlCheckFailed], [UpdateApiError] or [UpdateDbError].
  Future<UpdateOutcome> _updateServer(UpdateServerRequest req) async {
    // Normalised comparison: a host-case-only or trailing-slash difference is
    // NOT an address change and must stay on the in-place editServer path.
    final isAddressChanged = !isSameEndpoint(req.oldServer.address, req.url);

    if (isAddressChanged) {
      switch (await _checkUrl(req.url)) {
        case _UrlCheck.duplicate:
          return const UpdateDuplicateUrl();
        case _UrlCheck.failed:
          return const UpdateUrlCheckFailed();
        case _UrlCheck.available:
          break;
      }
    }

    if (_serversViewModel.selectedServer != null) {
      _statusViewModel.stopAutoRefresh();
    }

    try {
      return await _saveEdit(req, isAddressChanged);
    } finally {
      if (_serversViewModel.selectedServer != null) {
        _statusViewModel.startAutoRefresh();
      }
    }
  }

  Future<UpdateOutcome> _saveEdit(
    UpdateServerRequest req,
    bool isAddressChanged,
  ) async {
    final attempt = _SaveAttempt(
      req: req,
      isAddressChanged: isAddressChanged,
      serversViewModel: _serversViewModel,
      createBundle: _createBundle,
    );
    final address = attempt.targetAddress;

    final resolved = await req.resolveCertificate(
      Server(
        address: address,
        alias: req.alias,
        apiVersion: req.apiVersion,
        allowUntrustedCert: req.allowUntrustedCert,
        ignoreCertificateErrors: req.ignoreCertificateErrors,
        // When the address changes the target is effectively a different host,
        // so any pinned certificate carried over from the old server is stale.
        // Reset it to null so the certificate check re-runs against the new
        // host.
        pinnedCertificateSha256: isAddressChanged
            ? null
            : req.pinnedCertificateSha256,
      ),
    );
    if (resolved == null) {
      return const UpdateCancelled();
    }

    final server = resolved.copyWith(defaultServer: req.defaultServer);
    final secret = req.secret.value;
    // A version switch uses the other key, which is not stored yet.
    final isNew =
        isAddressChanged ||
        req.apiVersion != req.oldServer.apiVersion ||
        req.secret is NewSecret;
    final bundle = _createBundleWithSecret(server, secret);
    final outcome = await _connect(
      bundle,
      server,
      secret,
      isNew ? SessionPolicy.forceNew : SessionPolicy.reuseIfValid,
      req.resolveTotp,
    );

    final ConnectSuccess connected;
    switch (outcome) {
      case ConnectCancelled():
        // The user closed the TOTP dialog.
        _serversViewModel.markTotpReauthDeclined(address);
        await _cleanupFailedAttempt(
          bundle: bundle,
          address: address,
          isNewAddress: isAddressChanged,
          sessionCreated: false,
        );

        return const UpdateCancelled();
      case ConnectFailed(:final error, :final sessionCreated):
        await _cleanupFailedAttempt(
          bundle: bundle,
          address: address,
          isNewAddress: isAddressChanged,
          sessionCreated: sessionCreated,
        );

        return UpdateApiError(error, req.apiVersion);
      case ConnectSuccess():
        connected = outcome;
    }

    final saved =
        (!isNew || await _saveSecret(server, secret)) &&
        await attempt.commit(server) == null;
    if (!saved) {
      await _cleanupFailedAttempt(
        bundle: bundle,
        address: address,
        isNewAddress: isAddressChanged,
        sessionCreated: connected.sessionCreated,
        secretSaved: isNew,
      );

      return const UpdateDbError();
    }

    await attempt.cleanupAfterCommit();
    _serversViewModel.clearTotpReauthDeclined(address);

    return const UpdateSuccess();
  }

  /// Creates the bundle for [server]. The v5 repositories use [secret] as the
  /// token, so the connection can be checked before the token is stored.
  RepositoryBundle _createBundleWithSecret(Server server, String secret) {
    return _createBundle(
      server: server,
      token: server.apiVersion == SupportedApiVersions.v6 ? null : secret,
    );
  }

  /// Stores [secret] as the password (v6) or the token (v5) of [server].
  /// Returns false when the write fails.
  Future<bool> _saveSecret(Server server, String secret) async {
    final result = server.apiVersion == SupportedApiVersions.v6
        ? await _serversViewModel.savePassword(server.address, secret)
        : await _serversViewModel.saveToken(server.address, secret);

    return result.isSuccess();
  }

  /// Removes what a failed attempt left under [address].
  ///
  /// The stored password / token is removed only for a new address. With the
  /// same address it is kept: it was not changed, or it passed the check.
  Future<void> _cleanupFailedAttempt({
    required RepositoryBundle bundle,
    required String address,
    required bool isNewAddress,
    required bool sessionCreated,
    bool secretSaved = false,
  }) async {
    // When this attempt logged in, log out the new session on the server.
    if (sessionCreated) {
      try {
        await bundle.auth.deleteCurrentSession();
      } catch (e, s) {
        logger.w(
          'Failed to delete new session on server',
          error: e,
          stackTrace: s,
        );
      }
    }

    // When the address is new, remove the SID stored there.
    // When the address is the same and a new session was made, remove the SID.
    // The stored SID is now the new session's SID, and that session was logged
    // out above, so the SID no longer works.
    if (isNewAddress || sessionCreated) {
      await _serversViewModel.deleteSid(address);
    }

    // When the address is new and the password / token was stored there,
    // remove it.
    if (isNewAddress && secretSaved) {
      await _serversViewModel.deletePassword(address);
      await _serversViewModel.deleteToken(address);
    }
  }

  /// Checks the connection to [server] with [secret], the password (v6) or
  /// the token (v5).
  Future<ConnectOutcome> _connect(
    RepositoryBundle bundle,
    Server server,
    String secret,
    SessionPolicy policy,
    ResolveTotp resolveTotp,
  ) {
    return ConnectServerUseCase(auth: bundle.auth, dns: bundle.dns).connect(
      auth: ServerAuth.of(server, (password: secret, token: secret)),
      policy: policy,
      resolveTotp: resolveTotp,
    );
  }

  @override
  void dispose() {
    createServer.removeListener(notifyListeners);
    updateServer.removeListener(notifyListeners);
    super.dispose();
  }
}

/// One run of [AddServerViewModel.updateServer]: the DB commit and the cleanup
/// of the old server, which both depend on the old and the target address.
class _SaveAttempt {
  _SaveAttempt({
    required this.req,
    required this.isAddressChanged,
    required ServersViewModel serversViewModel,
    required CreateRepositoryBundle createBundle,
  }) : _serversViewModel = serversViewModel,
       _createBundle = createBundle;

  final UpdateServerRequest req;
  final bool isAddressChanged;
  final ServersViewModel _serversViewModel;
  final CreateRepositoryBundle _createBundle;

  String get oldAddress => req.oldServer.address;
  String get targetAddress => isAddressChanged ? req.url : oldAddress;

  /// Writes [server] to the DB: replace when the address changed, otherwise edit
  /// in place. Returns the command error, or null on success.
  Future<Object?> commit(Server server) async {
    try {
      if (isAddressChanged) {
        await _serversViewModel.replaceServer.runAsync((
          oldAddress: oldAddress,
          newServer: server,
        ));

        return _serversViewModel.replaceServer.errors.value;
      }
      await _serversViewModel.editServer.runAsync(server);

      return _serversViewModel.editServer.errors.value;
    } catch (e, s) {
      logger.e('Failed to save server', error: e, stackTrace: s);

      return e;
    }
  }

  /// After a successful commit, logs out the now-orphaned old v6 session and
  /// drops the old server's stale credentials/SID. Runs only after the commit so
  /// a failed save can't kill a live session.
  Future<void> cleanupAfterCommit() async {
    final oldServer = req.oldServer;
    final oldWasV6 = oldServer.apiVersion == SupportedApiVersions.v6;
    final newIsV6 = req.apiVersion == SupportedApiVersions.v6;

    // 1. Log out the old v6 session (orphaned on address change or v6 -> v5).
    if (oldWasV6 && (isAddressChanged || !newIsV6)) {
      try {
        final oldBundle = _createBundle(server: oldServer);
        await oldBundle.auth.deleteCurrentSession();
      } catch (e, s) {
        logger.w(
          'Failed to delete old session on server',
          error: e,
          stackTrace: s,
        );
      }
    }

    // 2. Now safe to drop the old server's credentials.
    if (isAddressChanged) {
      // New credentials already live under the new address; remove the stale
      // ones left behind under the old address, including its 2FA-declined mark.
      await _serversViewModel.deleteToken(oldAddress);
      await _serversViewModel.deletePassword(oldAddress);
      await _serversViewModel.deleteSid(oldAddress);
      _serversViewModel.clearTotpReauthDeclined(oldAddress);
    } else if (oldWasV6 && !newIsV6) {
      // Same address, v6 -> v5: the password and the SID are now unused.
      await _serversViewModel.deletePassword(targetAddress);
      await _serversViewModel.deleteSid(targetAddress);
    } else if (!oldWasV6 && newIsV6) {
      // Same address, v5 -> v6: the token is now unused.
      await _serversViewModel.deleteToken(targetAddress);
    }
  }
}
