# Changelog

## [1.0.3_(23)](https://github.com/tsutsu3/pi-hole-client/compare/1.0.2_(21)..1.0.3_(23)) - 2025-03-11

### 🎨 Styling

- *(icon)* Fine-tune app icon color (#183) - ([dcef44d](https://github.com/tsutsu3/pi-hole-client/commit/dcef44d5ebd9bb4ca11eae96d48acaefd08d3c49))

### ⚙️ Miscellaneous Tasks

- *(README)* Remove status badg - ([524f615](https://github.com/tsutsu3/pi-hole-client/commit/524f61583890eae0d059b1f70ee135330cf5305a))


## [1.0.2_(21)](https://github.com/tsutsu3/pi-hole-client/compare/1.0.1_(19)..1.0.2_(21)) - 2025-03-10

### 🚀 Features

- *(ui)* Convert LanguageScreen & ThemeScreen to stateless, fix back gesture behavior (Mobile layout is not yet) (#176) - ([f1cb623](https://github.com/tsutsu3/pi-hole-client/commit/f1cb623c77de1c309265dffe1307778d8a04b8e1))

### ⚙️ Miscellaneous Tasks

- *(lint)* Resolve analyzer warnings - ([ebde72a](https://github.com/tsutsu3/pi-hole-client/commit/ebde72a7c557963813f4c98bae07146cb62f3f19))


## [1.0.1_(19)](https://github.com/tsutsu3/pi-hole-client/compare/1.0.0_(17)..1.0.1_(19)) - 2025-03-09

### 🐛 Bug Fixes

- *(database)* Change logsPerQuery type from int to double (#174) - ([81420b9](https://github.com/tsutsu3/pi-hole-client/commit/81420b925341e22e3ec24b98e06c0fd0436d06a5))


## [1.0.0_(17)](https://github.com/tsutsu3/pi-hole-client/compare/0.9.3_(15)..1.0.0_(17)) - 2025-03-09

### 🚀 Features

- *(icon)* Update app icon (#165) - ([419d465](https://github.com/tsutsu3/pi-hole-client/commit/419d465b3ed42f39b764df29d7319f4d5f3cb0cc))
- *(snackbar)* Add caution snackbar (#172) - ([0a9174b](https://github.com/tsutsu3/pi-hole-client/commit/0a9174bfbcdd6513b19ba945d26c487b654b252c))

### 🚜 Refactor

- *(base)* Improve formatting of _handleTabChange method parameters - ([1a7e4bd](https://github.com/tsutsu3/pi-hole-client/commit/1a7e4bd15960a511503e18044e9051881dc3e253))
- *(base)* Improve code readability and reduce duplication (#164) - ([ee817d2](https://github.com/tsutsu3/pi-hole-client/commit/ee817d22a6fcb8b46c867290e05c0e84e7d04361))
- *(settings)* Change modal to screen (#167) - ([808f559](https://github.com/tsutsu3/pi-hole-client/commit/808f5595b77d1953730ca48510f02820a5f2a29f))
- *(settings)* Move existing settings to new Performance section (#166) - ([1bd51e4](https://github.com/tsutsu3/pi-hole-client/commit/1bd51e40a6fb13898e2b561106bdf92231803f48))

### ⚡ Performance

- *(pi_hole_client)* Subscribe only to necessary provider properties (#171) - ([ac53f0f](https://github.com/tsutsu3/pi-hole-client/commit/ac53f0f4fe7f866a4c32632c9351250cadb25951))
- Reduce unnecessary rebuilds during status updates (#161) - ([d977645](https://github.com/tsutsu3/pi-hole-client/commit/d9776459b7e0b1aa80b5463b32c444a5f0021f07))

### ⚙️ Miscellaneous Tasks

- *(flutter)* Upgrade Flutter to 3.29.1 (#170) - ([b0981ad](https://github.com/tsutsu3/pi-hole-client/commit/b0981ad9442de124f557cc4260cc4cf8542a5d81))
- *(icon)* Tweak symbol size in app icon (#168) - ([f3be7bc](https://github.com/tsutsu3/pi-hole-client/commit/f3be7bcbaf40f20376590ba6476126eaaa8c7a5f))


## [0.9.3_(15)](https://github.com/tsutsu3/pi-hole-client/compare/0.9.2_(13)..0.9.3_(15)) - 2025-02-22

### 🐛 Bug Fixes

- *(add_server)* Change the default Pi-hole version to v6 (#149) - ([89af50b](https://github.com/tsutsu3/pi-hole-client/commit/89af50b9feb90b22dd3f637aa0321391b16de1ad))
- *(edit_server)* Temporarily disable the changes (#148) - ([12ae709](https://github.com/tsutsu3/pi-hole-client/commit/12ae7095ab84cf82b8abcd28a1d6df33f13988bc))
- *(l10n)* Update translations (#147) - ([dfb7c0f](https://github.com/tsutsu3/pi-hole-client/commit/dfb7c0f92dcc29463acf6d66af350502efc0a99d))
- *(secure_storage)* Clean up unused data (#150) - ([6a77cae](https://github.com/tsutsu3/pi-hole-client/commit/6a77cae8d7f95ab7c0b3acb53769c5de74a2960a))

### 🚜 Refactor

- Remove basic auth (#151) - ([99096f4](https://github.com/tsutsu3/pi-hole-client/commit/99096f43b1ed8d4a01c1be47de00fe64aaea4efe))

### 🧪 Testing

- Add tests (#133) - ([33aebd1](https://github.com/tsutsu3/pi-hole-client/commit/33aebd12c72937eb0c5628c10b4c629d116c4aa2))

### ⚙️ Miscellaneous Tasks

- *(docker)* Update pihole images - ([ef34209](https://github.com/tsutsu3/pi-hole-client/commit/ef34209adb8a1cfe9d8c0efc06c72a6dc82d1a6c))
- *(flutter)* Bump version to 3.29.0 (#146) - ([5e85eac](https://github.com/tsutsu3/pi-hole-client/commit/5e85eac33bb3e66c6950e65ede64bf4218351dab))
- *(ui)* Minor UI appearance adjustments (#132) - ([e60e6c2](https://github.com/tsutsu3/pi-hole-client/commit/e60e6c2cd1dda249f80b58d240ea1eebe18b9ccc))
- Update Flutter version to 3.27.4 in workflow files (#145) - ([af3afc7](https://github.com/tsutsu3/pi-hole-client/commit/af3afc728f728ef714e16e1ffeb05a905dab3078))
- Update sonar coverage exclusions - ([e7bbca0](https://github.com/tsutsu3/pi-hole-client/commit/e7bbca0d584bab50468da225d0f9c5a481a40e7c))


## [0.9.2_(13)](https://github.com/tsutsu3/pi-hole-client/compare/0.9.1_(11)..0.9.2_(13)) - 2025-02-02

### 🐛 Bug Fixes

- *(graph)* Resolve home graph issues (#124) - ([9e13d66](https://github.com/tsutsu3/pi-hole-client/commit/9e13d66bee5f1735e9cb83b588c84fe97dd87cfa))
- *(home_charts)* Fix overtime graph not displayed when only 'permitted data' (#115) - ([020efef](https://github.com/tsutsu3/pi-hole-client/commit/020efef8e7882486c865e08a02f547056b58b675))
- *(legal_modal)* Make AlertDialog scrollable (#119) - ([762980f](https://github.com/tsutsu3/pi-hole-client/commit/762980f0699605ecabe43e89f3a2083ac71afd6f))

### 🚜 Refactor

- *(lint)* Update lint rules (#114) - ([daaae1e](https://github.com/tsutsu3/pi-hole-client/commit/daaae1ea5547bdc097352f6b6680ab92ea84e15a))
- *(widget)* Remove unused NoServerSelected widget - ([73b398e](https://github.com/tsutsu3/pi-hole-client/commit/73b398eceeedf046b5b47224a85a41aa0aa58007))

### 📚 Documentation

- Add CI/CD workflow documentation - ([9f89a90](https://github.com/tsutsu3/pi-hole-client/commit/9f89a90ea043180a3da884fbce51972f583f1ea3))

### 🧪 Testing

- *(advanced_settings)* Add widget tests (#116) - ([02a11b9](https://github.com/tsutsu3/pi-hole-client/commit/02a11b957b804202c4831399f9e48aa7cf34c7b2))
- *(base)* Add widget tests (#125) - ([8beffda](https://github.com/tsutsu3/pi-hole-client/commit/8beffda248360f22cb7b23b6d0c7bca1eda988f3))
- *(home)* Add widget tests (#121) - ([b305ab8](https://github.com/tsutsu3/pi-hole-client/commit/b305ab818ad4115cf5e7edad892f0c3f2735acc1))
- *(logs)* Add tests (#117) - ([59efbaf](https://github.com/tsutsu3/pi-hole-client/commit/59efbaff4aa413006c397271ee7f07bec8e78d7d))
- *(main)* Add tests (#126) - ([8c9fcac](https://github.com/tsutsu3/pi-hole-client/commit/8c9fcacf3cf76258e33a15eb37946650b2e2c168))

### ⚙️ Miscellaneous Tasks

- Rename bump version step for clarity and adjust fetch depth - ([d0a434d](https://github.com/tsutsu3/pi-hole-client/commit/d0a434d88c115c2b0053f74ac3b2529e7583baed))
- Refine version extraction condition for release workflows - ([ee1e0a2](https://github.com/tsutsu3/pi-hole-client/commit/ee1e0a2810ea4ddc777d313c86920165b3f53b8f))
- Add version bump step in test release (#112) - ([abf324d](https://github.com/tsutsu3/pi-hole-client/commit/abf324db3241727533b3bc96038e399b4debd24b))


## [0.9.1_(11)](https://github.com/tsutsu3/pi-hole-client/compare/0.9.0_(10)..0.9.1_(11)) - 2025-01-25

### 🐛 Bug Fixes

- *(layout)* Fix screen layouts (#106) - ([b3f985b](https://github.com/tsutsu3/pi-hole-client/commit/b3f985b6341ec2a60731f47b4c30bde5f4e1fb4a))

### 🧪 Testing

- *(widget)* Add widget tests to improve coverage (#107) - ([d2b1967](https://github.com/tsutsu3/pi-hole-client/commit/d2b1967718b33c6c7cf64bbb7c59103e1881c23a))

### ⚙️ Miscellaneous Tasks

- Update test workflow to install system dependencies for snar (#111) - ([62ebbd5](https://github.com/tsutsu3/pi-hole-client/commit/62ebbd5e523050a0b0f99beccd6a996f7a72c5c4))
- Add test release workflow (#105) - ([0dbdb24](https://github.com/tsutsu3/pi-hole-client/commit/0dbdb24cb3caed7da93f6d4009cf78dafe9f35ef))


## [0.9.0_(10)] - 2025-01-16

### 🚀 Features

- New beta release - ([7aac13a](https://github.com/tsutsu3/pi-hole-client/commit/7aac13a153ef2383bca1458b1e23695d1f21707b))


<!-- generated by git-cliff -->
