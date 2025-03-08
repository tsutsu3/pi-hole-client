<a id="readme-top"></a>

<!-- PROJECT SHIELDS -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![CodeCov][codecov-shield]][codecov-url]
[![Codaocy][codacy-shield]][codacy-url]
[![SonarQube][sonar-quality-gate-shield]][sonar-quality-gate-url]
[![Pihole V6][pihole-v6-shield]][pihole-url]
[![Pihole V5][pihole-v5-shield]][pihole-url]
![Status][status-shield]
<!-- [![CodeClimate][codeclimate-shield]][codeclimate-url] -->

<!-- PROJECT LOGO -->
<div align="center">
  <a href="https://github.com/tsutsu3/pi-hole-client">
    <img alt="Pi-hole Client Logo" src="assets/other/feature-image.png" width="600"
      style="background-color: #f9f9f9; padding: 10px; border-radius: 8px;">
  </a>
  <br><br>
  <p align="center" style="display: flex; align-items: center; justify-content: center;">
    <a href="https://play.google.com/store/apps/details?id=io.github.tsutsu3.pi_hole_client"
     target="_blank" rel="noopener noreferrer">
      <img alt="App Icon" src="assets/other/icon.png" width="48" style="margin-right: 10px;">
    </a>
    <b>
      Pi-hole client is an unofficial
      <a href="https://pi-hole.net/" target="_blank" rel="noopener noreferrer">
        Pi-hole®
      </a>
      mobile client
    </b>
  </p>
</div>

<br><br>

<div align="center">
  <p>Get the app on Google Play or download the latest release from GitHub.</p>
  <a href="https://play.google.com/store/apps/details?id=io.github.tsutsu3.pi_hole_client"
     target="_blank" rel="noopener noreferrer">
    <img alt="Get it on Google Play" src="assets/other/get-google-play.png" width="200px" height="auto">
  </a>
  <span style="display:inline-block; width: 20px;"></span>
  <a href="https://github.com/tsutsu3/pi-hole-client/releases" target="_blank" rel="noopener noreferrer">
    <img alt="Download from GitHub" src="assets/other/get-github.png" width="200px" height="auto">
  </a>
</div>

## 📚 Table of Contents

- [📚 Table of Contents](#-table-of-contents)
- [🎉 About The Project](#-about-the-project)
- [💡 Main features](#-main-features)
- [📌 Requirements](#-requirements)
- [🔑 Privacy policy](#-privacy-policy)
- [📜 Disclaimer](#-disclaimer)
- [🌟 Recommended lists](#-recommended-lists)
- [💖 Donations](#-donations)
- [🛠️ Development](#️-development)
  - [Prepare the development environment](#prepare-the-development-environment)
  - [Compile the production build](#compile-the-production-build)
  - [Code Quality and Analysis](#code-quality-and-analysis)
  - [CI/CD Secrets Management](#cicd-secrets-management)
  - [CI/CD Workflow](#cicd-workflow)
- [⚖️ License](#️-license)
- [🖋️ Credits](#️-credits)

## 🎉 About The Project

The easy way to manage your Pi-hole® server.

The Pi-hole client features a beautiful and modern user interface.

Easily view statistics, enable or disable the server, access logs, and much more.

## 💡 Main features

![ss](assets/other/ss.jpg)

<p>▶ Manage your Pi-hole® server the easy way.</p>
<p>▶ Supports Pi-hole v6.</p>
<p>▶ Connect via HTTP or HTTPS.</p>
<p>▶ Enable and disable the server with just one button.</p>
<p>▶ Visualize detailed statistics with clear, dynamic charts.</p>
<p>▶ Add multiple servers and manage them all in one place.</p>
<p>▶ Explore query logs and access detailed log information.</p>
<p>▶ Manage your domain lists: add or remove domains from the whitelist or blacklist.</p>
<p>▶ Material You interface with dynamic theming (Android 12+ only).</p>

## 📌 Requirements

- **Requires Pi-hole v6 or greater** (v5 is now considered an older version)
- **Pi-hole v5 is still supported**, but it is an outdated version

## 🔑 Privacy policy

Check the privacy policy [here](https://github.com/tsutsu3/pi-hole-client/wiki/Privacy-policy).

## 📜 Disclaimer

This is an unofficial application. The Pi-hole team and the development of the
Pi-hole software is not related in any way with this application.

## 🌟 Recommended lists

On [this repository](https://github.com/JuanRodenas/Pihole_list) you can find
some recommended lists. Thanks to [JuanRodenas](https://github.com/juanico10).

## 💖 Donations

If you like the project and you want to contribute with the development, you
can [become a sponsor on GitHub](https://github.com/sponsors/tsutsu3), or
[buy me a coffe](https://buymeacoffee.com/tsutsu3).

<div align="center">
<a href="https://www.buymeacoffee.com/tsutsu3" target="_blank">
  <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png"
    alt="Buy Me A Coffee"
    style="height: 60px !important;width: 217px !important;" >
</a>
</div>

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

### Compile the production build

#### Common

Run these commands as needed whenever you update the images.

1. Run `dart run flutter_launcher_icons`
2. Run `dart run flutter_native_splash:create`

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

📖 **[Managing CI/CD Secrets](docs/ci-secrets.md)**

This document covers:

- Required secrets for GCP authentication and secure builds.
- Encoding and storing files as GitHub Secrets.

### CI/CD Workflow

The CI/CD process is outlined in the following documentation:

📖 **[CI/CD Workflow](docs/ci-flow.md)**

## ⚖️ License

This app distributed under the Apach 2.0 License. See [LICENSE](./LICENSE) for
more information.

## 🖋️ Credits

This project is based on [DroidHole](https://github.com/jgeek00/droid-hole),
originally developed by [JGeek00](https://github.com/JGeek00).

For details on the licenses applicable to this project, please refer to [LICENSE.md](./LICENSE.md).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[status-shield]: https://img.shields.io/badge/status-beta-orange?style=for-the-badge
[issues-shield]: https://img.shields.io/github/issues/tsutsu3/pi-hole-client?style=for-the-badge
[issues-url]: https://github.com/tsutsu3/pi-hole-client/issues
[license-shield]: https://img.shields.io/github/license/tsutsu3/pi-hole-client?style=for-the-badge
[license-url]: https://github.com/tsutsu3/pi-hole-client/blob/master/LICENSE
[codecov-shield]: https://img.shields.io/codecov/c/github/tsutsu3/pi-hole-client?token=O6MIIYA211&style=for-the-badge&logo=codecov
[codecov-url]: https://codecov.io/gh/tsutsu3/pi-hole-client
[codacy-shield]: https://img.shields.io/codacy/grade/a8a50d5271be491ab68c69513f808ada?style=for-the-badge&logo=codacy
[codacy-url]: https://app.codacy.com/gh/tsutsu3/pi-hole-client/dashboard
[sonar-quality-gate-shield]: https://img.shields.io/sonar/quality_gate/tsutsu3_pi-hole-client?server=https://sonarcloud.io&style=for-the-badge&logo=sonarqube
[sonar-quality-gate-url]: https://sonarcloud.io/summary/new_code?id=tsutsu3_pi-hole-client
[pihole-v6-shield]: https://img.shields.io/badge/Pi--hole-v6-green?style=for-the-badge&logo=pihole
[pihole-v5-shield]: https://img.shields.io/badge/Pi--hole-v5-orange?style=for-the-badge&logo=pihole
[pihole-url]: https://pi-hole.net
