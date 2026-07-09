# Server Connection Flow (add / edit)

How the **Add / Edit server** screen connects to a Pi-hole and persists it.

- UI: `lib/ui/servers/widgets/add_server_fullscreen.dart` (`AddServerFullscreen`)
- Orchestration: `lib/ui/servers/view_models/add_server_viewmodel.dart`
  (`AddServerViewModel.createServer` / `updateServer`)

The view model owns the orchestration and returns a sealed outcome
(`CreateOutcome` / `UpdateOutcome`). The widget builds the request, awaits the
command and maps the outcome to UI (snackbar / navigation). UI that the
orchestration needs mid-flow is injected per request as callbacks, so the view
model never touches `BuildContext`:

- `resolveCertificate` — the certificate pin dialog + SSL-error snackbar.
- `resolveTotp` — the 6-digit TOTP (2FA) input modal, used on v6 login when the
  server requires two-factor auth. Returns the entered code or `null` on cancel.

## Layers

```mermaid
flowchart LR
  W[AddServerFullscreen<br/>widget] --> VM[AddServerViewModel]
  VM --> SV[ServersViewModel<br/>url check, credentials, DB commands]
  VM --> ST[StatusViewModel<br/>auto-refresh]
  VM --> B[RepositoryBundle<br/>auth + dns]
  W -. resolveCertificate callback .-> VM
  W -. resolveTotp callback .-> VM
```

## Add a new server - `createServer`

A cancelled/blocked certificate **aborts** the add (`CreateCancelled`),
mirroring `updateServer`; no credentials or remote session are created before
the abort. A cancelled TOTP prompt aborts the same way (`CreateCancelled`),
rolling back the just-saved credentials.

```mermaid
flowchart TD
  A([createServer req]) --> B{checkUrl}
  B -- duplicate --> BD([CreateDuplicateUrl])
  B -- failed --> BF([CreateUrlCheckFailed])
  B -- available --> D[resolveCertificate]
  D -- cancelled/blocked --> DX([CreateCancelled])
  D -- ok --> C[savePassword + saveToken]
  C --> E{apiVersion == v6?}
  E -- yes --> F[loginWithTotp<br/>see TOTP login]
  F -- cancelled --> FC[deletePassword + deleteToken] --> FX([CreateCancelled])
  F -- error --> G[deletePassword + deleteToken] --> H([CreateApiError])
  F -- ok --> I[dns.fetchBlockingStatus<br/>skipRenewal: true]
  E -- no --> I
  I -- success --> J([CreateSuccess server])
  I -- error --> K[deletePassword + deleteToken] --> L([CreateApiError])
```

On `CreateSuccess` the widget pops, shows the success snackbar, then persists
the server (`serversViewModel.addServer.runAsync`, fire-and-forget).

## Edit an existing server - `updateServer`

A cancelled/blocked certificate **aborts** the save (`UpdateCancelled`); the
message was already shown by `resolveCertificate`. Auto-refresh is stopped for
the duration and restarted on every exit path.

```mermaid
flowchart TD
  A([updateServer req]) --> B{address changed?}
  B -- yes --> C{checkUrl newUrl}
  C -- duplicate --> CD([UpdateDuplicateUrl])
  C -- failed --> CF([UpdateUrlCheckFailed])
  C -- available --> D[build serverObj<br/>pin reset if address changed]
  B -- no --> D
  D --> E[stopAutoRefresh if a server is selected]
  E --> F[resolveCertificate]
  F -- cancelled/blocked --> G[restartAutoRefresh] --> H([UpdateCancelled])
  F -- ok --> I[savePassword + saveToken at target]
  I --> J[authenticate]
  J -- error --> K{needsRollback?}
  K -- yes --> L[rollbackFailedSave]
  K -- no --> M[restoreSecrets + restartAutoRefresh]
  L --> M
  M --> N([UpdateApiError])
  J -- ok --> O[dns.fetchBlockingStatus<br/>skipRenewal: sessionCreated]
  O -- error --> P[rollbackFailedSave + restartAutoRefresh] --> Q([UpdateApiError])
  O -- success --> R[commit: replaceServer / editServer]
  R -- error --> S[rollbackFailedSave + restartAutoRefresh] --> T([UpdateDbError])
  R -- ok --> U[cleanupAfterCommit<br/>logout old v6 session, drop old creds/SID]
  U --> V[restartAutoRefresh] --> W([UpdateSuccess])
```

On `UpdateSuccess` the widget pops and shows the success snackbar.

### `restartAutoRefresh` can trigger a second, independent TOTP prompt

