<a id="readme-top"></a>

>[!CAUTION]
>:construction: This project is currently under development :construction:

<!-- PROJECT SHIELDS -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![CodeCov][codecov-shield]][codecov-url]
[![CodeClimate][codeclimate-shield]][codeclimate-url]
![Status][status-shield]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/tsutsu3/unbound-control-ts">
    <img src="assets/pi-hole-client.svg" width="100"/>
  </a>
  <h3 align="center">Pi-hole Client</h3>
  <p align="center">
    <b>
      Pi-hole Client is an unnoficial
      <a href="https://pi-hole.net/" target="_blank" rel="noopener noreferrer">
        Pi-hole®
      </a>
      client developed with Flutter.
    </b>
  </p>
</div>

<!-- <p align="center">
  <a href="https://play.google.com/store/apps/details?id=io.github.tsutsu3.pi_hole_client" target="_blank" rel="noopener noreferrer">
    <img src="/assets/other/get_google_play.png" width="300px">
  </a>
  <a href="https://github.com/tsutsu3/pi-hole-client/releases" target="_blank" rel="noopener noreferrer">
    <img src="/assets/other/get-github.png" width="300px">
  </a>
</p> -->

## Table of Contents

- [Main features](#main-features)
- [Privacy policy](#privacy-policy)
- [Disclaimer](#disclaimer)
- [Recommended lists](#recommended-lists)
- [Donations](#donations)
- [Development](#development)
  - [Prepare the development environment](#prepare-the-development-environment)
  - [Compile the production build](#compile-the-production-build)
- [License](#license)
- [Credits](#credits)

## Main features

<p>▶ Manage your Pi-hole® server on an easy way.</p>
<p>▶ Enable and disable the server with only one button.</p>
<p>▶ Beautiful charts with all the statistics you need to see.</p>
<p>▶ Add multiple servers to the app, and manage all of them from here.</p>
<p>▶ Explore the query logs list and see the log details.</p>
<p>▶ Manage your domain lists. Add and remove domains to the whitelist or blacklist.</p>
<p>▶ Material User interface with dynamic theming (only Android 12+)</p>
<p>Requires Android 8.0+</p>

## Privacy policy

Check the privacy policy [here](https://github.com/tsutsu3/pi-hole-client/wiki/Privacy-policy).

## Disclaimer

This is an unofficial application. The Pi-hole team and the development of the Pi-hole software is not related in any way with this application.

## Recommended lists

On [this repository](https://github.com/JuanRodenas/Pihole_list) you can find some recommended lists. Thanks to [JuanRodenas](https://github.com/juanico10).

## Donations

If you like the project and you want to contribute with the development, you can [become a sponsor on GitHub](https://github.com/sponsors/tsutsu3), or you can donate using PayPal.

<!-- <div align="center">
  <a href="https://www.paypal.com/donate/?hosted_button_id=T63UK6AVL3MG8">
    <img src="https://raw.githubusercontent.com/stefan-niedermann/paypal-donate-button/main/paypal-donate-button.png" alt="Donate with PayPal" height="100" />
  </a>
</div> -->

## Development

### Prepare the development environment

1. Clone the repository
2. Run ``flutter pub get``
3. Clone the ``.env.sample`` file and name it ``.env``
4. On the ``SENTRY_DSN`` variable assign it's value
5. Inside the ``android`` folder, clone the ``key.properties.sample`` file and name it ``key.properties``
6. Open the file and fill the variables with the corresponding values
7. Store your ``keystore.jks`` file inside ``android/app``

### Compile the production build

#### Android

1. Run ``flutter clean``
2. Run ``flutter pub get``
3. Run ``flutter build apk --release`` to build the .apk file
4. Run ``flutter build appbundle --release`` to build the .aab file

#### macOS

1. Run ``flutter clean``
2. Run ``flutter pub get``
3. Run ``flutter build macos --release`` to build the .app file

#### Linux

1. Run ``flutter clean``
2. Run ``flutter pub get``
3. Run ``flutter build linux --release`` to build the Linux executable
4. If you want to build also the .deb file do this:
  4.1. Run ``dart pub global activate flutter_to_debian`` to install the utility that will build the .deb file
  4.2. Run ``flutter_to_debian``

#### Windows

1. Run ``flutter clean``
2. Run ``flutter pub get``
3. Run ``flutter build windows --release`` to build the Windows executable
4. Install the [InnoSetup](https://jrsoftware.org/isdl.php) software you don't have it
5. Run ``iscc /Q windows/innosetup_installer_builder.iss`` to generate the Windows installer

## License

Distributed under the Apach 2.0 License. See [LICENSE](./LICENSE) for more information.

## Credits

This project is based on [DroidHole](https://github.com/jgeek00/droidhole), originally developed by [JGeek00](https://github.com/JGeek00).

See original [License](./LICENSE.md) for licensing details.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[status-shield]: https://img.shields.io/badge/status-WIP-orange?style=for-the-badge
[issues-shield]: https://img.shields.io/github/issues/tsutsu3/pi-hole-client?style=for-the-badge
[issues-url]: https://github.com/tsutsu3/pi-hole-client/issues
[license-shield]: https://img.shields.io/github/license/tsutsu3/pi-hole-client?style=for-the-badge
[license-url]: https://github.com/tsutsu3/pi-hole-client/blob/master/LICENSE.txt
[codecov-shield]: https://img.shields.io/codecov/c/github/tsutsu3/pi-hole-client?token=O6MIIYA211&style=for-the-badge&logo=codecov
[codecov-url]: https://codecov.io/gh/tsutsu3/pi-hole-client
[codeclimate-shield]: https://img.shields.io/codeclimate/maintainability/tsutsu3/pi-hole-client?style=for-the-badge&logo=codeclimate
[codeclimate-url]: https://codeclimate.com/github/tsutsu3/pi-hole-client/maintainability