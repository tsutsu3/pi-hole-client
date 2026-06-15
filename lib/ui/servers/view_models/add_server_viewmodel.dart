// NOTE: This view model intentionally depends on [ServersViewModel] and
// [StatusViewModel] (a cross-view-model dependency). The server-list mutations
// (addServer/editServer/replaceServer) are Commands whose notify/refresh side
// effects must be preserved, so the orchestration reuses them rather than the
// lower-level repositories. The certificate UI (pin dialog, ssl error snackbar)
// stays in the widget and is injected per request via [resolveCertificate].
import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/domain/model/server/api_versions.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/url.dart';

/// Resolves and validates the certificate for [server], returning the updated
/// server (possibly with a pinned fingerprint) or `null` when the user cancels
/// or the certificate is rejected. The dialog and ssl-error snackbar live in the
/// widget; the view model only decides what to do with the result.
typedef ResolveCertificate = Future<Server?> Function(Server server);

/// Request for [AddServerViewModel.connect] (adding a new server).
class ConnectRequest {
  const ConnectRequest({
    required this.url,
    required this.alias,
    required this.apiVersion,
    required this.allowUntrustedCert,
    required this.ignoreCertificateErrors,
    required this.pinnedCertificateSha256,
    required this.password,
    required this.token,
    required this.defaultServer,
    required this.resolveCertificate,
  });

  final String url;
  final String alias;
  final String apiVersion;
  final bool allowUntrustedCert;
  final bool ignoreCertificateErrors;
  final String? pinnedCertificateSha256;
  final String password;
  final String token;
  final bool defaultServer;
  final ResolveCertificate resolveCertificate;
}

/// Request for [AddServerViewModel.save] (editing an existing server).
class SaveRequest {
  const SaveRequest({
    required this.url,
    required this.alias,
    required this.apiVersion,
    required this.allowUntrustedCert,
    required this.ignoreCertificateErrors,
    required this.pinnedCertificateSha256,
    required this.password,
    required this.token,
    required this.defaultServer,
    required this.oldServer,
    required this.initPassword,
    required this.initToken,
    required this.secretsLoadSucceeded,
    required this.resolveCertificate,
  });

  final String url;
  final String alias;
  final String apiVersion;
  final bool allowUntrustedCert;
  final bool ignoreCertificateErrors;
  final String? pinnedCertificateSha256;
  final String password;
  final String token;
  final bool defaultServer;
  final Server oldServer;

  /// The credentials originally loaded for [oldServer]. Used to restore the old
  /// secrets when a save attempt fails.
  final String initPassword;
  final String initToken;

  /// Whether the stored secrets were actually read. When false the restore is
  /// skipped so empty placeholders never overwrite a credential still in secure
  /// storage.
  final bool secretsLoadSucceeded;

  final ResolveCertificate resolveCertificate;
}

// ==================================================================
// Outcome of [AddServerViewModel.connect], mapped to UI reactions by the widget.
// ==================================================================
sealed class ConnectOutcome {
  const ConnectOutcome();
}

final class ConnectInitial extends ConnectOutcome {
  const ConnectInitial();
}

final class ConnectSuccess extends ConnectOutcome {
  const ConnectSuccess(this.server);
  final Server server;
}

final class ConnectDuplicateUrl extends ConnectOutcome {
  const ConnectDuplicateUrl();
}

final class ConnectUrlCheckFailed extends ConnectOutcome {
  const ConnectUrlCheckFailed();
}

final class ConnectApiError extends ConnectOutcome {
  const ConnectApiError(this.error, this.version);
  final Exception error;
  final String version;
}

// ==================================================================
// Outcome of [AddServerViewModel.save], mapped to UI reactions by the widget.
// ==================================================================
sealed class SaveOutcome {
  const SaveOutcome();
}

final class SaveInitial extends SaveOutcome {
  const SaveInitial();
}

final class SaveSuccess extends SaveOutcome {
  const SaveSuccess();
}

final class SaveCancelled extends SaveOutcome {
  const SaveCancelled();
}

final class SaveDuplicateUrl extends SaveOutcome {
  const SaveDuplicateUrl();
}

final class SaveUrlCheckFailed extends SaveOutcome {
  const SaveUrlCheckFailed();
}