`restartAutoRefresh` (called on every `updateServer` exit path, including
`UpdateCancelled`) just calls `StatusViewModel.startAutoRefresh()` — but that
runs its first tick **immediately** (`runImmediately: true`), not after the
configured interval. If the edit's own `_authenticate`/`_loginWithTotp` TOTP
prompt is dismissed because the session is genuinely invalid server-side, that
immediate tick re-fetches status for the same server, hits the same
`TotpRequiredException`, and — via a completely separate subsystem outside
this file — surfaces a **second** TOTP prompt. Cancelling the edit's own
prompt does not (currently — see `(E8)`/`(E9)`/`(X6)` in the MFA decision
table) mark the address as reauth-declined, so this second prompt is not
suppressed.

The second prompt does not come back through `AddServerViewModel`; it is
raised by the shell-level auto-refresh error handler and goes through the
connect/switch flow instead:

```mermaid
sequenceDiagram
  participant VM as AddServerViewModel
  participant ST as StatusViewModel
  participant Base as _BaseState (base.dart)
  participant H as handleTotpReauth
  participant SCS as ServerConnectionService

  VM->>ST: restartAutoRefresh -> startAutoRefresh(runImmediately: true)
  ST->>ST: immediate tick: fetchRealtimeStatus() -> TotpRequiredException
  ST->>ST: _handleFatalConnectionError: stop, set fatalConnectionError, notify
  ST-->>Base: listener callback (_onFatalConnectionError)
  Base->>H: handleTotpReauth(context)
  H->>SCS: ServerConnectionService(...).connect()
  Note over SCS: shows the TOTP modal (2nd prompt)
  SCS->>SCS: on cancel: _onTotpCancelled -> markTotpReauthDeclined(address)
```

Confirmed on a real device (not just the fake-server test): the two prompts
appear back-to-back, deterministically, every time — not a timing
coincidence. See `lib/ui/shell/base.dart` (`_onFatalConnectionError`,
`StatusViewModel` listener registered in `initState`) and
`lib/ui/core/actions/handle_totp_reauth.dart`.

### Session handling inside `updateServer` - `_authenticate`

Only re-authenticates when needed, to avoid duplicate sessions on transient
failures (503/504/timeout). Every `createSession` step below goes through
`_loginWithTotp`, so any of them can prompt for a 2FA code; a cancelled prompt
returns `cancelled = true` and `updateServer` maps it to `UpdateCancelled`
(after rollback / restore + auto-refresh restart).

```mermaid
flowchart TD
  A([authenticate]) --> Z{apiVersion == v6?}
  Z -- no --> N0([sessionCreated = false])
  Z -- yes --> B{address changed?}
  B -- yes --> C[loginWithTotp]
  C -- cancelled --> CC([cancelled = true])
  C -- error --> CE([error, needsRollback = true])
  C -- ok --> CS([sessionCreated = true])
  B -- no --> D{password changed?}
  D -- yes --> E[loginWithTotp]
  E -- cancelled --> EC([cancelled = true])
  E -- error --> EE([error])
  E -- ok --> ES([sessionCreated = true])
  D -- no --> P[preCheck: dns.fetchBlockingStatus]
  P -- ok --> N1([reuse current session])
  P -- error --> R{reauthRequired?<br/>401 / SidNotFound}
  R -- no --> RE([error])
  R -- yes --> H[loginWithTotp]
  H -- cancelled --> HC([cancelled = true])
  H -- error --> HE([error])
  H -- ok --> HS([sessionCreated = true])
```

### TOTP login - `_loginWithTotp`

Shared by `createServer` and `_authenticate`. The first attempt sends the
password only; a 2FA server answers with `TotpRequiredException`, then the loop
collects a code via `resolveTotp` and retries with `password + totp`. A wrong or
reused code re-prompts (with a localized reason); a `null` code (user dismissed)
cancels. Rate-limit or any other error is terminal.

```mermaid
flowchart TD
  A([loginWithTotp]) --> B[auth.createSession password]
  B -- success --> S([ok])
  B -- not TotpRequired --> T([error as-is])
  B -- TotpRequiredException --> L[resolveTotp error]
  L -- null / cancel --> X([cancelled])
  L -- code --> R[auth.createSession password + totp]
  R -- success --> S
  R -- TotpInvalid --> LI[promptError = invalid] --> L
  R -- TotpReused --> LR[promptError = reused] --> L
  R -- other error --> E([error as-is])
```

## Sequence - add a new server

