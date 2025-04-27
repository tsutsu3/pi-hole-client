# CI Workflow Documentation

This document outlines the Continuous Integration (CI) process flow for our
project. Each step describes what happens when specific branches or actions are
triggered.

## 1. Trigger: Push to `release-v.x.x` Branch

When a branch named `release-v.x.x` is pushed, the following steps are executed:

### Step 1.1: `prepare.yaml`

- **Purpose:**
  - Updates the `CHANGELOG.md` file automatically.

- **Process:**
  1. The CI pipeline executes `prepare.yaml`.
  2. The bot updates the `CHANGELOG.md` file with relevant changes.
  3. The bot commits the updated `CHANGELOG.md` file to the repository.

### Step 1.2: `test-release.yaml`

- **Purpose:**
  - Builds the APK and AAB, uploads them to Google Play, and updates the build version.

- **Process:**
  1. The pipeline builds the APK and AAB files.
  2. The AAB is uploaded to Google Play Console, targeting the `test (alpha)` environment.
  3. The build version in `pubspec.yaml` is incremented.
  4. The bot commits the updated `pubspec.yaml` file to the repository.

> [!NOTE]
>
> - After this step, the **draft** AAB must be **manually published** via the
    Play Developer Console.
> - **Closed testing** is conducted to validate the build before wider distribution.

## 2. Trigger: `release-v.x.x` Branch Merge

When a Pull Request (PR) is merged, the following steps are executed:

### Step 2.1: `release.yaml`

- **Purpose:**
  - Builds and uploads the final AAB for production.
- **Process:**
  1. Builds platform-specific packages for all target OS (Windows, Linux, Android).
  2. Drafts the release notes based on the changes.
  3. Uploads the production AAB to the Play Developer Console targeting the
    **product environment**.

## 3. Trigger: Release Publish

When a GitHub Release is published, the following step is executed:

### Step 3.1: `update-winget-create.yaml`

- **Purpose:**
  - Generates a Winget manifest and automatically creates a Pull Request for
  version update.

- **Process:**
  - The pipeline is triggered by the GitHub Release publish event.
  - A new Winget manifest is generated.
  - A Pull Request named `winget/update-vx.x.x` is automatically created in the repository.

## 4. Trigger: Merge of `winget/update-vx.x.x` Pull Request

When the `winget/update-vx.x.x` PR is merged into the main branch, the following
step is executed:

### Step 4.1: `update-winget-submit.yaml`

- **Purpose:**
  - Submits the updated Winget manifest to the official `winget-pkgs` repository.

- **Process:**
  - Executes `wingetcreate update` with the `--submit` option.
  - Automatically creates a PR to the official [winget-pkgs](https://github.com/microsoft/winget-pkgs)
  repository for version update.

## Summary of Key Actions

- **Manual Steps:**
  - Publishing the draft AAB to production must be done manually in the Play
    Developer Console.
  - Conducting closed tests to ensure build quality before release.
- **Automated Steps:**
  - `prepare.yaml`: Updates `CHANGELOG.md` and commits changes.
  - `test-release.yaml`: Builds APK and AAB, uploads them to Google Play,
    updates the build version in `pubspec.yaml`, and commits changes.
  - `release.yaml`: Builds and uploads final AAB, and drafts release notes.
  - `update-winget-create.yaml`: Triggered by **Release publish**, generates
  Winget manifest, creates update PR.
  - `update-winget-submit.yaml`: Submits updated manifest to `winget-pkgs`.
