// NOTE: This view model still depends on [ServersViewModel] and
// [StatusViewModel] (a cross-view-model dependency) for three things:
// - the DB writes (addServer/editServer/replaceServer), because they also
//   update the in-memory server list and the home screen widget,
// - deleteSid, because it also drops the session cache,
// - stopping and starting auto refresh.
// The URL check and the password / token writes use [ServerRepository].
// The certificate check (pin dialog, ssl error snackbar) is UI, so it is
// injected per request via [resolveCertificate].

import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/data/repositories/local/interfaces/server_repository.dart';
import 'package:pi_hole_client/domain/model/server/api_versions.dart';
import 'package:pi_hole_client/domain/model/server/secret_input.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/domain/model/server/server_auth.dart';
import 'package:pi_hole_client/domain/use_cases/server_connection/connect_server_usecase.dart';
import 'package:pi_hole_client/domain/use_cases/server_connection/resolve_certificate.dart';
import 'package:pi_hole_client/domain/use_cases/server_connection/resolve_totp.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/url.dart';

/// The form values of the server to save.
class ServerDraft {
  const ServerDraft({
    required this.url,
    required this.alias,
    required this.apiVersion,
    required this.allowUntrustedCert,
    required this.ignoreCertificateErrors,
    required this.pinnedCertificateSha256,
    required this.secret,
    required this.defaultServer,
    this.webPath,
  });

  final String url;
  final String alias;
  final String apiVersion;
  final bool allowUntrustedCert;
  final bool ignoreCertificateErrors;
  final String? pinnedCertificateSha256;

  /// The password (v6) or token (v5) for [apiVersion]. Always a [NewSecret]
  /// when adding.
  final SecretInput secret;
  final bool defaultServer;
  final String? webPath;
}

/// Whether [AddServerViewModel.saveServer] adds or edits a server.
sealed class SaveMode {
  const SaveMode();
}

/// Adds a new server.
final class AddMode extends SaveMode {
  const AddMode();
}

/// Edits [original].
final class EditMode extends SaveMode {
  const EditMode(this.original);
  final Server original;
}

/// Request for [AddServerViewModel.saveServer].
class SaveServerRequest {
  const SaveServerRequest({
    required this.draft,
    required this.mode,
    required this.resolveCertificate,
    required this.resolveTotp,
  });

  final ServerDraft draft;
  final SaveMode mode;
  final ResolveCertificate resolveCertificate;
  final ResolveTotp resolveTotp;
}

// ==================================================================
// Outcome of [AddServerViewModel.saveServer], mapped to UI by the widget.
// ==================================================================
sealed class SaveServerOutcome {
  const SaveServerOutcome();
}

final class SaveInitial extends SaveServerOutcome {
  const SaveInitial();
}

final class SaveSuccess extends SaveServerOutcome {
  const SaveSuccess(this.server);
  final Server server;
}

final class SaveCancelled extends SaveServerOutcome {
  const SaveCancelled();
}

final class SaveDuplicateUrl extends SaveServerOutcome {
  const SaveDuplicateUrl();
}

final class SaveUrlCheckFailed extends SaveServerOutcome {
  const SaveUrlCheckFailed();
}

final class SaveApiError extends SaveServerOutcome {
  const SaveApiError(this.error, this.version);
  final Exception error;
  final String version;
}

final class SaveDbError extends SaveServerOutcome {
  const SaveDbError();
}

