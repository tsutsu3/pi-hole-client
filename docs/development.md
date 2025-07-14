## 🛠️ Development

### Prepare the development environment

1. Clone the repository
2. Run `flutter pub get`
3. Clone the `.env.sample` file and name it `.env`
4. On the `SENTRY_DSN` variable assign it's value
5. Inside the `android` folder, clone the `key.properties.sample` file and
   name it `key.properties`
6. Open the file and fill the variables with the corresponding values
7. Store your `keystore.jks` file inside `android/app`
8. Generate the Git commit hash file required for version display:

   ```bash
   dart run tools/generate_git_commit.dart
   ```

> [!NOTE]
> This will generate **lib/build_info/git_commit.dart** with the current Git
> commit hash.
>
> This file is required for the app to compile and is auto-generated, so it is
> excluded from Git via .gitignore.

### Compile the production build

#### Common

Run these commands as needed whenever you update the images.

1. Run `dart run flutter_launcher_icons`
2. Run `dart run flutter_native_splash:create`

Run the following command before any build.

1. Run `dart run tools/generate_git_commit.dart`

#### Android

1. Run `flutter clean`
2. Run `flutter pub get`
3. Run `flutter build apk --release` to build the .apk file
4. Run `flutter build appbundle --release` to build the .aab file

#### macOS

1. Run `flutter clean`
2. Run `flutter pub get`
3. Run `flutter build macos --release` to build the .app file

#### Linux

First, install the required dependencies:

```bash
sudo apt install libcurl4-openssl-dev libsecret-1-dev libjsoncpp-dev
```

Then, follow these steps to build the Linux executable:

1. Run `flutter clean`
2. Run `flutter pub get`
3. Run `flutter build linux --release` to build the Linux executable
4. If you want to build also the .deb file do this:
   1. Run `dart pub global activate flutter_to_debian` to install the utility
      that will build the .deb file
   2. Run `flutter_to_debian`

#### Windows

1. Run `flutter clean`
2. Run `flutter pub get`
3. Run `flutter build windows --release` to build the Windows executable
4. Install the [InnoSetup](https://jrsoftware.org/isdl.php) software you don't
   have it
5. Run `iscc /Q windows/innosetup_installer_builder.iss` to generate the
   Windows installer

### Code Quality and Analysis

To ensure code quality and identify potential issues, perform the following
analysis steps:

1. **Analyze Code**

   Analyze the project to catch syntax errors, type issues, and other code problems:

   ```bash
   flutter analyze
   ```

### CI/CD Secrets Management

To store and manage secrets required for GitHub Actions, refer to the
dedicated documentation:

📖 **[Managing CI/CD Secrets](./ci-secrets.md)**

This document covers:

- Required secrets for GCP authentication and secure builds.
- Encoding and storing files as GitHub Secrets.

### CI/CD Workflow

The CI/CD process is outlined in the following documentation:

📖 **[CI/CD Workflow](./ci-flow.md)**
