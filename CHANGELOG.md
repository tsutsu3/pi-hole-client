# Changelog

## [1.2.0](https://github.com/tsutsu3/pi-hole-client/compare/1.1.0_(27)..1.2.0) - 2025-04-10

### 🚀 Features

- *(adlist)* Add adlist management screen ([#218](https://github.com/tsutsu3/pi-hole-client/issues/218)) - ([48ef9b1](https://github.com/tsutsu3/pi-hole-client/commit/48ef9b172a30a5b9a0932d75c45db46067f62238))
- *(adlists)* Add update gravity screen ([#226](https://github.com/tsutsu3/pi-hole-client/issues/226)) - ([6abb292](https://github.com/tsutsu3/pi-hole-client/commit/6abb292f2dd4162bba701c865c4c3736d101e4f6))
- *(server)* Move optional subroute settings to bottom and wrap in accordion ([#223](https://github.com/tsutsu3/pi-hole-client/issues/223)) - ([0466623](https://github.com/tsutsu3/pi-hole-client/commit/046662370f56e1ff8f3bc5029b1e93ee915af9a8))
- *(ui)* Add skeleton loading to pi-hole server info screen ([#215](https://github.com/tsutsu3/pi-hole-client/issues/215)) - ([5079179](https://github.com/tsutsu3/pi-hole-client/commit/5079179596a834eafa887273f15dd44ca675b205))
- *(uninstaller)* Delete user data on Windows, show warning only on Linux ([#217](https://github.com/tsutsu3/pi-hole-client/issues/217)) - ([87c52f4](https://github.com/tsutsu3/pi-hole-client/commit/87c52f4c6c8fa692a8f028b335fa6e72fa170b23))

### 🐛 Bug Fixes

- *(dialog)* UseRootNavigator false to handle back navigation correctly on mobile ([#221](https://github.com/tsutsu3/pi-hole-client/issues/221)) - ([f1e87ef](https://github.com/tsutsu3/pi-hole-client/commit/f1e87ef142359ef060b7dc8031436f16a4451438))
- *(edit_adlist)* Update progress modal message and correct localization key ([#230](https://github.com/tsutsu3/pi-hole-client/issues/230)) - ([738d8dd](https://github.com/tsutsu3/pi-hole-client/commit/738d8dd1c4d20c57270dc746144f3ba4126bd1f2))
- *(i18n)* Shorten Polish home label to prevent layout issues - ([02da8ec](https://github.com/tsutsu3/pi-hole-client/commit/02da8ec357e38d28621f312b1f1fb4b4c6d7ec30))
- *(process_modal)* Use rootOverlay to prevent app exit on back press (mobile only) ([#231](https://github.com/tsutsu3/pi-hole-client/issues/231)) - ([ce0458d](https://github.com/tsutsu3/pi-hole-client/commit/ce0458d1472a8db781ee15aa660d31e53f3fd1a9))
- *(server_info)* Enable back navigation on empty data screen - ([f41afb8](https://github.com/tsutsu3/pi-hole-client/commit/f41afb808e3a3d6f376b43843338c7c7cf23cf08))
- *(server_info)* Avoid null crash in ServerInfoScreen when no server is selected ([#220](https://github.com/tsutsu3/pi-hole-client/issues/220)) - ([5a42b00](https://github.com/tsutsu3/pi-hole-client/commit/5a42b0004c90c8a2c6e112c3fd1570092650bbe3))
- *(server_info)* Handle server info fetch failure in ServerInfoScreen ([#216](https://github.com/tsutsu3/pi-hole-client/issues/216)) - ([99473fb](https://github.com/tsutsu3/pi-hole-client/commit/99473fbb77d9b810bed3c0f5fb0dbd893aebf41a))
- *(subscriptions)* Align tab bar to the start - ([618edbb](https://github.com/tsutsu3/pi-hole-client/commit/618edbb062987a5f7f529a2f9b9cdf7c74b43bd3))
- *(version_info)* Handle null values in _canUpdate method - ([c2b5f14](https://github.com/tsutsu3/pi-hole-client/commit/c2b5f1460e6776d6e7ee52d36c48c54a7ca69df3))
- *(windows)* Include missing DLLs in installer to prevent launch failure ([#213](https://github.com/tsutsu3/pi-hole-client/issues/213)) - ([dbf67a7](https://github.com/tsutsu3/pi-hole-client/commit/dbf67a75cd2bc613b5051ba25c1321602a637326))
- *(workflow)* Fully remove Android release step to fix syntax error - ([6cf7b69](https://github.com/tsutsu3/pi-hole-client/commit/6cf7b69ca5c96b652bb4c0947b50025cbc2c9d97))

### 🚜 Refactor

- *(server)* Extract common API error handling logic ([#222](https://github.com/tsutsu3/pi-hole-client/issues/222)) - ([12d531f](https://github.com/tsutsu3/pi-hole-client/commit/12d531fde3b6d6a13bc13d9fb2165745aecfc39a))

### ⚙️ Miscellaneous Tasks

- *(android)* Disable autoBackup as a tentative fix for app launch … ([#228](https://github.com/tsutsu3/pi-hole-client/issues/228)) - ([31f1cc2](https://github.com/tsutsu3/pi-hole-client/commit/31f1cc2a29ee28707f062a2466f6a0cd3c41c63b))
- *(workflow)* Include contributors in release changelog extraction - ([e4b5704](https://github.com/tsutsu3/pi-hole-client/commit/e4b57047524b3c706cde43bdba08ba7da5480abb))

## 🎉 New Contributors 🎉

* @tsutsu3 made their first contribution
* @dependabot[bot] made their first contribution in [#219](https://github.com/tsutsu3/pi-hole-client/pull/219)

## [1.1.0_(27)](https://github.com/tsutsu3/pi-hole-client/compare/1.0.3_(23)..1.1.0_(27)) - 2025-03-20

### 🚀 Features

- *(ci)* Add manual build workflow for Linux - ([ef16e72](https://github.com/tsutsu3/pi-hole-client/commit/ef16e72930bd1f397d8f6cf10e3b689d19d59e61))
- *(home)* Improve server switch indication ([#202](https://github.com/tsutsu3/pi-hole-client/issues/202)) - ([246cef1](https://github.com/tsutsu3/pi-hole-client/commit/246cef176054c8b6dd0a201a897cf4d947ec46b0))
- *(log)* Add timestamp to log messages - ([0184757](https://github.com/tsutsu3/pi-hole-client/commit/0184757d05428e77d7df9f69fecfbad550c29791))
- *(settings)* Add Pi-hole server info page ([#203](https://github.com/tsutsu3/pi-hole-client/issues/203)) - ([34adbd7](https://github.com/tsutsu3/pi-hole-client/commit/34adbd7c06287835d5be71bb4c6297d76da40b2a))
- *(settings)* Add server connection guide ([#192](https://github.com/tsutsu3/pi-hole-client/issues/192)) - ([b3c78cc](https://github.com/tsutsu3/pi-hole-client/commit/b3c78cc173492e50b7deed2b7c29a9d83c485728))
- *(ssl)* Change default value of overrideSslCheck to true ([#210](https://github.com/tsutsu3/pi-hole-client/issues/210)) - ([22ad313](https://github.com/tsutsu3/pi-hole-client/commit/22ad313962cc8d0383116e32085acab54113617f))

### 🐛 Bug Fixes

- *(debian)* Resolve dpkg warning when removing piholeclient ([#201](https://github.com/tsutsu3/pi-hole-client/issues/201)) - ([845a09f](https://github.com/tsutsu3/pi-hole-client/commit/845a09f9926f5cdd46c2b8aaed20a64ca6b8286f))
- *(log-filter)* Ensure clients appears without manual refresh ([#185](https://github.com/tsutsu3/pi-hole-client/issues/185)) - ([f387087](https://github.com/tsutsu3/pi-hole-client/commit/f387087eb53e66f3f05742a3ed35da48fbef82ac))
- *(servers-list)* Add bottom padding to prevent FAB overlap - ([b3dd7ab](https://github.com/tsutsu3/pi-hole-client/commit/b3dd7ab25a19eaca8857acc3fca4318ea140cb2d))
- *(settings)* Prevent navigation to home after selecting server ([#195](https://github.com/tsutsu3/pi-hole-client/issues/195)) - ([ddd991a](https://github.com/tsutsu3/pi-hole-client/commit/ddd991aefefebb1bafef95f1f50dbd794ea94318))
- *(settings)* Navigate to initial screen after app reset - ([abf6ecf](https://github.com/tsutsu3/pi-hole-client/commit/abf6ecf490e84a45da556df0596e11992bb0212a))
- *(status_update_service)* Reduce excessive web sessions on Pi-hole v6 ([#207](https://github.com/tsutsu3/pi-hole-client/issues/207)) - ([ffba769](https://github.com/tsutsu3/pi-hole-client/commit/ffba769f0e1d7f6c22e73b3edbbc456941e7bfe5))
- *(status_update_service)* Prevent null check error by capturing current server state ([#206](https://github.com/tsutsu3/pi-hole-client/issues/206)) - ([d8c6993](https://github.com/tsutsu3/pi-hole-client/commit/d8c699362261122a4d6bf409f28bceac1f4cf04a))
- *(ui)* Add SafeArea to prevent screen cutoff - ([509ad5d](https://github.com/tsutsu3/pi-hole-client/commit/509ad5d3c9560ed2c8c6149458624bfd32c1736a))

### 🚜 Refactor

- *(reset)* Convert reset modal to full screen ([#186](https://github.com/tsutsu3/pi-hole-client/issues/186)) - ([84343ac](https://github.com/tsutsu3/pi-hole-client/commit/84343ac3a73c24b62adbf002972d3b627fb9c505))

### 🧪 Testing

- *(theme)* Add unit tests for theme creation ([#190](https://github.com/tsutsu3/pi-hole-client/issues/190)) - ([f488555](https://github.com/tsutsu3/pi-hole-client/commit/f488555b9b56b12855abfc302edcb24ed92e8382))

### ⚙️ Miscellaneous Tasks

- *(ci)* Update git-cliff changelog format ([#200](https://github.com/tsutsu3/pi-hole-client/issues/200)) - ([2115b88](https://github.com/tsutsu3/pi-hole-client/commit/2115b88b2e68c88b79604c827de5e7a37939fdd8))
- *(config)* Update repository URL in postprocessors - ([4133d9d](https://github.com/tsutsu3/pi-hole-client/commit/4133d9de34fb557dd0e686eee6d1fa17a22e19ca))
- *(settings)* Rename section - ([a6b2e78](https://github.com/tsutsu3/pi-hole-client/commit/a6b2e78315d34a81aa53822a681afaae0d9575b0))
- *(template)* Request more info and hide clarifications after submission ([#197](https://github.com/tsutsu3/pi-hole-client/issues/197)) - ([74ab278](https://github.com/tsutsu3/pi-hole-client/commit/74ab2787d48f03e44960efa0d190d0396a174d60))

## 🎉 New Contributors 🎉

* @mwoolweaver made their first contribution in [#197](https://github.com/tsutsu3/pi-hole-client/pull/197)

## [1.0.3_(23)](https://github.com/tsutsu3/pi-hole-client/compare/1.0.2_(21)..1.0.3_(23)) - 2025-03-11

### 🎨 Styling

- *(icon)* Fine-tune app icon color ([#183](https://github.com/tsutsu3/pi-hole-client/issues/183)) - ([dcef44d](https://github.com/tsutsu3/pi-hole-client/commit/dcef44d5ebd9bb4ca11eae96d48acaefd08d3c49))

### ⚙️ Miscellaneous Tasks

- *(README)* Remove status badg - ([524f615](https://github.com/tsutsu3/pi-hole-client/commit/524f61583890eae0d059b1f70ee135330cf5305a))


## [1.0.2_(21)](https://github.com/tsutsu3/pi-hole-client/compare/1.0.1_(19)..1.0.2_(21)) - 2025-03-10

### 🚀 Features

- *(ui)* Convert LanguageScreen & ThemeScreen to stateless, fix back gesture behavior (Mobile layout is not yet) ([#176](https://github.com/tsutsu3/pi-hole-client/issues/176)) - ([f1cb623](https://github.com/tsutsu3/pi-hole-client/commit/f1cb623c77de1c309265dffe1307778d8a04b8e1))

### ⚙️ Miscellaneous Tasks

- *(lint)* Resolve analyzer warnings - ([ebde72a](https://github.com/tsutsu3/pi-hole-client/commit/ebde72a7c557963813f4c98bae07146cb62f3f19))


## [1.0.1_(19)](https://github.com/tsutsu3/pi-hole-client/compare/1.0.0_(17)..1.0.1_(19)) - 2025-03-09

### 🐛 Bug Fixes

- *(database)* Change logsPerQuery type from int to double ([#174](https://github.com/tsutsu3/pi-hole-client/issues/174)) - ([81420b9](https://github.com/tsutsu3/pi-hole-client/commit/81420b925341e22e3ec24b98e06c0fd0436d06a5))


## [1.0.0_(17)](https://github.com/tsutsu3/pi-hole-client/compare/0.9.3_(15)..1.0.0_(17)) - 2025-03-09

### 🚀 Features

- *(icon)* Update app icon ([#165](https://github.com/tsutsu3/pi-hole-client/issues/165)) - ([419d465](https://github.com/tsutsu3/pi-hole-client/commit/419d465b3ed42f39b764df29d7319f4d5f3cb0cc))
- *(snackbar)* Add caution snackbar ([#172](https://github.com/tsutsu3/pi-hole-client/issues/172)) - ([0a9174b](https://github.com/tsutsu3/pi-hole-client/commit/0a9174bfbcdd6513b19ba945d26c487b654b252c))

### 🚜 Refactor

- *(base)* Improve formatting of _handleTabChange method parameters - ([1a7e4bd](https://github.com/tsutsu3/pi-hole-client/commit/1a7e4bd15960a511503e18044e9051881dc3e253))
- *(base)* Improve code readability and reduce duplication ([#164](https://github.com/tsutsu3/pi-hole-client/issues/164)) - ([ee817d2](https://github.com/tsutsu3/pi-hole-client/commit/ee817d22a6fcb8b46c867290e05c0e84e7d04361))
- *(settings)* Change modal to screen ([#167](https://github.com/tsutsu3/pi-hole-client/issues/167)) - ([808f559](https://github.com/tsutsu3/pi-hole-client/commit/808f5595b77d1953730ca48510f02820a5f2a29f))
- *(settings)* Move existing settings to new Performance section ([#166](https://github.com/tsutsu3/pi-hole-client/issues/166)) - ([1bd51e4](https://github.com/tsutsu3/pi-hole-client/commit/1bd51e40a6fb13898e2b561106bdf92231803f48))

### ⚡ Performance

- *(pi_hole_client)* Subscribe only to necessary provider properties ([#171](https://github.com/tsutsu3/pi-hole-client/issues/171)) - ([ac53f0f](https://github.com/tsutsu3/pi-hole-client/commit/ac53f0f4fe7f866a4c32632c9351250cadb25951))
- Reduce unnecessary rebuilds during status updates ([#161](https://github.com/tsutsu3/pi-hole-client/issues/161)) - ([d977645](https://github.com/tsutsu3/pi-hole-client/commit/d9776459b7e0b1aa80b5463b32c444a5f0021f07))

### ⚙️ Miscellaneous Tasks

- *(flutter)* Upgrade Flutter to 3.29.1 ([#170](https://github.com/tsutsu3/pi-hole-client/issues/170)) - ([b0981ad](https://github.com/tsutsu3/pi-hole-client/commit/b0981ad9442de124f557cc4260cc4cf8542a5d81))
- *(icon)* Tweak symbol size in app icon ([#168](https://github.com/tsutsu3/pi-hole-client/issues/168)) - ([f3be7bc](https://github.com/tsutsu3/pi-hole-client/commit/f3be7bcbaf40f20376590ba6476126eaaa8c7a5f))


## [0.9.3_(15)](https://github.com/tsutsu3/pi-hole-client/compare/0.9.2_(13)..0.9.3_(15)) - 2025-02-22

### 🐛 Bug Fixes

- *(add_server)* Change the default Pi-hole version to v6 ([#149](https://github.com/tsutsu3/pi-hole-client/issues/149)) - ([89af50b](https://github.com/tsutsu3/pi-hole-client/commit/89af50b9feb90b22dd3f637aa0321391b16de1ad))
- *(edit_server)* Temporarily disable the changes ([#148](https://github.com/tsutsu3/pi-hole-client/issues/148)) - ([12ae709](https://github.com/tsutsu3/pi-hole-client/commit/12ae7095ab84cf82b8abcd28a1d6df33f13988bc))
- *(l10n)* Update translations ([#147](https://github.com/tsutsu3/pi-hole-client/issues/147)) - ([dfb7c0f](https://github.com/tsutsu3/pi-hole-client/commit/dfb7c0f92dcc29463acf6d66af350502efc0a99d))
- *(secure_storage)* Clean up unused data ([#150](https://github.com/tsutsu3/pi-hole-client/issues/150)) - ([6a77cae](https://github.com/tsutsu3/pi-hole-client/commit/6a77cae8d7f95ab7c0b3acb53769c5de74a2960a))

### 🚜 Refactor

- Remove basic auth ([#151](https://github.com/tsutsu3/pi-hole-client/issues/151)) - ([99096f4](https://github.com/tsutsu3/pi-hole-client/commit/99096f43b1ed8d4a01c1be47de00fe64aaea4efe))

### 🧪 Testing

- Add tests ([#133](https://github.com/tsutsu3/pi-hole-client/issues/133)) - ([33aebd1](https://github.com/tsutsu3/pi-hole-client/commit/33aebd12c72937eb0c5628c10b4c629d116c4aa2))

### ⚙️ Miscellaneous Tasks

- *(docker)* Update pihole images - ([ef34209](https://github.com/tsutsu3/pi-hole-client/commit/ef34209adb8a1cfe9d8c0efc06c72a6dc82d1a6c))
- *(flutter)* Bump version to 3.29.0 ([#146](https://github.com/tsutsu3/pi-hole-client/issues/146)) - ([5e85eac](https://github.com/tsutsu3/pi-hole-client/commit/5e85eac33bb3e66c6950e65ede64bf4218351dab))
- *(ui)* Minor UI appearance adjustments ([#132](https://github.com/tsutsu3/pi-hole-client/issues/132)) - ([e60e6c2](https://github.com/tsutsu3/pi-hole-client/commit/e60e6c2cd1dda249f80b58d240ea1eebe18b9ccc))
- Update Flutter version to 3.27.4 in workflow files ([#145](https://github.com/tsutsu3/pi-hole-client/issues/145)) - ([af3afc7](https://github.com/tsutsu3/pi-hole-client/commit/af3afc728f728ef714e16e1ffeb05a905dab3078))
- Update sonar coverage exclusions - ([e7bbca0](https://github.com/tsutsu3/pi-hole-client/commit/e7bbca0d584bab50468da225d0f9c5a481a40e7c))


## [0.9.2_(13)](https://github.com/tsutsu3/pi-hole-client/compare/0.9.1_(11)..0.9.2_(13)) - 2025-02-02

### 🐛 Bug Fixes

- *(graph)* Resolve home graph issues ([#124](https://github.com/tsutsu3/pi-hole-client/issues/124)) - ([9e13d66](https://github.com/tsutsu3/pi-hole-client/commit/9e13d66bee5f1735e9cb83b588c84fe97dd87cfa))
- *(home_charts)* Fix overtime graph not displayed when only 'permitted data' ([#115](https://github.com/tsutsu3/pi-hole-client/issues/115)) - ([020efef](https://github.com/tsutsu3/pi-hole-client/commit/020efef8e7882486c865e08a02f547056b58b675))
- *(legal_modal)* Make AlertDialog scrollable ([#119](https://github.com/tsutsu3/pi-hole-client/issues/119)) - ([762980f](https://github.com/tsutsu3/pi-hole-client/commit/762980f0699605ecabe43e89f3a2083ac71afd6f))

### 🚜 Refactor

- *(lint)* Update lint rules ([#114](https://github.com/tsutsu3/pi-hole-client/issues/114)) - ([daaae1e](https://github.com/tsutsu3/pi-hole-client/commit/daaae1ea5547bdc097352f6b6680ab92ea84e15a))
- *(widget)* Remove unused NoServerSelected widget - ([73b398e](https://github.com/tsutsu3/pi-hole-client/commit/73b398eceeedf046b5b47224a85a41aa0aa58007))

### 📚 Documentation

- Add CI/CD workflow documentation - ([9f89a90](https://github.com/tsutsu3/pi-hole-client/commit/9f89a90ea043180a3da884fbce51972f583f1ea3))

### 🧪 Testing

- *(advanced_settings)* Add widget tests ([#116](https://github.com/tsutsu3/pi-hole-client/issues/116)) - ([02a11b9](https://github.com/tsutsu3/pi-hole-client/commit/02a11b957b804202c4831399f9e48aa7cf34c7b2))
- *(base)* Add widget tests ([#125](https://github.com/tsutsu3/pi-hole-client/issues/125)) - ([8beffda](https://github.com/tsutsu3/pi-hole-client/commit/8beffda248360f22cb7b23b6d0c7bca1eda988f3))
- *(home)* Add widget tests ([#121](https://github.com/tsutsu3/pi-hole-client/issues/121)) - ([b305ab8](https://github.com/tsutsu3/pi-hole-client/commit/b305ab818ad4115cf5e7edad892f0c3f2735acc1))
- *(logs)* Add tests ([#117](https://github.com/tsutsu3/pi-hole-client/issues/117)) - ([59efbaf](https://github.com/tsutsu3/pi-hole-client/commit/59efbaff4aa413006c397271ee7f07bec8e78d7d))
- *(main)* Add tests ([#126](https://github.com/tsutsu3/pi-hole-client/issues/126)) - ([8c9fcac](https://github.com/tsutsu3/pi-hole-client/commit/8c9fcacf3cf76258e33a15eb37946650b2e2c168))

### ⚙️ Miscellaneous Tasks

- Rename bump version step for clarity and adjust fetch depth - ([d0a434d](https://github.com/tsutsu3/pi-hole-client/commit/d0a434d88c115c2b0053f74ac3b2529e7583baed))
- Refine version extraction condition for release workflows - ([ee1e0a2](https://github.com/tsutsu3/pi-hole-client/commit/ee1e0a2810ea4ddc777d313c86920165b3f53b8f))
- Add version bump step in test release ([#112](https://github.com/tsutsu3/pi-hole-client/issues/112)) - ([abf324d](https://github.com/tsutsu3/pi-hole-client/commit/abf324db3241727533b3bc96038e399b4debd24b))


## [0.9.1_(11)](https://github.com/tsutsu3/pi-hole-client/compare/0.9.0_(10)..0.9.1_(11)) - 2025-01-25

### 🐛 Bug Fixes

- *(layout)* Fix screen layouts ([#106](https://github.com/tsutsu3/pi-hole-client/issues/106)) - ([b3f985b](https://github.com/tsutsu3/pi-hole-client/commit/b3f985b6341ec2a60731f47b4c30bde5f4e1fb4a))

### 🧪 Testing

- *(widget)* Add widget tests to improve coverage ([#107](https://github.com/tsutsu3/pi-hole-client/issues/107)) - ([d2b1967](https://github.com/tsutsu3/pi-hole-client/commit/d2b1967718b33c6c7cf64bbb7c59103e1881c23a))

### ⚙️ Miscellaneous Tasks

- Update test workflow to install system dependencies for snar ([#111](https://github.com/tsutsu3/pi-hole-client/issues/111)) - ([62ebbd5](https://github.com/tsutsu3/pi-hole-client/commit/62ebbd5e523050a0b0f99beccd6a996f7a72c5c4))
- Add test release workflow ([#105](https://github.com/tsutsu3/pi-hole-client/issues/105)) - ([0dbdb24](https://github.com/tsutsu3/pi-hole-client/commit/0dbdb24cb3caed7da93f6d4009cf78dafe9f35ef))


## [0.9.0_(10)] - 2025-01-16

### 🚀 Features

- New beta release - ([7aac13a](https://github.com/tsutsu3/pi-hole-client/commit/7aac13a153ef2383bca1458b1e23695d1f21707b))


<!-- generated by git-cliff -->
