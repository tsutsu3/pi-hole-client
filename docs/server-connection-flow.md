# Server Connection Flow (add / edit)

How the **Add / Edit server** screen connects to a Pi-hole and persists it.

- UI: `lib/ui/servers/widgets/add_server_fullscreen.dart` (`AddServerFullscreen`)
- Orchestration: `lib/ui/servers/view_models/add_server_viewmodel.dart`
  (`AddServerViewModel.createServer` / `updateServer`)
- Session setup and status check:
  `lib/domain/use_cases/server_connection/connect_server_usecase.dart`
  (`ConnectServerUseCase`)

The view model owns the orchestration and returns a sealed outcome
(`CreateOutcome` / `UpdateOutcome`). The widget builds the request, awaits the
command and maps the outcome to UI (snackbar / navigation). UI that the
orchestration needs mid-flow is injected per request as callbacks, so the view
model never touches `BuildContext`:

- `resolveCertificate` - the certificate pin dialog + SSL-error snackbar.
- `resolveTotp` - the 6-digit TOTP (2FA) input modal, used on v6 login when the
  server requires two-factor auth. Returns the entered code or `null` on cancel.

## Layers

```mermaid
flowchart LR
  W[AddServerFullscreen<br/>widget] --> VM[AddServerViewModel]
  VM --> SV[ServersViewModel<br/>url check, credentials, DB commands]
  VM --> ST[StatusViewModel<br/>auto-refresh]
  VM --> UC[ConnectServerUseCase<br/>session + status check]
  UC --> B[RepositoryBundle<br/>auth + dns]
  VM --> B
  W -. resolveCertificate callback .-> VM
  W -. resolveTotp callback .-> VM
```

## Credentials: checked first, stored after

The password (v6) or token (v5) is called the **secret** here. The connection
check uses the secret from the form. It is **not** stored before the check, so
a failed or cancelled check has no stored secret to undo.

- **v6**: the password goes to `auth.createSession` as an argument.
- **v5**: the token goes to the bundle (`CreateRepositoryBundle(server:,
  token:)`). The v5 repositories use it instead of the stored token, also after
  a retry.

After the check passes, only the key for the selected version is stored
(`savePassword` for v6, `saveToken` for v5). A failed write stops the flow with
`CreateDbError` / `UpdateDbError`.

The widget sends the secret as a `SecretInput`
(`lib/domain/model/server/secret_input.dart`):

- `NewSecret` - always on add. On edit, when the value or the version changed.
- `UnchangedSecret` - on edit, when the version and the value are the same as
  the loaded ones.

On edit, the secret is treated as new when it is a `NewSecret`, the address
changed (nothing is stored under the new address yet), **or** the version
changed (the key of the new version is not stored yet). A new secret is
checked with a new session (`SessionPolicy.forceNew`) and stored after the
check. An unchanged secret keeps the current session while it works
(`SessionPolicy.reuseIfValid`) and is not written again.

## Add a new server - `createServer`

A cancelled/blocked certificate **aborts** the add (`CreateCancelled`) before
any connection. A cancelled TOTP prompt also returns `CreateCancelled`; nothing
was stored, so there is nothing to undo.

```mermaid
flowchart TD
  A([createServer req]) --> B{checkUrl}
  B -- duplicate --> BD([CreateDuplicateUrl])
  B -- failed --> BF([CreateUrlCheckFailed])
  B -- available --> D[resolveCertificate]
  D -- cancelled/blocked --> DX([CreateCancelled])
  D -- ok --> C[connect<br/>SessionPolicy.forceNew<br/>secret passed in]
  C -- cancelled --> CX([CreateCancelled])
  C -- error --> CE[cleanupFailedAttempt] --> CA([CreateApiError])
  C -- ok --> S[saveSecret<br/>password or token]
  S -- error --> F[cleanupFailedAttempt] --> DB([CreateDbError])
  S -- ok --> M[addServer.runAsync<br/>persist row]
  M -- error --> F
  M -- ok --> J([CreateSuccess server])
```

`createServer` persists the server row before returning `CreateSuccess`, so the
widget only pops and shows the success snackbar.

## Edit an existing server - `updateServer`

