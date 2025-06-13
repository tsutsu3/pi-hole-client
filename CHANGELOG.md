# Changelog

## [1.4.0](https://github.com/tsutsu3/pi-hole-client/compare/1.3.0_(41)..1.4.0) - 2025-06-13

### 🚀 Features

- *(advanced_settings)* Add actions ([#290](https://github.com/tsutsu3/pi-hole-client/issues/290)) - ([543d777](https://github.com/tsutsu3/pi-hole-client/commit/543d7775cc733bc81654abb2ff6fa9253129950f))
- *(app_detail)* Add support for developer link ([#285](https://github.com/tsutsu3/pi-hole-client/issues/285)) - ([efb07fd](https://github.com/tsutsu3/pi-hole-client/commit/efb07fdcea37edbd45f1e3070e360f61ce6662c3))
- *(interface)* Add interface screen ([#287](https://github.com/tsutsu3/pi-hole-client/issues/287)) - ([fafe499](https://github.com/tsutsu3/pi-hole-client/commit/fafe499f1bd087c1bd04f449d498ff422841696b))
- *(options)* Add network screen ([#296](https://github.com/tsutsu3/pi-hole-client/issues/296)) - ([193d747](https://github.com/tsutsu3/pi-hole-client/commit/193d747a13b82f609480ab185e3670214500f664))
- *(settings)* Add session management screen ([#294](https://github.com/tsutsu3/pi-hole-client/issues/294)) - ([1629219](https://github.com/tsutsu3/pi-hole-client/commit/1629219e50eda38d466b58450a1c02f66022345b))
- *(statistics)* Add DNS metrics graphs ([#283](https://github.com/tsutsu3/pi-hole-client/issues/283)) - ([e11c7dd](https://github.com/tsutsu3/pi-hole-client/commit/e11c7dd432220283145954b25cae4fa72db24864))
- *(ui)* Enable auto-save for refresh interval and log quantity in advanced settings ([#273](https://github.com/tsutsu3/pi-hole-client/issues/273)) - ([1bbabbb](https://github.com/tsutsu3/pi-hole-client/commit/1bbabbb7fe4170d1b70dfe047fa6d1dbad5cf678))
- *(ui)* Improve NoDataChart layout and section labeling on home and statistics pages ([#272](https://github.com/tsutsu3/pi-hole-client/issues/272)) - ([6119943](https://github.com/tsutsu3/pi-hole-client/commit/6119943362933a2c2526f15c5a0e9d80e69171f4))

### 🐛 Bug Fixes

- *(app_details)* Simplify support developer subtitle ([#286](https://github.com/tsutsu3/pi-hole-client/issues/286)) - ([f8400b4](https://github.com/tsutsu3/pi-hole-client/commit/f8400b4dbb7075e668d6bc8c44a341405023b347))
- *(context)* Ensure safe usage with context.mounted checks ([#282](https://github.com/tsutsu3/pi-hole-client/issues/282)) - ([05a4fc7](https://github.com/tsutsu3/pi-hole-client/commit/05a4fc7a3fbeea3855d437ef47c0fa9c26bb50e1))
- Improve robustness of biometric and device info initialization ([#292](https://github.com/tsutsu3/pi-hole-client/issues/292)) - ([f2a9e23](https://github.com/tsutsu3/pi-hole-client/commit/f2a9e2375c0d5d9abf7843fa17e7332d6fa1b9fb))

### 📚 Documentation

- *(readme)* Fix typo in Apache 2.0 license notice - ([76f48db](https://github.com/tsutsu3/pi-hole-client/commit/76f48db795ffbcb00b33ee8f1774fd88ee24fb67))

### 🎨 Styling

- *(logs)* Unify datetime display format to yyyy-MM-dd ([#278](https://github.com/tsutsu3/pi-hole-client/issues/278)) - ([4e80882](https://github.com/tsutsu3/pi-hole-client/commit/4e808820b95b08a3c8a89d77c39c1f5af6bea51f))
- *(ui)* Improve appearance of delete and cancel buttons ([#289](https://github.com/tsutsu3/pi-hole-client/issues/289)) - ([245ff6d](https://github.com/tsutsu3/pi-hole-client/commit/245ff6d7b38cc557c9c0acb32c9f6a3c9fef1f41))

### ⚙️ Miscellaneous Tasks

- *(build)* Update toolchain and dependencies ([#297](https://github.com/tsutsu3/pi-hole-client/issues/297)) - ([9b83bb3](https://github.com/tsutsu3/pi-hole-client/commit/9b83bb3a95e97ec32b253c20352e65378cf21097))
- *(ui)* Replace icons in domain detail screen ([#274](https://github.com/tsutsu3/pi-hole-client/issues/274)) - ([5e52624](https://github.com/tsutsu3/pi-hole-client/commit/5e526245cbc8e03b1510a76562a869615b61bb11))
- *(winget)* Update environment variable setup and specify working directory for wingetcreate - ([8b6cb56](https://github.com/tsutsu3/pi-hole-client/commit/8b6cb569724b2f86d633f6637bbf7a62a7c6f171))
- *(winget)* Winget manifest for v1.3.0 ([#270](https://github.com/tsutsu3/pi-hole-client/issues/270)) - ([f866c59](https://github.com/tsutsu3/pi-hole-client/commit/f866c597a5f35618af779fb57e72200d1f68e049))

## 🎉 New Contributors 🎉

* @tsutsu3 made their first contribution in [#297](https://github.com/tsutsu3/pi-hole-client/pull/297)
* @dependabot[bot] made their first contribution in [#269](https://github.com/tsutsu3/pi-hole-client/pull/269)
* @github-actions[bot] made their first contribution in [#270](https://github.com/tsutsu3/pi-hole-client/pull/270)

## [1.3.0_(41)](https://github.com/tsutsu3/pi-hole-client/compare/1.2.1_(33)..1.3.0_(41)) - 2025-05-17

### 🚀 Features

- *(chart_vis_screen)* Add chart display mode setting for Home screen ([#256](https://github.com/tsutsu3/pi-hole-client/issues/256)) - ([1ad433c](https://github.com/tsutsu3/pi-hole-client/commit/1ad433cb8c09bf36a1c83661683df44b9b9e321d))
- *(domains)* Enable editing comment, status, and groups in domain detail screen ([#254](https://github.com/tsutsu3/pi-hole-client/issues/254)) - ([af3a5b9](https://github.com/tsutsu3/pi-hole-client/commit/af3a5b9cece213224b520f2334ae5ebbc00df9e9))
- *(servers)* Allow editing default connection and SSL cert options on edit page ([#260](https://github.com/tsutsu3/pi-hole-client/issues/260)) - ([be09e77](https://github.com/tsutsu3/pi-hole-client/commit/be09e77cf8a35b8528f2988f16ad1d2d66f0681b))
- *(settings)* Deprecate global certificate setting in favor of per-server configuration ([#259](https://github.com/tsutsu3/pi-hole-client/issues/259)) - ([5862d21](https://github.com/tsutsu3/pi-hole-client/commit/5862d21026f8148cf46f8a6443dfde32a642837e))
- *(statistics)* Adjust default donut chart size via constructor ([#255](https://github.com/tsutsu3/pi-hole-client/issues/255)) - ([48c998b](https://github.com/tsutsu3/pi-hole-client/commit/48c998b1b33aa1bb7a6eafb8897383e35f073bc9))

### 🐛 Bug Fixes

- *(database)* Add retry logic after migration to prevent initial access failures on real devices ([#262](https://github.com/tsutsu3/pi-hole-client/issues/262)) - ([56b0f3a](https://github.com/tsutsu3/pi-hole-client/commit/56b0f3aded83cf89fe44458be8116e58e8d420a0))
- *(domain)* Prevent crash by hiding group list on v5 ([#264](https://github.com/tsutsu3/pi-hole-client/issues/264)) - ([1192bf5](https://github.com/tsutsu3/pi-hole-client/commit/1192bf506be6985562b92ac3e833481de02031d7))
- *(overtime_data)* Handle empty over_time list to prevent _TypeError on parsing ([#265](https://github.com/tsutsu3/pi-hole-client/issues/265)) - ([fd69ce1](https://github.com/tsutsu3/pi-hole-client/commit/fd69ce1efc09030de9a804f116de42e19d6b1152))

### 📚 Documentation

- *(development)* Fix incorrect markdown link path - ([b1e6e07](https://github.com/tsutsu3/pi-hole-client/commit/b1e6e07fdde1f5761a1af2a7b4688b42be69adb1))

### 🎨 Styling

- *(chart)* Improve colors for dark mode readability ([#258](https://github.com/tsutsu3/pi-hole-client/issues/258)) - ([06ab6d1](https://github.com/tsutsu3/pi-hole-client/commit/06ab6d109b51410ddbb08015eafc2c70de18b670))

### ⚙️ Miscellaneous Tasks

- *(ci)* Update workflow - ([e4d3a6f](https://github.com/tsutsu3/pi-hole-client/commit/e4d3a6fab8591421e24b2d068eec0538d2ea8bbc))
- *(license)* Update copyright years to 2024 - 2025 in LICENSE and NOTICE files - ([94f82e9](https://github.com/tsutsu3/pi-hole-client/commit/94f82e90c7e96a11cedd67d2491311b4471aae09))
- *(test)* Ensure coverage artifact upload occurs regardless of test results - ([aeffac9](https://github.com/tsutsu3/pi-hole-client/commit/aeffac968b6ccc4cf2c20e2fb6d37941ce43855b))
- *(winget)* Winget manifest for v1.2.1 ([#251](https://github.com/tsutsu3/pi-hole-client/issues/251)) - ([69e5ac5](https://github.com/tsutsu3/pi-hole-client/commit/69e5ac535ef5ab738a1e3feb217fc0b2e12e9a3c))

## 🎉 New Contributors 🎉

* @github-actions[bot] made their first contribution in [#251](https://github.com/tsutsu3/pi-hole-client/pull/251)

## [1.2.1_(33)](https://github.com/tsutsu3/pi-hole-client/compare/1.2.0_(31)..1.2.1_(33)) - 2025-04-27

### 🚀 Features

- *(model)* Support %cpu field from FTL v6.1 ([#244](https://github.com/tsutsu3/pi-hole-client/issues/244)) - ([cbcc910](https://github.com/tsutsu3/pi-hole-client/commit/cbcc91067c60e39a2cfef0a040694932751399f9))

### 🐛 Bug Fixes

- *(gravity_update)* Improve layout by applying SafeArea to ListView ([#246](https://github.com/tsutsu3/pi-hole-client/issues/246)) - ([49d8cd6](https://github.com/tsutsu3/pi-hole-client/commit/49d8cd65d50f89bd23b13d4658e71bb125bf26d1))
- *(home)* Add scroll padding to avoid FAB overlap - ([8e57c96](https://github.com/tsutsu3/pi-hole-client/commit/8e57c96bedad212abf337697eb5312a1201bb8af))
- *(logs_filter_modal)* Keep action buttons always visible in dialog ([#248](https://github.com/tsutsu3/pi-hole-client/issues/248)) - ([c973b43](https://github.com/tsutsu3/pi-hole-client/commit/c973b438e142ebf8775d03cec6148942e26761eb))
- *(modal)* Prevent bottom overflow when keyboard is visible in landscape ([#249](https://github.com/tsutsu3/pi-hole-client/issues/249)) - ([b916698](https://github.com/tsutsu3/pi-hole-client/commit/b916698ac3d7a05fa3e1521c423f17dd47ae1a59))
- *(navrail)* Prevent bottom overflow in CustomNavigationRail with scrollable layout ([#247](https://github.com/tsutsu3/pi-hole-client/issues/247)) - ([1fa3267](https://github.com/tsutsu3/pi-hole-client/commit/1fa3267305bdeb7a0b13144ebc85360baddf4799))
- *(overtime_data)* Handle null client names by providing an empty string ([#241](https://github.com/tsutsu3/pi-hole-client/issues/241)) - ([fccd11a](https://github.com/tsutsu3/pi-hole-client/commit/fccd11a5c6d57c8bd0c2e52903045788e1057234))
- *(scroll)* Keep footer buttons fixed at the bottom ([#239](https://github.com/tsutsu3/pi-hole-client/issues/239)) - ([f2beffb](https://github.com/tsutsu3/pi-hole-client/commit/f2beffb583d346ddbbef1065db96c6d60e07f0a3))
- *(statistics)* Isolate ScrollControllers for each CustomTabContent ([#245](https://github.com/tsutsu3/pi-hole-client/issues/245)) - ([58979db](https://github.com/tsutsu3/pi-hole-client/commit/58979db28dd81600a93ad5e6c8e73741b6c63033))

### 🚜 Refactor

- *(delete_modal)* Unify delete modals into reusable component ([#237](https://github.com/tsutsu3/pi-hole-client/issues/237)) - ([77c284d](https://github.com/tsutsu3/pi-hole-client/commit/77c284df172ecde41a5508e5620295ba7a95f35b))
- *(domain_tile)* Simplify content layout in DomainTile widget ([#236](https://github.com/tsutsu3/pi-hole-client/issues/236)) - ([0726d37](https://github.com/tsutsu3/pi-hole-client/commit/0726d3732a105f7e0f3d2fba674ae419577f0acd))

### 📚 Documentation

- *(README)* Update features and Codacy badge in README - ([ca74582](https://github.com/tsutsu3/pi-hole-client/commit/ca7458206e9e4a59579e557b044d2b359cbd21e6))

### 🧪 Testing

- *(home)* Improve home screen widget tests for better accuracy - ([7a9f351](https://github.com/tsutsu3/pi-hole-client/commit/7a9f3513981178b3c32a78e3ed540236b19fdd39))
- *(tests)* Remove TODOs and refine transaction mocks across files - ([eee7d94](https://github.com/tsutsu3/pi-hole-client/commit/eee7d945595459f7b429d3aed6565e12aa5fa991))

### ⚙️ Miscellaneous Tasks

- *(codacy)* Exclude CHANGELOG.md from Codacy analysis - ([3d4e3e4](https://github.com/tsutsu3/pi-hole-client/commit/3d4e3e43fd06853e9d27968008d7d61001624947))
- *(codacy)* Add Codacy configuration file ([#235](https://github.com/tsutsu3/pi-hole-client/issues/235)) - ([f8730f8](https://github.com/tsutsu3/pi-hole-client/commit/f8730f80530a093495ad8ae30b8c6a97e81eea91))
- *(format)* Add missing comma to avoid warning - ([e350aa5](https://github.com/tsutsu3/pi-hole-client/commit/e350aa5785aadcb88d652d6f7f78f6104aee0726))
- *(mock_api_server)* Add mock api server ([#234](https://github.com/tsutsu3/pi-hole-client/issues/234)) - ([edb5abd](https://github.com/tsutsu3/pi-hole-client/commit/edb5abd5f8034a45a7f77c200bd923f48df5eb1a))
- *(pubspec)* Remove analyzer override ([#243](https://github.com/tsutsu3/pi-hole-client/issues/243)) - ([00847a1](https://github.com/tsutsu3/pi-hole-client/commit/00847a159730c49e049c2014a849c3f86a67f7dc))
- *(window)* Increase desktop minimum window size to 400x400 - ([83da92e](https://github.com/tsutsu3/pi-hole-client/commit/83da92e3acab49711ba8389cd215091df1fb9949))
- *(winget)* Add automation for winget package submission ([#214](https://github.com/tsutsu3/pi-hole-client/issues/214)) - ([92c541a](https://github.com/tsutsu3/pi-hole-client/commit/92c541a5ef172fb71c6d96eb70e186507805dfe0))
- *(workflows)* Update Flutter version to 3.29.3 in all workflow files ([#240](https://github.com/tsutsu3/pi-hole-client/issues/240)) - ([8e5ee8f](https://github.com/tsutsu3/pi-hole-client/commit/8e5ee8fee76540956f56ac43bc2c4d62aa1a6504))


## [1.2.0_(31)](https://github.com/tsutsu3/pi-hole-client/compare/1.1.0_(27)..1.2.0_(31)) - 2025-04-11

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
