# Server Connection Flow (Add / Edit)

This document shows how the Add / Edit Server screen tests and saves a Pi-hole
connection.

- UI: `lib/ui/servers/widgets/add_server_fullscreen.dart`
- Flow: `lib/ui/servers/view_models/add_server_viewmodel.dart`
- Connection check:
  `lib/domain/use_cases/server_connection/connect_server_usecase.dart`

`AddServerViewModel.saveServer` runs the flow and returns a
`SaveServerOutcome`. The widget then shows a message or closes the screen.

The view model does not use `BuildContext`. The widget provides callbacks for
the certificate check (`resolveCertificate`) and TOTP input (`resolveTotp`).

## Layers

```mermaid
flowchart LR
  W[AddServerFullscreen<br/>widget] --> VM[AddServerViewModel]
  VM --> SR[ServerRepository<br/>url check, password / token]
  VM --> SV[ServersViewModel<br/>DB commands, deleteSid]
  VM --> ST[StatusViewModel<br/>auto-refresh]
  VM --> UC[ConnectServerUseCase<br/>session + status check]
  UC --> B[RepositoryBundle<br/>auth + dns]
  VM --> B
  W -. resolveCertificate callback .-> VM
  W -. resolveTotp callback .-> VM
```

## Secret handling

The secret is a v6 password or a v5 token. It is tested first and saved only
after the connection succeeds.

The widget sends:

- `NewSecret`: add mode, or a changed secret/version
- `UnchangedSecret`: the secret and version did not change

A changed address also makes the secret new because the new address has no
stored secret.

| Secret | Session policy | Save again |
| --- | --- | --- |
| New | `forceNew` | Yes |
| Unchanged | `reuseIfValid` | No |

Only the secret for the selected version is saved. A write failure returns
`SaveDbError`.

## Add server

A blocked or cancelled certificate check stops the flow before connection.
Cancelling TOTP also stops it. Nothing has been saved yet.

```mermaid
flowchart TD
  A([saveServer AddMode]) --> B{doesServerExist}
  B -- duplicate --> BD([SaveDuplicateUrl])
  B -- failed --> BF([SaveUrlCheckFailed])
  B -- available --> D[resolveCertificate]
  D -- cancelled/blocked --> DX([SaveCancelled])
  D -- ok --> C[connect<br/>SessionPolicy.forceNew<br/>secret passed in]
  C -- cancelled --> CX([SaveCancelled])
  C -- error --> CE[cleanupFailedAttempt] --> CA([SaveApiError])
  C -- ok --> S[saveSecret<br/>password or token]
  S -- error --> F[cleanupFailedAttempt] --> DB([SaveDbError])
  S -- ok --> M[addServer.runAsync<br/>save row]
  M -- error --> F
  M -- ok --> J([SaveSuccess server])
```

The row is saved before `SaveSuccess`. The widget then closes the screen and
shows a success message.

## Edit server

A blocked or cancelled certificate check returns `SaveCancelled`.
Auto-refresh stops during the save and always restarts in a `finally` block.

```mermaid
flowchart TD
  A([saveServer EditMode]) --> B{address changed?<br/>isSameEndpoint}
  B -- yes --> C{doesServerExist newUrl}
  C -- duplicate --> CD([SaveDuplicateUrl])
  C -- failed --> CF([SaveUrlCheckFailed])
  C -- available --> E[stopAutoRefresh]
  B -- no --> E
  E --> F[resolveCertificate<br/>pin reset if address changed]
  F -- cancelled/blocked --> H([SaveCancelled])
  F -- ok --> J[connect<br/>forceNew if new secret, else reuseIfValid]
  J -- cancelled --> JC[decline if reuseIfValid<br/>cleanupFailedAttempt] --> H
  J -- error --> JE[cleanupFailedAttempt] --> JA([SaveApiError])
  J -- ok --> K{new secret?}
  K -- yes --> S[saveSecret]
  K -- no --> R
  S -- error --> X[cleanupFailedAttempt] --> T([SaveDbError])
  S -- ok --> R[commit<br/>replaceServer if address changed<br/>else editServer]
  R -- error --> X
  R -- ok --> U[cleanupAfterCommit]
  U --> W([SaveSuccess server])
```