A cancelled/blocked certificate **aborts** the save (`UpdateCancelled`); the
message was already shown by `resolveCertificate`. When a server is selected,
auto-refresh is stopped for the duration and started again in a `finally`, so
every exit path restarts it.

```mermaid
flowchart TD
  A([updateServer req]) --> B{address changed?<br/>isSameEndpoint}
  B -- yes --> C{checkUrl newUrl}
  C -- duplicate --> CD([UpdateDuplicateUrl])
  C -- failed --> CF([UpdateUrlCheckFailed])
  C -- available --> E[stopAutoRefresh]
  B -- no --> E
  E --> F[resolveCertificate<br/>pin reset if address changed]
  F -- cancelled/blocked --> H([UpdateCancelled])
  F -- ok --> J[connect<br/>forceNew if new secret, else reuseIfValid]
  J -- cancelled --> JC[markTotpReauthDeclined<br/>cleanupFailedAttempt] --> H
  J -- error --> JE[cleanupFailedAttempt] --> JA([UpdateApiError])
  J -- ok --> K{new secret?}
  K -- yes --> S[saveSecret]
  K -- no --> R
  S -- error --> X[cleanupFailedAttempt] --> T([UpdateDbError])
  S -- ok --> R[commit<br/>replaceServer if address changed<br/>else editServer]
  R -- error --> X
  R -- ok --> U[cleanupAfterCommit<br/>clearTotpReauthDeclined]
  U --> W([UpdateSuccess])
```

`startAutoRefresh` runs after every outcome above (from the `finally`). On
`UpdateSuccess` the widget pops and shows the success snackbar.

### Cleanup after a failure - `_cleanupFailedAttempt`

One cleanup is used for every failure after the certificate step, in both
`createServer` and `updateServer`.

- **Log out the new session** on the server - when this attempt created a
  session.
- **Delete the SID** under the target address - when the address is new, or
  this attempt created a session.
- **Delete the password and the token** under the target address - when the
  address is new and the secret was already stored.

With the **same address**, a stored secret is never restored or removed:

- it was not changed (`UnchangedSecret`), or
- it passed the connection check, so it works.

This also holds when the DB write fails after the secret was stored: the
outcome is `UpdateDbError`, the DB row keeps the old settings, and the stored
secret is the new, checked one. Saving again on the same screen stores
everything.

The SID is deleted when a session was created, because that session was just
logged out. The old session it replaced is left to time out on the server.

### Cleanup after a successful commit - `cleanupAfterCommit`

Runs only after the commit, so a failed save never logs out a working session.

- **Old server was v6, and the address changed or the new version is v5**:
  log out the old session (best effort).
- **Address changed**: delete the token, password, SID and 2FA-declined mark
  of the old address.
- **Same address, v6 -> v5**: delete the password and the SID (no longer
  used).
- **Same address, v5 -> v6**: delete the token (no longer used).

### Auto-refresh after a cancelled TOTP prompt

`startAutoRefresh()` runs its first tick **immediately**
(`runImmediately: true`). If the edit's TOTP prompt was cancelled and the
session is invalid on the server, that tick hits `TotpRequiredException`. The
shell-level error handler then calls `handleTotpReauth`.

The edit marks the target address as reauth-declined when its prompt is
cancelled (`markTotpReauthDeclined`). `handleTotpReauth` checks this mark and
returns early, so no second prompt appears. A refresh that the user starts
still prompts again (`totp_fake_test.dart`). A successful edit clears the mark
(`clearTotpReauthDeclined`).

```mermaid
sequenceDiagram
  participant VM as AddServerViewModel
  participant ST as StatusViewModel
  participant Base as _BaseState (base.dart)
  participant H as handleTotpReauth

  VM->>VM: TOTP prompt cancelled: markTotpReauthDeclined(address)
  VM->>ST: finally: startAutoRefresh(runImmediately: true)
  ST->>ST: immediate tick: fetchRealtimeStatus() -> TotpRequiredException
  ST->>ST: _handleFatalConnectionError: stop, set fatalConnectionError, notify
  ST-->>Base: listener callback (_onFatalConnectionError)
  Base->>H: handleTotpReauth(context)
  H->>H: isTotpReauthDeclined(address) -> return false (no prompt)
```