```mermaid
sequenceDiagram
  actor U as User
  participant W as AddServerFullscreen
  participant VM as AddServerViewModel
  participant SV as ServersViewModel
  participant B as RepositoryBundle

  U->>W: tap Connect
  W->>VM: createServer.runAsync(req)
  VM->>SV: checkUrlExists(url)
  VM->>W: resolveCertificate(server)
  Note over W: pin dialog / ssl-error snackbar (UI)
  VM->>SV: savePassword / saveToken
  opt apiVersion == v6
    VM->>B: auth.createSession(password)
    opt server requires 2FA
      VM->>W: resolveTotp(error?)
      Note over W: TOTP input modal (UI), re-prompted on wrong/reused code
      VM->>B: auth.createSession(password, totp)
    end
  end
  VM->>B: dns.fetchBlockingStatus(skipRenewal: true)
  VM-->>W: CreateSuccess(server) | CreateCancelled | CreateApiError | CreateDuplicateUrl | CreateUrlCheckFailed
  alt success
    W->>W: Navigator.maybePop + success snackbar
    W->>SV: addServer.runAsync(server)
  else failure
    W->>W: error snackbar
  else cancelled
    W->>W: nothing (message already shown by resolveCertificate)
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
  W->>VM: updateServer.runAsync(req)
  opt address changed
    VM->>SV: checkUrlExists(newUrl)
  end
  VM->>ST: stopAutoRefresh
  VM->>W: resolveCertificate(server)
  VM->>SV: savePassword / saveToken (target)
  opt v6 login requires 2FA
    VM->>W: resolveTotp(error?)
    Note over W: TOTP input modal (UI), re-prompted on wrong/reused code
  end
  VM->>B: auth.createSession / dns.fetchBlockingStatus (see _authenticate)
  VM->>B: dns.fetchBlockingStatus(skipRenewal: sessionCreated)
  alt connection ok
    VM->>SV: replaceServer / editServer (commit)
    VM->>B: old bundle.auth.deleteCurrentSession (cleanup)
    VM->>SV: delete old credentials / SID (cleanup)
  else failure
    VM->>SV: rollback (delete new creds/SID or restore old)
  end
  VM->>ST: startAutoRefresh
  VM-->>W: UpdateSuccess | UpdateCancelled | UpdateApiError | UpdateDbError | UpdateDuplicateUrl | UpdateUrlCheckFailed
  alt UpdateSuccess
    W->>W: Navigator.maybePop + success snackbar
  else UpdateApiError / UpdateDbError / duplicate / urlCheckFailed
    W->>W: error snackbar
  else UpdateCancelled
    W->>W: nothing (message already shown by resolveCertificate)
  end
```

## Outcome → UI mapping

| Outcome                                         | Widget reaction                                                      |
| ----------------------------------------------- | -------------------------------------------------------------------- |
| `CreateSuccess(server)`                         | pop → "connected successfully" → `addServer.runAsync(server)`        |
| `UpdateSuccess`                                 | pop → "edited successfully"                                          |
| `CreateDuplicateUrl` / `UpdateDuplicateUrl`     | "connection already exists" snackbar                                 |
| `CreateUrlCheckFailed` / `UpdateUrlCheckFailed` | "cannot check URL" snackbar                                          |
| `CreateApiError` / `UpdateApiError`             | status-code-specific error snackbar + log (`handleApiErrorResult`)   |
| `UpdateDbError`                                 | "cannot save connection data" snackbar                               |
| `CreateCancelled` / `UpdateCancelled`           | nothing - certificate dialog / SSL error / TOTP prompt already shown |

## Notes

- **Create and edit behave symmetrically on certificate cancel**: both
  `createServer` and `updateServer` abort (`CreateCancelled` / `UpdateCancelled`)
  when the pin dialog is cancelled or the certificate is blocked; no connection
  is attempted.
- The view model never shows UI itself. The certificate pin dialog and SSL-error
  snackbar live in the widget and are reached via the `resolveCertificate`
  callback passed in the request.
- **TOTP (2FA) is v6-only and handled inside login** (`_loginWithTotp`, shared by
  `createServer` and `_authenticate`). The view model never shows the prompt; it
  calls the injected `resolveTotp` callback, which the widget backs with the TOTP
  input modal. Wrong / reused codes re-prompt with a localized reason; a
  dismissed prompt cancels the whole flow (`CreateCancelled` / `UpdateCancelled`).
- The connecting overlay is driven by a local `isConnecting` flag toggled around
  `runAsync`.
- See also: [ARCHITECTURE.md](ARCHITECTURE.md).
```