### Cleanup after failure

`_cleanupFailedAttempt` is used after failures following the certificate
check.

| Action | When |
| --- | --- |
| Log out the new session | A session was created |
| Delete the SID | The address is new, or a session was created |
| Delete password and token | The address is new and the secret was saved |

All actions use the target address. Credentials for the current address are
not deleted.

If the database write fails after saving a tested secret, the old server row
remains and the tested secret stays stored. The user can save again.

### Cleanup after success

`cleanupAfterCommit` runs only after the database update succeeds:

- Old v6 session: log out when the address changes or the new version is v5
- Old address: delete its token, password, and SID
- Same address, v6 to v5: delete the password and SID
- Same address, v5 to v6: delete the token

### Cancelled TOTP and auto-refresh

Auto-refresh runs immediately after an edit. It could reopen the TOTP input
just after the user cancelled it.

`TotpPromptGuard` prevents this:

- Cancel with `reuseIfValid`: mark the prompt as declined
- Automatic refresh: do not show the marked prompt
- Manual refresh: clear the mark and allow the prompt
- Successful login or server deletion: remove the mark

The mark is not added with `forceNew`, because the old SID may still work.

```mermaid
sequenceDiagram
  participant VM as AddServerViewModel
  participant ST as StatusViewModel
  participant Base as _BaseState (base.dart)
  participant H as handleTotpReauth

  VM->>VM: TOTP cancelled (reuseIfValid): totpPromptGuard.decline(address)
  VM->>ST: finally: startAutoRefresh(runImmediately: true)
  ST->>ST: first tick: fetchRealtimeStatus() -> TotpRequiredException
  ST->>ST: _handleFatalConnectionError: stop, set fatalConnectionError, notify
  ST-->>Base: listener (_onFatalConnectionError)
  Base->>H: handleTotpReauth(context)
  H->>H: totpPromptGuard.isDeclined(address) -> return false (no input)
```

See `lib/ui/shell/base.dart`,
`lib/ui/core/actions/handle_totp_reauth.dart`, and `totp_fake_test.dart`.

## Certificate check

`CertificateCheckUseCase` contains the rules and does not show UI. The caller
shows the pin dialog and blocked-certificate message.

| Method | Use |
| --- | --- |
| `checkBeforeSave` | Check before add/edit |
| `needsPinBeforeConnect` | Decide whether a pin is needed |
| `repin` | Save a new pin |
| `hasConfirmedPinMismatch` | Choose Update or Edit after a 495 error |

Saving is stricter than connecting. It can pin a trusted certificate and block
an untrusted certificate in strict mode. A connection failure returns 495 and
starts recovery.

Tests are in
`test/domain/use_cases/server_connection/certificate_check_usecase_test.dart`.

## Session setup

`ConnectServerUseCase.connect` sets up the session and checks the blocking
status.

- v5: `TokenAuth`
- v6 with an empty password: `NoAuth`
- v6 with a password: `PasswordAuth`

With `reuseIfValid`, login happens only after an authentication error. Short
failures such as 503, 504, or a timeout do not create another session.

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

The result is `ConnectSuccess`, `ConnectFailed`, or `ConnectCancelled`.
It also reports whether a new session was created for cleanup.

### TOTP login

The first login uses the password only. If TOTP is required, `resolveTotp`
asks for a code and login runs again.

| Result | Next step |
| --- | --- |
| Success | Check status |
| Invalid or reused code | Ask again |
| Cancel | Return `ConnectCancelled` |
| Rate limit or other error | Return `ConnectFailed` |

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

## Add sequence