See `lib/ui/shell/base.dart` (`_onFatalConnectionError`) and
`lib/ui/core/actions/handle_totp_reauth.dart`.

## Session setup - `ConnectServerUseCase.connect`

Shared by the add / edit flow and the connect flow. It sets up the v6 session
and then checks the blocking status. The `ServerAuth` comes from the server
version and the secret: v5 -> `TokenAuth`, v6 with an empty password ->
`NoAuth`, otherwise `PasswordAuth`.

It logs in again only when needed, so a transient failure (503/504/timeout)
does not create a duplicate session.

```mermaid
flowchart TD
  A([connect auth, policy]) --> Z{auth}
  Z -- TokenAuth v5 --> S0[dns.fetchBlockingStatus] --> R0([sessionCreated = false])
  Z -- NoAuth + reuseIfValid --> S0
  Z -- NoAuth + forceNew --> L1[login with empty password]
  Z -- PasswordAuth + forceNew --> L2[login with password]
  Z -- PasswordAuth + reuseIfValid --> P[preCheck<br/>skipRenewal: true]
  P -- ok --> R1([sessionCreated = false])
  P -- error --> Q{reauth required?<br/>401 / SidNotFound / TotpRequired}
  Q -- no --> QE([ConnectFailed, sessionCreated = false])
  Q -- yes --> L3[login with password]
  L1 & L2 & L3 --> LS[dns.fetchBlockingStatus<br/>skipRenewal: true]
  LS --> R2([ConnectSuccess / ConnectFailed<br/>sessionCreated = true])
```

The outcome is `ConnectSuccess`, `ConnectFailed` or `ConnectCancelled`. Both
`ConnectSuccess` and `ConnectFailed` say whether a session was created, so the
caller knows what to clean up.

### TOTP login - `_login`

The first attempt sends the password only; a 2FA server answers with
`TotpRequiredException`, then the loop collects a code via `resolveTotp` and
retries with `password + totp`. A wrong or reused code re-prompts (with a
localized reason); a `null` code (user dismissed) returns `ConnectCancelled`.
Rate-limit or any other error is terminal (`ConnectFailed`).

```mermaid
flowchart TD
  A([login]) --> B[auth.createSession password]
  B -- success --> S([status check])
  B -- not TotpRequired --> T([ConnectFailed])
  B -- TotpRequiredException --> L[resolveTotp error]
  L -- null / cancel --> X([ConnectCancelled])
  L -- code --> R[auth.createSession password + totp]
  R -- success --> S
  R -- TotpInvalid --> LI[promptError = invalid] --> L
  R -- TotpReused --> LR[promptError = reused] --> L
  R -- other error --> E([ConnectFailed])
```

A successful `createSession` stores the new SID.

## Sequence - add a new server

```mermaid
sequenceDiagram
  actor U as User
  participant W as AddServerFullscreen
  participant VM as AddServerViewModel
  participant SV as ServersViewModel
  participant B as RepositoryBundle

  U->>W: tap Connect
  W->>VM: createServer.runAsync(req with NewSecret)
  VM->>SV: checkUrlExists(url)
  VM->>W: resolveCertificate(server)
  Note over W: pin dialog / ssl-error snackbar (UI)
  opt apiVersion == v6
    VM->>B: auth.createSession(password)
    opt server requires 2FA
      VM->>W: resolveTotp(error?)
      Note over W: TOTP input modal (UI), re-prompted on wrong/reused code
      VM->>B: auth.createSession(password, totp)
    end
  end
  VM->>B: dns.fetchBlockingStatus(skipRenewal: true)
  Note over VM,B: v5 uses the token passed to the bundle
  VM->>SV: savePassword (v6) / saveToken (v5)
  VM->>SV: addServer.runAsync(server)
  VM-->>W: CreateSuccess(server) | CreateDbError | CreateCancelled | CreateApiError | CreateDuplicateUrl | CreateUrlCheckFailed
  alt success
    W->>W: Navigator.maybePop + success snackbar
  else failure
    W->>W: error snackbar
  else cancelled
    W->>W: nothing (message already shown by resolveCertificate / TOTP prompt)
  end
```

## Sequence - edit an existing server