final class SaveApiError extends SaveOutcome {
  const SaveApiError(this.error, this.version);
  final Exception error;
  final String version;
}

final class SaveDbError extends SaveOutcome {
  const SaveDbError();
}

/// Orchestrates adding ([connect]) and editing ([save]) a Pi-hole server.
///
/// The view model owns the pure orchestration (URL uniqueness check, credential
/// storage, session creation/teardown, blocking-status probe, DB commit and
/// rollback). UI reactions (snackbars, navigation, the certificate dialog and
/// the connecting overlay) stay in the widget and are driven by the returned
/// sealed outcomes and the Commands' [Command.isRunning].
class AddServerViewModel extends ChangeNotifier {
  AddServerViewModel({
    required ServersViewModel serversViewModel,
    required StatusViewModel statusViewModel,
    required CreateRepositoryBundle createBundle,
  }) : _serversViewModel = serversViewModel,
       _statusViewModel = statusViewModel,
       _createBundle = createBundle {
    connect = Command.createAsync<ConnectRequest, ConnectOutcome>(
      _connect,
      initialValue: const ConnectInitial(),
    );
    save = Command.createAsync<SaveRequest, SaveOutcome>(
      _save,
      initialValue: const SaveInitial(),
    );
    connect.addListener(notifyListeners);
    save.addListener(notifyListeners);
  }

  final ServersViewModel _serversViewModel;
  final StatusViewModel _statusViewModel;
  final CreateRepositoryBundle _createBundle;

  late final Command<ConnectRequest, ConnectOutcome> connect;
  late final Command<SaveRequest, SaveOutcome> save;

  /// Adds a new server: checks the URL is not in use, saves the credentials,
  /// resolves the certificate, creates a v6 session if needed and checks the
  /// blocking status. Credentials saved during the attempt are removed on
  /// failure.
  ///
  /// A cancelled or blocked certificate does not stop connect here (unlike
  /// [_save]): it keeps the original server and the connection test below
  /// reports any error.
  ///
  /// Returns [ConnectSuccess] with the server for the widget to save, or
  /// [ConnectDuplicateUrl] / [ConnectUrlCheckFailed] / [ConnectApiError].
  Future<ConnectOutcome> _connect(ConnectRequest req) async {
    final exists = await _serversViewModel.checkUrlExists(req.url);
    if (exists['result'] == 'success' && exists['exists'] == true) {
      return const ConnectDuplicateUrl();
    } else if (exists['result'] == 'fail') {
      return const ConnectUrlCheckFailed();
    }

    var serverObj = Server(
      address: req.url,
      alias: req.alias,
      apiVersion: req.apiVersion,
      allowUntrustedCert: req.allowUntrustedCert,
      ignoreCertificateErrors: req.ignoreCertificateErrors,
      pinnedCertificateSha256: req.pinnedCertificateSha256,
    );
    await _serversViewModel.savePassword(req.url, req.password);
    await _serversViewModel.saveToken(req.url, req.token);

    // A cancelled/blocked certificate falls back to the original server; the
    // connection test below reports the error (same as the old widget).
    serverObj = await req.resolveCertificate(serverObj) ?? serverObj;

    final bundle = _createBundle(server: serverObj);
    if (serverObj.apiVersion == SupportedApiVersions.v6) {
      final authResult = await bundle.auth.createSession(req.password);
      if (authResult.isError()) {
        await _serversViewModel.deletePassword(req.url);
        await _serversViewModel.deleteToken(req.url);
        return ConnectApiError(authResult.exceptionOrNull()!, req.apiVersion);
      }
    }
    // Use skipRenewal: true because the session was just created above.
    // Retrying with clearAndRenewSid would create a duplicate session.
    // Transient errors (e.g. network timeout) are still retried.
    final result = await bundle.dns.fetchBlockingStatus(skipRenewal: true);
    if (result.isSuccess()) {
      return ConnectSuccess(
        serverObj.copyWith(defaultServer: req.defaultServer),
      );
    }
    await _serversViewModel.deletePassword(req.url);
    await _serversViewModel.deleteToken(req.url);
    return ConnectApiError(result.exceptionOrNull()!, req.apiVersion);
  }

