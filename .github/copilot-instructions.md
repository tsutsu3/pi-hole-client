## Pull Requests

Use Conventional Commits format for pull request titles.

Format:

`<type>(<scope>): <description>`

Use one of these types:

* `feat` for new features
* `fix` for bug fixes
* `docs` for documentation changes
* `perf` for performance improvements
* `refactor` for code refactoring
* `style` for formatting or styling changes
* `test` for test changes
* `chore` for maintenance tasks
* `ci` for CI changes
* `sec` for security changes
* `revert` for reverting previous changes

Choose a scope that identifies the main area affected by the change.

Write a concise but descriptive title. The description should explain what changed clearly enough to understand the purpose without reading the diff. Avoid vague descriptions such as `update tests`, `fix issue`, or `improve code`.

Use lowercase for the description and use the imperative form.

Examples:

* `feat(domains): add log actions for allowlist and blocklist entries`
* `feat(auth): support passwordless sessions for Pi-hole v6`
* `fix(auth): avoid requesting MFA when an existing session is still valid`
* `fix(domains): preserve explicit default ports when editing server settings`
* `fix(api): handle empty query responses without showing a generic error`
* `docs(readme): document setup steps for development and release builds`
* `perf(search): reduce duplicate requests when loading search results`
* `refactor(auth): move session validation into the authentication service`
* `style(settings): align server form spacing with other settings screens`
* `test(domains): add coverage for allowlist and blocklist log actions`
* `chore(vscode): exclude integration tests from the VS Code test runner`
* `ci(test): split Flutter tests across runners and merge coverage reports`
* `sec(auth): reject expired sessions before processing API requests`
* `revert(auth): restore previous session validation behavior`
