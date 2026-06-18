# Server Connection Flow (add / edit)

How the **Add / Edit server** screen connects to a Pi-hole and persists it.

- UI: `lib/ui/servers/widgets/add_server_fullscreen.dart` (`AddServerFullscreen`)
- Orchestration: `lib/ui/servers/view_models/add_server_viewmodel.dart`
  (`AddServerViewModel.createServer` / `updateServer`)

The view model owns the orchestration and returns a sealed outcome
(`CreateOutcome` / `UpdateOutcome`). The widget builds the request, awaits the
command and maps the outcome to UI (snackbar / navigation). The certificate
dialog and the SSL-error snackbar stay in the widget and are injected per
request through the `resolveCertificate` callback.

## Layers

```mermaid
flowchart LR
  W[AddServerFullscreen<br/>widget] --> VM[AddServerViewModel]
  VM --> SV[ServersViewModel<br/>url check, credentials, DB commands]
  VM --> ST[StatusViewModel<br/>auto-refresh]
  VM --> B[RepositoryBundle<br/>auth + dns]
  W -. resolveCertificate callback .-> VM
```

## Add a new server - `createServer`

A cancelled/blocked certificate **aborts** the add (`CreateCancelled`),
mirroring `updateServer`; no credentials or remote session are created before
the abort.

```mermaid
flowchart TD
  A([createServer req]) --> B{checkUrl}
  B -- duplicate --> BD([CreateDuplicateUrl])
  B -- failed --> BF([CreateUrlCheckFailed])
  B -- available --> D[resolveCertificate]
  D -- cancelled/blocked --> DX([CreateCancelled])
  D -- ok --> C[savePassword + saveToken]
  C --> E{apiVersion == v6?}
  E -- yes --> F[auth.createSession]
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

### Session handling inside `updateServer` - `_authenticate`

Only re-authenticates when needed, to avoid duplicate sessions on transient
failures (503/504/timeout).

```mermaid
flowchart TD
  A([authenticate]) --> Z{apiVersion == v6?}
  Z -- no --> N0([sessionCreated = false])
  Z -- yes --> B{address changed?}
  B -- yes --> C[auth.createSession]
  C -- error --> CE([error, needsRollback = true])
  C -- ok --> CS([sessionCreated = true])
  B -- no --> D{password changed?}
  D -- yes --> E[auth.createSession]
  E -- error --> EE([error])
  E -- ok --> ES([sessionCreated = true])
  D -- no --> P[preCheck: dns.fetchBlockingStatus]
  P -- ok --> N1([reuse current session])
  P -- error --> R{reauthRequired?<br/>401 / SidNotFound}
  R -- no --> RE([error])
  R -- yes --> H[auth.createSession]
  H -- error --> HE([error])
  H -- ok --> HS([sessionCreated = true])
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

| Outcome                                         | Widget reaction                                                        |
| ----------------------------------------------- | ---------------------------------------------------------------------- |
| `CreateSuccess(server)`                         | pop → "connected successfully" → `addServer.runAsync(server)`          |
| `UpdateSuccess`                                 | pop → "edited successfully"                                            |
| `CreateDuplicateUrl` / `UpdateDuplicateUrl`     | "connection already exists" snackbar                                   |
| `CreateUrlCheckFailed` / `UpdateUrlCheckFailed` | "cannot check URL" snackbar                                            |
| `CreateApiError` / `UpdateApiError`             | status-code-specific error snackbar + log (`handleApiErrorResult`)     |
| `UpdateDbError`                                 | "cannot save connection data" snackbar                                 |
| `CreateCancelled` / `UpdateCancelled`           | nothing - the certificate dialog / SSL error already informed the user |

## Notes

- **Create and edit behave symmetrically on certificate cancel**: both
  `createServer` and `updateServer` abort (`CreateCancelled` / `UpdateCancelled`)
  when the pin dialog is cancelled or the certificate is blocked; no connection
  is attempted.
- The view model never shows UI itself. The certificate pin dialog and SSL-error
  snackbar live in the widget and are reached via the `resolveCertificate`
  callback passed in the request.
- The connecting overlay is driven by a local `isConnecting` flag toggled around
  `runAsync`.
- See also: [ARCHITECTURE.md](ARCHITECTURE.md).
```
