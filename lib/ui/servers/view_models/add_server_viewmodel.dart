// NOTE: This view model intentionally depends on [ServersViewModel] and
// [StatusViewModel] (a cross-view-model dependency). The server-list mutations
// (addServer/editServer/replaceServer) are Commands whose notify/refresh side
// effects must be preserved, so the orchestration reuses them rather than the
// lower-level repositories. The certificate UI (pin dialog, ssl error snackbar)
// stays in the widget and is injected per request via [resolveCertificate].
import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/domain/model/auth/auth.dart';
import 'package:pi_hole_client/domain/model/server/api_versions.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/types/resolve_totp.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/url.dart';
import 'package:result_dart/result_dart.dart';

/// Resolves and validates the certificate for [server], returning the updated
/// server (possibly with a pinned fingerprint) or `null` when the user cancels
/// or the certificate is rejected. The dialog and ssl-error snackbar live in the
/// widget; the view model only decides what to do with the result.
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
    required this.password,
    required this.token,
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
  final String password;
  final String token;
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
    required this.password,
    required this.token,
    required this.defaultServer,
    required this.oldServer,
    required this.initPassword,
    required this.initToken,
    required this.secretsLoadSucceeded,
    required this.resolveCertificate,
    required this.resolveTotp,
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

  /// Adds a new server: checks the URL is not in use, resolves the certificate,
  /// saves the credentials, creates a v6 session if needed and checks the
  /// blocking status. Credentials saved during the attempt are removed on
  /// failure.
  ///
  /// A cancelled or blocked certificate aborts the add ([CreateCancelled])
  /// before anything is saved.
  ///
  /// Returns [CreateSuccess] with the server for the widget to save, or
  /// [CreateCancelled] / [CreateDuplicateUrl] / [CreateUrlCheckFailed] /
  /// [CreateApiError].
  Future<CreateOutcome> _createServer(CreateServerRequest req) async {
    switch (await _checkUrl(req.url)) {
      case _UrlCheck.duplicate:
        return const CreateDuplicateUrl();
      case _UrlCheck.failed:
        return const CreateUrlCheckFailed();
      case _UrlCheck.available:
        break;
    }

    var serverObj = Server(
      address: req.url,
      alias: req.alias,
      apiVersion: req.apiVersion,
      allowUntrustedCert: req.allowUntrustedCert,
      ignoreCertificateErrors: req.ignoreCertificateErrors,
      pinnedCertificateSha256: req.pinnedCertificateSha256,
    );

    // Resolve the certificate before saving anything, so a cancel/block aborts
    // cleanly with nothing to undo (same order as updateServer).
    final resolved = await req.resolveCertificate(serverObj);
    if (resolved == null) {
      return const CreateCancelled();
    }
    serverObj = resolved;

    await _serversViewModel.savePassword(req.url, req.password);
    await _serversViewModel.saveToken(req.url, req.token);

    final bundle = _createBundle(server: serverObj);
    if (serverObj.apiVersion == SupportedApiVersions.v6) {
      final login = await _loginWithTotp(
        bundle: bundle,
        password: req.password,
        resolveTotp: req.resolveTotp,
      );
      if (login.cancelled) {
        await _serversViewModel.deletePassword(req.url);
        await _serversViewModel.deleteToken(req.url);
        return const CreateCancelled();
      }
      if (login.result.isError()) {
        await _serversViewModel.deletePassword(req.url);
        await _serversViewModel.deleteToken(req.url);
        return CreateApiError(login.result.exceptionOrNull()!, req.apiVersion);
      }
    }

    // Use skipRenewal: true because the session was just created above.
    // Retrying with clearAndRenewSid would create a duplicate session.
    // Transient errors (e.g. network timeout) are still retried.
    final result = await bundle.dns.fetchBlockingStatus(skipRenewal: true);
    if (result.isSuccess()) {
      return CreateSuccess(
        serverObj.copyWith(defaultServer: req.defaultServer),
      );
    }

    // Clean up the credentials saved for this attempt; the server was not added
    await _serversViewModel.deletePassword(req.url);
    await _serversViewModel.deleteToken(req.url);
    return CreateApiError(result.exceptionOrNull()!, req.apiVersion);
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
  /// A cancelled or blocked certificate stops the save ([UpdateCancelled]); the
  /// message was already shown by [UpdateServerRequest.resolveCertificate].
  ///
  /// Returns [UpdateSuccess], [UpdateCancelled], [UpdateDuplicateUrl],
  /// [UpdateUrlCheckFailed], [UpdateApiError] or [UpdateDbError].
  Future<UpdateOutcome> _updateServer(UpdateServerRequest req) async {
    final oldServer = req.oldServer;
    final oldAddress = oldServer.address;
    final newUrl = req.url;
    // Normalised comparison: a host-case-only or trailing-slash difference is
    // NOT an address change and must stay on the in-place editServer path.
    final isAddressChanged = !isSameEndpoint(oldAddress, newUrl);

    // When the address (primary key) changes, make sure the new URL is not
    // already used by another server before doing anything destructive.
    if (isAddressChanged) {
      switch (await _checkUrl(newUrl)) {
        case _UrlCheck.duplicate:
          return const UpdateDuplicateUrl();
        case _UrlCheck.failed:
          return const UpdateUrlCheckFailed();
        case _UrlCheck.available:
          break;
      }
    }

    final targetAddress = isAddressChanged ? newUrl : oldAddress;

    // Only restore when the original secrets were actually read. If the initial
    // load failed, initPassword/initToken are empty placeholders and writing
    // them back would wipe a credential that is still in secure storage.
    Future<void> restoreSecrets() async {
      if (req.secretsLoadSucceeded) {
        await _serversViewModel.savePassword(oldAddress, req.initPassword);
        await _serversViewModel.saveToken(oldAddress, req.initToken);
      }
    }

    void restartAutoRefresh() {
      if (_serversViewModel.selectedServer != null) {
        _statusViewModel.startAutoRefresh();
      }
    }

    Future<UpdateOutcome> handleSaveError(Exception e) async {
      await restoreSecrets();
      restartAutoRefresh();
      return UpdateApiError(e, req.apiVersion);
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

    // Validate certificate BEFORE connection test (same as connect()).
    final updatedServer = await req.resolveCertificate(serverObj);
    if (updatedServer == null) {
      restartAutoRefresh();
      return const UpdateCancelled();
    }
    serverObj = updatedServer;

    await _serversViewModel.savePassword(targetAddress, req.password);
    await _serversViewModel.saveToken(targetAddress, req.token);

    final bundle = _createBundle(server: serverObj);
    final auth = await _authenticate(
      bundle: bundle,
      req: req,
      isAddressChanged: isAddressChanged,
    );
    if (auth.cancelled) {
      // User dismissed the TOTP prompt: undo this attempt's writes and keep the
      // old server (row, credentials, session) intact, same as a failed save.
      if (auth.needsRollback) {
        await rollbackFailedSave(bundle: bundle, sessionCreated: false);
      }
      await restoreSecrets();
      restartAutoRefresh();
      return const UpdateCancelled();
    }
    if (auth.error != null) {
      // Only the address-changed branch wrote credentials under a new address,
      // so it is the only one that needs a rollback before reporting the error.
      if (auth.needsRollback) {
        await rollbackFailedSave(bundle: bundle, sessionCreated: false);
      }
      return handleSaveError(auth.error!);
    }
    // skipRenewal: true only when a new session was just created above to avoid
    // creating a duplicate session on transient retry failures.
    final result = await bundle.dns.fetchBlockingStatus(
      skipRenewal: auth.sessionCreated,
    );

    if (result.isError()) {
      await rollbackFailedSave(
        bundle: bundle,
        sessionCreated: auth.sessionCreated,
      );
      restartAutoRefresh();
      return UpdateApiError(result.exceptionOrNull()!, req.apiVersion);
    }

    final server = serverObj.copyWith(defaultServer: req.defaultServer);

    final cmdError = await _commit(
      server: server,
      oldAddress: oldAddress,
      isAddressChanged: isAddressChanged,
    );
    if (cmdError != null) {
      // DB write failed: roll back this attempt's artifacts; the old server
      // (row, credentials, session) is left fully intact.
      await rollbackFailedSave(
        bundle: bundle,
        sessionCreated: auth.sessionCreated,
      );
      restartAutoRefresh();
      return const UpdateDbError();
    }

    await _cleanupAfterCommit(
      oldServer: oldServer,
      newApiVersion: req.apiVersion,
      isAddressChanged: isAddressChanged,
      oldAddress: oldAddress,
      targetAddress: targetAddress,
    );
    restartAutoRefresh();
    return const UpdateSuccess();
  }

  /// Ensures a valid v6 session exists before the connection test.
  ///
  /// - Non-v6: nothing to do.
  /// - Address changed: the new host has no session, so always create one.
  /// - Same address, password changed: validate the new password by creating a
  ///   session (so an unverified password can't silently replace the good one).
  /// - Same address, password unchanged: reuse the current session and only log
  ///   in again on a 401/SID-missing (avoids duplicate sessions on 503/504).
  ///
  /// On failure returns the error and `needsRollback` (true only for the
  /// address-changed branch, which already wrote new-address credentials).
  /// `cancelled` is true when the user dismissed the TOTP prompt.
  Future<
    ({
      bool sessionCreated,
      Exception? error,
      bool needsRollback,
      bool cancelled,
    })
  >
  _authenticate({
    required RepositoryBundle bundle,
    required UpdateServerRequest req,
    required bool isAddressChanged,
  }) async {
    // Maps a login attempt to the _authenticate result record. [needsRollback]
    // is carried through unchanged for the failure/cancel paths.
    Future<
      ({
        bool sessionCreated,
        Exception? error,
        bool needsRollback,
        bool cancelled,
      })
    >
    login({required bool needsRollback}) async {
      final result = await _loginWithTotp(
        bundle: bundle,
        password: req.password,
        resolveTotp: req.resolveTotp,
      );
      if (result.cancelled) {
        return (
          sessionCreated: false,
          error: null,
          needsRollback: needsRollback,
          cancelled: true,
        );
      }
      if (result.result.isError()) {
        return (
          sessionCreated: false,
          error: result.result.exceptionOrNull()!,
          needsRollback: needsRollback,
          cancelled: false,
        );
      }
      return (
        sessionCreated: true,
        error: null,
        needsRollback: false,
        cancelled: false,
      );
    }

    // Non-v6: v5 has no 2FA, so the flag is definitively false.
    if (req.apiVersion != SupportedApiVersions.v6) {
      return (
        sessionCreated: false,
        error: null,
        needsRollback: false,
        cancelled: false,
      );
    }

    // Address changed: new-address credentials were already written, so a
    // failure/cancel needs a rollback.
    if (isAddressChanged) {
      return login(needsRollback: true);
    }

    // Same address, password changed
    if (req.password != req.initPassword) {
      return login(needsRollback: false);
    }

    // Same address, password unchanged
    final preCheck = await bundle.dns.fetchBlockingStatus(skipRenewal: true);
    if (preCheck.isError()) {
      final err = preCheck.exceptionOrNull();
      if (!isReauthRequired(err)) {
        return (
          sessionCreated: false,
          error: err,
          needsRollback: false,
          cancelled: false,
        );
      }
      return login(needsRollback: false);
    }

    return (
      sessionCreated: false,
      error: null,
      needsRollback: false,
      cancelled: false,
    );
  }

  /// Logs in, prompting for a 6-digit TOTP code when the server requires 2FA
  /// and re-prompting on a rejected code. Returns the auth result, or
  /// `cancelled: true` when the user dismisses the prompt.
  ///
  /// The first attempt sends the password only. A 2FA server answers with
  /// [TotpRequiredException]; the loop then collects a code via [resolveTotp]
  /// and retries with `password + totp`, looping on [TotpInvalidException].
  /// Any other failure is returned as-is.
  Future<({bool cancelled, Result<Auth> result})> _loginWithTotp({
    required RepositoryBundle bundle,
    required String password,
    required ResolveTotp resolveTotp,
  }) async {
    var result = await bundle.auth.createSession(password);
    if (result.isSuccess()) return (cancelled: false, result: result);
    if (result.exceptionOrNull() is! TotpRequiredException) {
      return (cancelled: false, result: result);
    }

    // 2FA required
    TotpPromptError? promptError;
    while (true) {
      final code = await resolveTotp(error: promptError);
      if (code == null) return (cancelled: true, result: result);

      result = await bundle.auth.createSession(password, totp: code);
      if (result.isSuccess()) return (cancelled: false, result: result);

      final err = result.exceptionOrNull();
      if (err is TotpInvalidException) {
        promptError = TotpPromptError.invalid;
        continue;
      }
      if (err is TotpReusedException) {
        promptError = TotpPromptError.reused;
        continue;
      }
      // Rate limit or any other error is terminal - stop re-prompting.
      return (cancelled: false, result: result);
    }
  }

  /// Writes [server] to the DB: replace when the address changed, otherwise edit
  /// in place. Returns the command error, or null on success.
  Future<Object?> _commit({
    required Server server,
    required String oldAddress,
    required bool isAddressChanged,
  }) async {
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
  Future<void> _cleanupAfterCommit({
    required Server oldServer,
    required String newApiVersion,
    required bool isAddressChanged,
    required String oldAddress,
    required String targetAddress,
  }) async {
    final oldWasV6 = oldServer.apiVersion == SupportedApiVersions.v6;
    final newIsV6 = newApiVersion == SupportedApiVersions.v6;

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
      // ones left behind under the old address.
      await _serversViewModel.deleteToken(oldAddress);
      await _serversViewModel.deletePassword(oldAddress);
      await _serversViewModel.deleteSid(oldAddress);
    } else if (oldWasV6 && !newIsV6) {
      // Same address, v6 -> v5: the SID is now unused.
      await _serversViewModel.deleteSid(targetAddress);
    }
  }

  @override
  void dispose() {
    createServer.removeListener(notifyListeners);
    updateServer.removeListener(notifyListeners);
    super.dispose();
  }
}