  /// Edits an existing server, keeping the old server's row, credentials and
  /// session unchanged until this attempt fully succeeds.
  ///
  /// Handles the address-changed (replace) vs same-address (in-place edit) paths,
  /// the v6 login branches (an address change always creates a session; a
  /// changed password is checked by creating one; an unchanged password keeps
  /// the current session and only logs in again on a 401), the DB save, and the
  /// rollback/old-session cleanup. Auto refresh is stopped while it runs and
  /// started again on every exit path.
  ///
  /// A cancelled or blocked certificate stops the save ([SaveCancelled]); the
  /// message was already shown by [SaveRequest.resolveCertificate].
  ///
  /// Returns [SaveSuccess], [SaveCancelled], [SaveDuplicateUrl],
  /// [SaveUrlCheckFailed], [SaveApiError] or [SaveDbError].
  Future<SaveOutcome> _save(SaveRequest req) async {
    final oldServer = req.oldServer;
    final oldAddress = oldServer.address;
    final newUrl = req.url;
    // Normalised comparison: a host-case-only or trailing-slash difference is
    // NOT an address change and must stay on the in-place editServer path.
    final isAddressChanged = !isSameEndpoint(oldAddress, newUrl);

    // When the address (primary key) changes, make sure the new URL is not
    // already used by another server before doing anything destructive.
    if (isAddressChanged) {
      final exists = await _serversViewModel.checkUrlExists(newUrl);
      if (exists['result'] == 'success' && exists['exists'] == true) {
        return const SaveDuplicateUrl();
      } else if (exists['result'] == 'fail') {
        return const SaveUrlCheckFailed();
      }
    }

    final targetAddress = isAddressChanged ? newUrl : oldAddress;

    var serverObj = Server(
      address: targetAddress,
      alias: req.alias,
      apiVersion: req.apiVersion,
      allowUntrustedCert: req.allowUntrustedCert,
      ignoreCertificateErrors: req.ignoreCertificateErrors,
      // When the address changes the target is effectively a different host, so
      // any pinned certificate carried over from the old server is stale. Reset
      // it to null so the certificate check re-runs against the new host.
      pinnedCertificateSha256: isAddressChanged
          ? null
          : req.pinnedCertificateSha256,
    );

    if (_serversViewModel.selectedServer != null) {
      _statusViewModel.stopAutoRefresh();
    }

    void restartAutoRefresh() {
      if (_serversViewModel.selectedServer != null) {
        _statusViewModel.startAutoRefresh();
      }
    }

    // Validate certificate BEFORE connection test (same as connect()).
    final updatedServer = await req.resolveCertificate(serverObj);
    if (updatedServer == null) {
      restartAutoRefresh();
      return const SaveCancelled();
    }
    serverObj = updatedServer;

    await _serversViewModel.savePassword(targetAddress, req.password);
    await _serversViewModel.saveToken(targetAddress, req.token);

    // Only restore when the original secrets were actually read. If the initial
    // load failed, initPassword/initToken are empty placeholders and writing
    // them back would wipe a credential that is still in secure storage.
    Future<void> restoreSecrets() async {
      if (req.secretsLoadSucceeded) {
        await _serversViewModel.savePassword(oldAddress, req.initPassword);
        await _serversViewModel.saveToken(oldAddress, req.initToken);
      }
    }

    // Rolls back everything written for THIS save attempt on failure, always
    // leaving the old server (row, credentials, session) untouched.
    //
    // - Address change: remove the credentials and SID written under the new
    //   address plus the freshly created remote session.
    // - Same address: restore the old credentials and, when a new session was
    //   created during this attempt, tear it down so it does not leak.
    Future<void> rollbackFailedSave({
      required RepositoryBundle bundle,
      required bool sessionCreated,
    }) async {
      Future<void> deleteNewSession() async {
        if (!sessionCreated) return;
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

      if (isAddressChanged) {
        await _serversViewModel.deletePassword(targetAddress);
        await _serversViewModel.deleteToken(targetAddress);
        await _serversViewModel.deleteSid(targetAddress);
        await deleteNewSession();
      } else {
        await deleteNewSession();
        await restoreSecrets();
      }
    }

    Future<SaveOutcome> handleSaveError(Exception e) async {
      await restoreSecrets();
      restartAutoRefresh();
      return SaveApiError(e, req.apiVersion);
    }

    final bundle = _createBundle(server: serverObj);
    var sessionJustCreated = false;
    if (serverObj.apiVersion == SupportedApiVersions.v6) {
      if (isAddressChanged) {
        // The new address has no existing session, so always create one.
        final authResult = await bundle.auth.createSession(req.password);
        if (authResult.isError()) {
          await rollbackFailedSave(bundle: bundle, sessionCreated: false);
          return handleSaveError(authResult.exceptionOrNull()!);
        }
        sessionJustCreated = true;
      } else if (req.password != req.initPassword) {
        // Same address but the password was edited. Validate it now by creating
        // a session: an unverified (possibly wrong) password would otherwise
        // silently overwrite the known-good one and lock the user out the
        // moment the current SID is invalidated.
        final authResult = await bundle.auth.createSession(req.password);
        if (authResult.isError()) {
          return handleSaveError(authResult.exceptionOrNull()!);
        }
        sessionJustCreated = true;
      } else {
        // Same address, unchanged password: reuse the existing session if it is
        // still valid. Only re-authenticate on 401/SidNotFoundException to
        // avoid session multiplication when the server is temporarily
        // unreachable (503/504/timeout).
        final preCheck = await bundle.dns.fetchBlockingStatus(
          skipRenewal: true,
        );
        if (preCheck.isError()) {
          final err = preCheck.exceptionOrNull();
          if (!isReauthRequired(err)) {
            return handleSaveError(err!);
          }
          final authResult = await bundle.auth.createSession(req.password);
          if (authResult.isError()) {
            return handleSaveError(authResult.exceptionOrNull()!);
          }
          sessionJustCreated = true;
        }
      }
    }
    // skipRenewal: true only when a new session was just created above to avoid
    // creating a duplicate session on transient retry failures.
    final result = await bundle.dns.fetchBlockingStatus(
      skipRenewal: sessionJustCreated,
    );

    if (result.isSuccess()) {
      final server = serverObj.copyWith(defaultServer: req.defaultServer);

      Object? cmdError;
      try {
        if (isAddressChanged) {
          await _serversViewModel.replaceServer.runAsync((
            oldAddress: oldAddress,
            newServer: server,
          ));
          cmdError = _serversViewModel.replaceServer.errors.value;
        } else {
          await _serversViewModel.editServer.runAsync(server);
          cmdError = _serversViewModel.editServer.errors.value;
        }
      } catch (e, s) {
        logger.e('Failed to save server', error: e, stackTrace: s);
        cmdError = e;
      }

      if (cmdError == null) {
        // The old v6 session is orphaned on an address change or a switch away
        // from v6 (e.g. v6 -> v5). Run only after the DB commit so a failed
        // save can't kill a live session.
        final oldWasV6 = oldServer.apiVersion == SupportedApiVersions.v6;
        final newIsV6 = serverObj.apiVersion == SupportedApiVersions.v6;

        // 1. Log out the old v6 session.
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
          // New credentials already live under the new address; remove the
          // stale ones left behind under the old address.
          await _serversViewModel.deleteToken(oldAddress);
          await _serversViewModel.deletePassword(oldAddress);
          await _serversViewModel.deleteSid(oldAddress);
        } else if (oldWasV6 && !newIsV6) {
          // Same address, v6 -> v5: the SID is now unused.
          await _serversViewModel.deleteSid(targetAddress);
        }
        restartAutoRefresh();
        return const SaveSuccess();
      } else {
        // DB write failed: roll back this attempt's artifacts; the old server
        // (row, credentials, session) is left fully intact.
        await rollbackFailedSave(
          bundle: bundle,
          sessionCreated: sessionJustCreated,
        );
        restartAutoRefresh();
        return const SaveDbError();
      }
    } else {
      await rollbackFailedSave(
        bundle: bundle,
        sessionCreated: sessionJustCreated,
      );
      restartAutoRefresh();
      return SaveApiError(result.exceptionOrNull()!, req.apiVersion);
    }
  }

  @override
  void dispose() {
    connect.removeListener(notifyListeners);
    save.removeListener(notifyListeners);
    super.dispose();
  }
}