/// Orchestrates adding and editing a Pi-hole server ([saveServer]).
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
    required ServerRepository serverRepository,
    required CreateRepositoryBundle createBundle,
  }) : _serversViewModel = serversViewModel,
       _statusViewModel = statusViewModel,
       _serverRepository = serverRepository,
       _createBundle = createBundle {
    saveServer = Command.createAsync<SaveServerRequest, SaveServerOutcome>(
      _saveServer,
      initialValue: const SaveInitial(),
    );
    saveServer.addListener(notifyListeners);
  }

  final ServersViewModel _serversViewModel;
  final StatusViewModel _statusViewModel;
  final ServerRepository _serverRepository;
  final CreateRepositoryBundle _createBundle;

  late final Command<SaveServerRequest, SaveServerOutcome> saveServer;

  Future<SaveServerOutcome> _saveServer(SaveServerRequest req) {
    return switch (req.mode) {
      AddMode() => _createServer(req),
      EditMode(:final original) => _updateServer(req, original),
    };
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
  /// Returns [SaveSuccess], [SaveCancelled], [SaveDuplicateUrl],
  /// [SaveUrlCheckFailed], [SaveApiError] or [SaveDbError].
  Future<SaveServerOutcome> _createServer(SaveServerRequest req) async {
    final draft = req.draft;
    // null when the check failed.
    switch ((await _serverRepository.doesServerExist(draft.url)).getOrNull()) {
      case null:
        return const SaveUrlCheckFailed();
      case true:
        return const SaveDuplicateUrl();
      case false:
        break;
    }

    final resolved = await req.resolveCertificate(
      Server(
        address: draft.url,
        alias: draft.alias,
        apiVersion: draft.apiVersion,
        allowUntrustedCert: draft.allowUntrustedCert,
        ignoreCertificateErrors: draft.ignoreCertificateErrors,
        pinnedCertificateSha256: draft.pinnedCertificateSha256,
        webPath: draft.webPath,
      ),
    );
    if (resolved == null) {
      return const SaveCancelled();
    }

    final server = resolved.copyWith(defaultServer: draft.defaultServer);
    final secret = draft.secret.value;
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
        return const SaveCancelled();
      case ConnectFailed(:final error, :final sessionCreated):
        await _cleanupFailedAttempt(
          bundle: bundle,
          address: draft.url,
          isNewAddress: true,
          sessionCreated: sessionCreated,
        );

        return SaveApiError(error, draft.apiVersion);
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
        address: draft.url,
        isNewAddress: true,
        sessionCreated: connected.sessionCreated,
        secretSaved: true,
      );

      return const SaveDbError();
    }

    return SaveSuccess(server);
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
  /// Returns [SaveSuccess], [SaveCancelled], [SaveDuplicateUrl],
  /// [SaveUrlCheckFailed], [SaveApiError] or [SaveDbError].
  Future<SaveServerOutcome> _updateServer(
    SaveServerRequest req,
    Server original,
  ) async {
    final draft = req.draft;
    // Normalised comparison: a host-case-only or trailing-slash difference is
    // NOT an address change and must stay on the in-place editServer path.
    final isAddressChanged = !isSameEndpoint(original.address, draft.url);

    if (isAddressChanged) {
      // null when the check failed.
      switch ((await _serverRepository.doesServerExist(
        draft.url,
      )).getOrNull()) {
        case null:
          return const SaveUrlCheckFailed();
        case true:
          return const SaveDuplicateUrl();
        case false:
          break;
      }
    }

    if (_serversViewModel.selectedServer != null) {
      _statusViewModel.stopAutoRefresh();
    }

    try {
      return await _saveEdit(req, original, isAddressChanged);
    } finally {
      if (_serversViewModel.selectedServer != null) {
        _statusViewModel.startAutoRefresh();
      }
    }
  }

  Future<SaveServerOutcome> _saveEdit(
    SaveServerRequest req,
    Server original,
    bool isAddressChanged,
  ) async {
    final draft = req.draft;
    final attempt = _SaveAttempt(
      draft: draft,
      original: original,
      isAddressChanged: isAddressChanged,
      serversViewModel: _serversViewModel,
      serverRepository: _serverRepository,
      createBundle: _createBundle,
    );
    final address = attempt.targetAddress;

    final resolved = await req.resolveCertificate(
      Server(
        address: address,
        alias: draft.alias,
        apiVersion: draft.apiVersion,
        allowUntrustedCert: draft.allowUntrustedCert,
        ignoreCertificateErrors: draft.ignoreCertificateErrors,
        // When the address changes the target is effectively a different host,
        // so any pinned certificate carried over from the old server is stale.
        // Reset it to null so the certificate check re-runs against the new
        // host.
        pinnedCertificateSha256: isAddressChanged
            ? null
            : draft.pinnedCertificateSha256,
        webPath: draft.webPath,
      ),
    );
    if (resolved == null) {
      return const SaveCancelled();
    }

    final server = resolved.copyWith(defaultServer: draft.defaultServer);
    final secret = draft.secret.value;
    // A version switch uses the other key, which is not stored yet.
    final isNew =
        isAddressChanged ||
        draft.apiVersion != original.apiVersion ||
        draft.secret is NewSecret;
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

        return const SaveCancelled();
      case ConnectFailed(:final error, :final sessionCreated):
        await _cleanupFailedAttempt(
          bundle: bundle,
          address: address,
          isNewAddress: isAddressChanged,
          sessionCreated: sessionCreated,
        );

        return SaveApiError(error, draft.apiVersion);
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

      return const SaveDbError();
    }

    await attempt.cleanupAfterCommit();
    _serversViewModel.clearTotpReauthDeclined(address);

    return SaveSuccess(server);
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
        ? await _serverRepository.savePassword(server.address, secret)
        : await _serverRepository.saveToken(server.address, secret);

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
      await _serverRepository.deletePassword(address);
      await _serverRepository.deleteToken(address);
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
    saveServer.removeListener(notifyListeners);
    super.dispose();
  }
}

/// One edit run of [AddServerViewModel.saveServer]: the DB commit and the
/// cleanup of the old server, which both depend on the old and the target
/// address.
class _SaveAttempt {
  _SaveAttempt({
    required this.draft,
    required this.original,
    required this.isAddressChanged,
    required ServersViewModel serversViewModel,
    required ServerRepository serverRepository,
    required CreateRepositoryBundle createBundle,
  }) : _serversViewModel = serversViewModel,
       _serverRepository = serverRepository,
       _createBundle = createBundle;

  final ServerDraft draft;
  final Server original;
  final bool isAddressChanged;
  final ServersViewModel _serversViewModel;
  final ServerRepository _serverRepository;
  final CreateRepositoryBundle _createBundle;

  String get oldAddress => original.address;
  String get targetAddress => isAddressChanged ? draft.url : oldAddress;

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
    final oldWasV6 = original.apiVersion == SupportedApiVersions.v6;
    final newIsV6 = draft.apiVersion == SupportedApiVersions.v6;

    // 1. Log out the old v6 session (orphaned on address change or v6 -> v5).
    if (oldWasV6 && (isAddressChanged || !newIsV6)) {
      try {
        final oldBundle = _createBundle(server: original);
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
      await _serverRepository.deleteToken(oldAddress);
      await _serverRepository.deletePassword(oldAddress);
      await _serversViewModel.deleteSid(oldAddress);
      _serversViewModel.clearTotpReauthDeclined(oldAddress);
    } else if (oldWasV6 && !newIsV6) {
      // Same address, v6 -> v5: the password and the SID are now unused.
      await _serverRepository.deletePassword(targetAddress);
      await _serversViewModel.deleteSid(targetAddress);
    } else if (!oldWasV6 && newIsV6) {
      // Same address, v5 -> v6: the token is now unused.
      await _serverRepository.deleteToken(targetAddress);
    }
  }
}
