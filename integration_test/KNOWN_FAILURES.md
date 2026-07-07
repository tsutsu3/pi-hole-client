# Known-failing tests (TODO FIX)

These 6 tests are intentionally red: each asserts the *correct* spec behavior
for a known app bug, not the app's current (buggy) behavior. They exist so
the bug isn't silently reintroduced and so the fix can be verified by
flipping the test to green. Do not "fix" them by loosening the assertion —
fix the underlying app code, or ask before touching the assertion.

Run with:

```bash
flutter test integration_test/fake/edit_fake_test.dart \
  integration_test/real/edit_real_test.dart \
  integration_test/real/add_real_test.dart \
  -d <device> \
  --name '\(E3\)|\(E8\)|\(E9\)|\(X6\)|\(X3\) the old v6 session|\(C13\)'
```

Last run: 2026-07-07, emulator-5554, against the `e2e/docker-compose.yml`
stack. Result: 0 passed / 6 failed, all at their intended assertions (see
below).

## E3 — `integration_test/fake/edit_fake_test.dart`

### (E3) a failed password change restores the old sid, not the stale new one

```text
Expected: 'fake-sid-1'
  Actual: 'fake-sid-2'
   Which: is different.
          Expected: fake-sid-1
            Actual: fake-sid-2
                             ^
           Differ at offset 9
a failed password change must restore the sid that was valid before the attempt
```

## E9 — `integration_test/fake/edit_fake_test.dart`

### (E9) a successful edit clears a previously-declined TOTP reauth

```text
Expected: false
  Actual: <true>
a successful edit must clear a declined TOTP reauth
```

## E8 — `integration_test/fake/edit_fake_test.dart`

### (E8) cancelling the TOTP prompt during an edit marks reauth declined

```text
Expected: true
  Actual: <false>
cancelling a TOTP prompt during an edit must decline reauth the same way
cancelling one during connect does
```

## X6 — `integration_test/fake/edit_fake_test.dart`

### (X6) replacing a server clears the old address's declined TOTP reauth

```text
Expected: false
  Actual: <true>
replacing a server must clear the old address's declined TOTP reauth
```

## C13 — `integration_test/real/add_real_test.dart`

### (C13) a failed connection check after successful auth does not leave a sid behind

```text
Expected: empty
  Actual: WhereIterable<String>:['http://10.0.2.2:19082_sid']
a failed add must clean up the sid saved during login
```

## X3 — `integration_test/real/edit_real_test.dart`

### (X3) the old v6 session is logged out even when the first delete attempt fails

**Fixed on 2026-07-07** (was a test-harness bug, not the app bug — see below
for the original symptom). `connectServer()` leaves the app on `HomeScreen`,
and while a server is selected the bottom nav has no "connect" tab back to
the servers list — that list only lives under Settings > Servers
(`AppLocalizations.servers`, route `Routes.settingsAppServers`; see
`lib/ui/settings/widgets/settings_screen.dart`). The test now navigates
Settings → Servers before calling `editServer()`. With that fix, it fails at
the intended assertion:

```text
Expected: false
  Actual: <true>
the old v6 session must be logged out on version switch
```

<details>
<summary>Original symptom (test-harness bug, now fixed)</summary>

Unlike the other 5, this one did not originally fail at the documented
assertion. It crashed earlier, inside the shared `app.editServer()` helper,
before the save step even ran, because `openEditServer()` assumes the
servers list screen and instead found the `HomeScreen`'s app bar menu (which
has no "Edit" entry):

```text
The following assertion was thrown running a test:
The finder "Found 0 widgets with text "Edit": []" (used in a call to "tap()")
could not find any matching widgets.

#3      AppHarness.openEditServer (integration_test/support/app_harness.dart:293:18)
#4      AppHarness.editServer (integration_test/support/app_harness.dart:355:7)
#5      edit_real_test.dart:304
```

Reproduced identically on an isolated re-run (not flaky) before being fixed.

</details>