```mermaid
sequenceDiagram
  actor U as User
  participant W as AddServerFullscreen
  participant VM as AddServerViewModel
  participant SV as ServersViewModel
  participant ST as StatusViewModel
  participant B as RepositoryBundle

  U->>W: tap Save
  W->>VM: updateServer.runAsync(req with NewSecret / UnchangedSecret)
  opt address changed
    VM->>SV: checkUrlExists(newUrl)
  end
  VM->>ST: stopAutoRefresh
  VM->>W: resolveCertificate(server)
  opt v6 login requires 2FA
    VM->>W: resolveTotp(error?)
    Note over W: TOTP input modal (UI), re-prompted on wrong/reused code
  end
  VM->>B: connect (see ConnectServerUseCase.connect)
  alt connection ok
    opt new secret
      VM->>SV: savePassword (v6) / saveToken (v5) at target
    end
    VM->>SV: replaceServer / editServer (commit)
    VM->>B: old bundle.auth.deleteCurrentSession (cleanupAfterCommit)
    VM->>SV: delete old / unused credentials and SID (cleanupAfterCommit)
  else failure
    VM->>SV: cleanupFailedAttempt (see the list above)
  end
  VM->>ST: startAutoRefresh (finally)
  VM-->>W: UpdateSuccess | UpdateCancelled | UpdateApiError | UpdateDbError | UpdateDuplicateUrl | UpdateUrlCheckFailed
  alt UpdateSuccess
    W->>W: Navigator.maybePop + success snackbar
  else UpdateApiError / UpdateDbError / duplicate / urlCheckFailed
    W->>W: error snackbar
  else UpdateCancelled
    W->>W: nothing (message already shown by resolveCertificate / TOTP prompt)
  end
```

## Outcome → UI mapping

| Outcome                                         | Widget reaction                                                      |
| ----------------------------------------------- | -------------------------------------------------------------------- |
| `CreateSuccess(server)`                         | pop → "connected successfully" (the row is already saved)            |
| `UpdateSuccess`                                 | pop → "edited successfully"                                          |
| `CreateDuplicateUrl` / `UpdateDuplicateUrl`     | "connection already exists" snackbar                                 |
| `CreateUrlCheckFailed` / `UpdateUrlCheckFailed` | "cannot check URL" snackbar                                          |
| `CreateApiError` / `UpdateApiError`             | status-code-specific error snackbar + log (`handleApiErrorResult`)   |
| `CreateDbError` / `UpdateDbError`               | "cannot save connection data" snackbar                               |
| `CreateCancelled` / `UpdateCancelled`           | nothing - certificate dialog / SSL error / TOTP prompt already shown |

## Notes

- **Create and edit behave symmetrically on certificate cancel**: both
  `createServer` and `updateServer` abort (`CreateCancelled` / `UpdateCancelled`)
  when the pin dialog is cancelled or the certificate is blocked; no connection
  is attempted.
- The view model never shows UI itself. The certificate pin dialog and SSL-error
  snackbar live in the widget and are reached via the `resolveCertificate`
  callback passed in the request. Every path that blocks on a certificate must
  show its own message there, including the one where the fingerprint cannot be
  fetched at all (e.g. HTTPS picked for a plain HTTP port) - otherwise the
  `Cancelled` outcome maps to a silent no-op and the user sees nothing.
- **TOTP (2FA) is v6-only and handled inside login** (`ConnectServerUseCase`).
  The view model never shows the prompt; it passes the injected `resolveTotp`
  callback, which the widget backs with the TOTP input modal. Wrong / reused
  codes re-prompt with a localized reason; a dismissed prompt cancels the whole
  flow (`CreateCancelled` / `UpdateCancelled`).
- **Known limitation**: logging out the new session during cleanup
  (`auth.deleteCurrentSession`) renews the session on a 401. The renewal reads
  the **stored** password, not the one being checked. This only happens when
  the DELETE fails with 401 right after a successful login. See the comment in
  `lib/data/repositories/api/v6/auth_repository.dart`.
- The connecting overlay is driven by a local `isConnecting` flag toggled around
  `runAsync`.
- See also: [ARCHITECTURE.md](ARCHITECTURE.md).