```mermaid
sequenceDiagram
  actor U as User
  participant W as AddServerFullscreen
  participant VM as AddServerViewModel
  participant SR as ServerRepository
  participant SV as ServersViewModel
  participant B as RepositoryBundle

  U->>W: tap Connect
  W->>VM: saveServer.runAsync(AddMode, draft with NewSecret)
  VM->>SR: doesServerExist(url)
  VM->>W: resolveCertificate(server)
  Note over W: pin dialog / ssl-error snackbar (UI)
  opt apiVersion == v6
    VM->>B: auth.createSession(password)
    opt server requires 2FA
      VM->>W: resolveTotp(error?)
      Note over W: TOTP input (UI), asked again on a wrong/reused code
      VM->>B: auth.createSession(password, totp)
    end
  end
  VM->>B: dns.fetchBlockingStatus(skipRenewal: true)
  Note over VM,B: v5 uses the token passed to the bundle
  VM->>SR: savePassword (v6) / saveToken (v5)
  VM->>SV: addServer.runAsync(server)
  VM-->>W: SaveSuccess(server) | SaveDbError | SaveCancelled | SaveApiError | SaveDuplicateUrl | SaveUrlCheckFailed
  alt success
    W->>W: Navigator.maybePop + success snackbar
  else failure
    W->>W: error snackbar
  else cancelled
    W->>W: nothing (resolveCertificate / TOTP input already showed it)
  end
```

## Edit sequence

```mermaid
sequenceDiagram
  actor U as User
  participant W as AddServerFullscreen
  participant VM as AddServerViewModel
  participant SR as ServerRepository
  participant SV as ServersViewModel
  participant ST as StatusViewModel
  participant B as RepositoryBundle

  U->>W: tap Save
  W->>VM: saveServer.runAsync(EditMode, draft with NewSecret / UnchangedSecret)
  opt address changed
    VM->>SR: doesServerExist(newUrl)
  end
  VM->>ST: stopAutoRefresh
  VM->>W: resolveCertificate(server)
  VM->>B: connect (see ConnectServerUseCase.connect)
  opt v6 login requires 2FA
    VM->>W: resolveTotp(error?)
    Note over W: TOTP input (UI), asked again on a wrong/reused code
  end
  alt connection ok
    opt new secret
      VM->>SR: savePassword (v6) / saveToken (v5) at target
    end
    VM->>SV: replaceServer / editServer (commit)
    VM->>B: old bundle.auth.deleteCurrentSession (cleanupAfterCommit)
    VM->>SR: delete old / unused password and token (cleanupAfterCommit)
    VM->>SV: deleteSid (cleanupAfterCommit)
  else failure
    VM->>SR: cleanupFailedAttempt (see the table above)
    VM->>SV: deleteSid (cleanupFailedAttempt)
  end
  VM->>ST: startAutoRefresh (finally)
  VM-->>W: SaveSuccess(server) | SaveCancelled | SaveApiError | SaveDbError | SaveDuplicateUrl | SaveUrlCheckFailed
  alt SaveSuccess
    W->>W: Navigator.maybePop + success snackbar
  else SaveApiError / SaveDbError / duplicate / urlCheckFailed
    W->>W: error snackbar
  else SaveCancelled
    W->>W: nothing (resolveCertificate / TOTP input already showed it)
  end
```

## Outcomes

| Outcome | UI action |
| --- | --- |
| `SaveSuccess` | Close the screen and show success |
| `SaveDuplicateUrl` | Show "connection already exists" |
| `SaveUrlCheckFailed` | Show "cannot check URL" |
| `SaveApiError` | Show the API error |
| `SaveDbError` | Show "cannot save connection data" |
| `SaveCancelled` | Do nothing; the dialog already handled it |

## Notes

- TOTP is available only in v6.
- A local `isConnecting` flag controls the loading overlay.
- Known limit: if `auth.deleteCurrentSession` returns 401, session renewal
  uses the stored password, not the password being tested. See
  `lib/data/repositories/api/v6/auth_repository.dart`.
- See also [ARCHITECTURE.md](ARCHITECTURE.md).
