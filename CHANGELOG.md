# Changelog

## [1.9.0](https://github.com/tsutsu3/pi-hole-client/compare/1.8.0_(75)..1.9.0) - 2026-04-30

### 🚀 Features

- *(ui)* Restore fade-through animation on bottom nav tab switching ([#583](https://github.com/tsutsu3/pi-hole-client/issues/583)) - ([42c37a9](https://github.com/tsutsu3/pi-hole-client/commit/42c37a95490d54f21479281adb3af4cc02912250))

### 🐛 Bug Fixes

- *(db)* Make v10 migration compatible with SQLite < 3.25 ([#575](https://github.com/tsutsu3/pi-hole-client/issues/575)) - ([4efdf36](https://github.com/tsutsu3/pi-hole-client/commit/4efdf36bc46f79b38e440bf13c8e0d80d9458139))
- *(gravity)* Resolve Dismissible crash on message card deletion ([#532](https://github.com/tsutsu3/pi-hole-client/issues/532)) - ([b0a41f8](https://github.com/tsutsu3/pi-hole-client/commit/b0a41f843dd11fb1f1e7fcfb5d6592e579624cba))
- *(routing)* Show empty screen on server-scoped settings when no server is selected ([#576](https://github.com/tsutsu3/pi-hole-client/issues/576)) - ([278e07c](https://github.com/tsutsu3/pi-hole-client/commit/278e07c4a05476cb0baf37b4ac29de537f7dafe4))
- *(sessions)* Prevent duplicate Pi-hole sessions on server switch ([#587](https://github.com/tsutsu3/pi-hole-client/issues/587)) - ([769aa87](https://github.com/tsutsu3/pi-hole-client/commit/769aa877539e1da6e0b3c9e00bb069a774cb9651))
- *(sessions)* Centralize v6 session management and prevent duplicate sessions ([#586](https://github.com/tsutsu3/pi-hole-client/issues/586)) - ([9c9382d](https://github.com/tsutsu3/pi-hole-client/commit/9c9382da193cdd656eda93c10369e14f387998d6))
- *(statistics)* Fix swipe-to-switch tabs causing ~1s white flash ([#567](https://github.com/tsutsu3/pi-hole-client/issues/567)) - ([bc6c66d](https://github.com/tsutsu3/pi-hole-client/commit/bc6c66d4d47f5dae0c23c65db95847ea63266207))
- *(ui, api)* Address deprecation warnings from Flutter version upgrade ([#566](https://github.com/tsutsu3/pi-hole-client/issues/566)) - ([21f03d5](https://github.com/tsutsu3/pi-hole-client/commit/21f03d530bd863a1ec25850a4ddce129b23a3716))
- *(widget)* Reset status to loading before navigating from home widget tap ([#557](https://github.com/tsutsu3/pi-hole-client/issues/557)) - ([9da0746](https://github.com/tsutsu3/pi-hole-client/commit/9da074644857ac1c2d9547ab9dfadfa43694474b))
- *(widget)* Sync blocking status to home widget after timed disable expires ([#540](https://github.com/tsutsu3/pi-hole-client/issues/540)) - ([404bfa7](https://github.com/tsutsu3/pi-hole-client/commit/404bfa7fd0b799fcae1acf3e3e3d3cd034470f66))

### 🚜 Refactor

- *(adlists)* Extract shared scaffold, actions, and icon tab components ([#543](https://github.com/tsutsu3/pi-hole-client/issues/543)) - ([6e8df5c](https://github.com/tsutsu3/pi-hole-client/commit/6e8df5c2abddcfede01923a4c6731caa4f1406b3))
- *(adlists)* Migrate AdLists, Find Domains, and Gravity screens ([#524](https://github.com/tsutsu3/pi-hole-client/issues/524)) - ([cf25101](https://github.com/tsutsu3/pi-hole-client/commit/cf251013430853514d7e2d5a53a664eb327b603d))
- *(api-version)* Unify 'v5'/'v6' literals into SupportedApiVersions ([#578](https://github.com/tsutsu3/pi-hole-client/issues/578)) - ([3fb9a4b](https://github.com/tsutsu3/pi-hole-client/commit/3fb9a4b53264ee29fe88e1d92f77e4ab6baf45a9))
- *(arch)* Align with Flutter official architecture guidelines ([#556](https://github.com/tsutsu3/pi-hole-client/issues/556)) - ([34e96d4](https://github.com/tsutsu3/pi-hole-client/commit/34e96d4206c8708f5cfd6240d1d110198e4d9ab1))
- *(arch)* Replace API Gateway layer with Repository/ViewModel pattern ([#534](https://github.com/tsutsu3/pi-hole-client/issues/534)) - ([14fa25b](https://github.com/tsutsu3/pi-hole-client/commit/14fa25b72c83fd7f149dd8f8c795ba53a0e2ff32))
- *(core)* GoRouter migration, ViewModel renaming, and codebase cleanup ([#526](https://github.com/tsutsu3/pi-hole-client/issues/526)) - ([f7e48b1](https://github.com/tsutsu3/pi-hole-client/commit/f7e48b1ddd335f14160055325f891243179a634c))
- *(dhcp)* Migrate DHCP screen ([#515](https://github.com/tsutsu3/pi-hole-client/issues/515)) - ([5264a89](https://github.com/tsutsu3/pi-hole-client/commit/5264a89f31a087a810516d21f8bf25754f4cf3f0))
- *(di)* Restructure provider base DI ([#506](https://github.com/tsutsu3/pi-hole-client/issues/506)) - ([6e4ed94](https://github.com/tsutsu3/pi-hole-client/commit/6e4ed943971ea7fa11500daf8a1cda68d34ff457))
- *(dns-blocking)* Migrate server enable/disable from Gateway to DnsRepository ([#519](https://github.com/tsutsu3/pi-hole-client/issues/519)) - ([bbe9a8e](https://github.com/tsutsu3/pi-hole-client/commit/bbe9a8ec2b1ed6e5f16d8069a195333fa73d7c5b))
- *(domains)* Add bottom space height to domains list widget ([#545](https://github.com/tsutsu3/pi-hole-client/issues/545)) - ([376f0c2](https://github.com/tsutsu3/pi-hole-client/commit/376f0c2538544d14d84a8dc6a6400f17279cba03))
- *(domains)* Extract shared scaffold, actions components ([#544](https://github.com/tsutsu3/pi-hole-client/issues/544)) - ([bc18df1](https://github.com/tsutsu3/pi-hole-client/commit/bc18df18b3d96b6c505e9f6203463f69c0fdf18f))
- *(domains)* Migrate Domains screen ([#521](https://github.com/tsutsu3/pi-hole-client/issues/521)) - ([bc8f1cb](https://github.com/tsutsu3/pi-hole-client/commit/bc8f1cb00f2cd11f20e2d015f9c06dba8475ed3c))
- *(groups-clients)* Migrate Groups and Clients screens ([#525](https://github.com/tsutsu3/pi-hole-client/issues/525)) - ([d173598](https://github.com/tsutsu3/pi-hole-client/commit/d1735988bf0a7b3c478d1453083afb6c3e9d99ab))
- *(home)* Migrate Home and Statistics screens ([#531](https://github.com/tsutsu3/pi-hole-client/issues/531)) - ([cdf273a](https://github.com/tsutsu3/pi-hole-client/commit/cdf273a9f0f5e35767a748f35d183051feb6036f))
- *(interface)* Migrate Interface screen ([#517](https://github.com/tsutsu3/pi-hole-client/issues/517)) - ([0b4edef](https://github.com/tsutsu3/pi-hole-client/commit/0b4edefd1926e31153993bb77525b20ccbe23f0e))
- *(local-dns)* Migrate LocalDnsScreen ([#518](https://github.com/tsutsu3/pi-hole-client/issues/518)) - ([3c48d51](https://github.com/tsutsu3/pi-hole-client/commit/3c48d519ec94c723258de89fab1a55409ea652aa))
- *(logs)* Migrate Logs screen to ViewModel pattern ([#530](https://github.com/tsutsu3/pi-hole-client/issues/530)) - ([70ebf1c](https://github.com/tsutsu3/pi-hole-client/commit/70ebf1cc3e39710e0e61d95681a734705c40d6b0))
- *(model)* Redesign domain models ([#508](https://github.com/tsutsu3/pi-hole-client/issues/508)) - ([90f97cb](https://github.com/tsutsu3/pi-hole-client/commit/90f97cb497b048d477a136e1970c1c0195e4140f))
- *(network)* Optimize device loading ([#516](https://github.com/tsutsu3/pi-hole-client/issues/516)) - ([c324cee](https://github.com/tsutsu3/pi-hole-client/commit/c324cee2ad61dee73236edba690899bcfae04387))
- *(network)* Migrate Network screen ([#514](https://github.com/tsutsu3/pi-hole-client/issues/514)) - ([bf29cce](https://github.com/tsutsu3/pi-hole-client/commit/bf29ccef8d6af74e3462d2305a1baf3a5478700c))
- *(routing)* Unify server-scoped route guards into ServerScopedRoute ([#577](https://github.com/tsutsu3/pi-hole-client/issues/577)) - ([b150044](https://github.com/tsutsu3/pi-hole-client/commit/b150044d0b3defa04332f1aee2063f948513d216))
- *(routing)* Go_router migration across all screens ([#548](https://github.com/tsutsu3/pi-hole-client/issues/548)) - ([35dfe09](https://github.com/tsutsu3/pi-hole-client/commit/35dfe095fe359d2e46995eeb365ce42af0a52db8))
- *(routing)* Add go_router foundation for future navigation migration ([#503](https://github.com/tsutsu3/pi-hole-client/issues/503)) - ([2a02fe4](https://github.com/tsutsu3/pi-hole-client/commit/2a02fe48a76582ed24640a681d806efb0239ff00))
- *(server)* Remove TODO for deleting basic auth keys ([#549](https://github.com/tsutsu3/pi-hole-client/issues/549)) - ([75592c1](https://github.com/tsutsu3/pi-hole-client/commit/75592c1c39cdf41d0a65bb498d31479d04b21399))
- *(server-info)* Migrate ServerInfo screen to ViewModel + go_router pattern ([#513](https://github.com/tsutsu3/pi-hole-client/issues/513)) - ([30e5f6f](https://github.com/tsutsu3/pi-hole-client/commit/30e5f6f86100043dd39a81f90074f1cdb932bdd8))
- *(server-settings)* Migrate advanced server options ([#520](https://github.com/tsutsu3/pi-hole-client/issues/520)) - ([c00d1d0](https://github.com/tsutsu3/pi-hole-client/commit/c00d1d0092ebcf4532a43a3bcd8e56cbea7fe88b))
- *(sessions)* Migrate Sessions screen to ViewModel + go_router pattern ([#511](https://github.com/tsutsu3/pi-hole-client/issues/511)) - ([309f97a](https://github.com/tsutsu3/pi-hole-client/commit/309f97a93d3efa624423f545e284e40c0e7d560f))
- *(ui)* Replace CustomRadio and CustomRadioListTile with Flutter built-ins ([#538](https://github.com/tsutsu3/pi-hole-client/issues/538)) - ([141e10d](https://github.com/tsutsu3/pi-hole-client/commit/141e10d3971637ed943f58ba28ed486bb6b5644a))
- *(ui)* Replace CustomListTile with Flutter's built-in ListTile ([#537](https://github.com/tsutsu3/pi-hole-client/issues/537)) - ([041420d](https://github.com/tsutsu3/pi-hole-client/commit/041420da1d11c840a29fa5e8893875ecda132eef))
- *(ui)* Extract color helpers from utils to UI layer ([#509](https://github.com/tsutsu3/pi-hole-client/issues/509)) - ([5830df2](https://github.com/tsutsu3/pi-hole-client/commit/5830df247e8d1a44556981b471235f1e57301f94))
- *(viewmodel)* Apply command pattern ([#553](https://github.com/tsutsu3/pi-hole-client/issues/553)) - ([0814dd9](https://github.com/tsutsu3/pi-hole-client/commit/0814dd9e759ea889d2d3c50ee03a7249e78acca7))
- *(viewmodel)* Connect Command listeners to ViewModel notifyListeners ([#551](https://github.com/tsutsu3/pi-hole-client/issues/551)) - ([6c60312](https://github.com/tsutsu3/pi-hole-client/commit/6c60312fd7a3b0bf78b6d51b04c30e4dd04c2ee7))
- Rename allowSelfSignedCert to allowUntrustedCert and improve certificate UX ([#568](https://github.com/tsutsu3/pi-hole-client/issues/568)) - ([4ca8672](https://github.com/tsutsu3/pi-hole-client/commit/4ca8672014fbc81b149fc6de2456e05eea49cdea))

### ⚡ Performance

- *(ui)* Reduce unnecessary widget rebuilds across multiple screens ([#563](https://github.com/tsutsu3/pi-hole-client/issues/563)) - ([ae0633f](https://github.com/tsutsu3/pi-hole-client/commit/ae0633fddfc37c24797e806e106b1a33c92bb829))
- Reduce unnecessary widget rebuilds across Home, Statistics, and Logs screens ([#560](https://github.com/tsutsu3/pi-hole-client/issues/560)) - ([6e10fa6](https://github.com/tsutsu3/pi-hole-client/commit/6e10fa6e6b5691907a738b3ec916a39b49f158d6))

### 🎨 Styling

- *(ui)* Remove unnecessary SafeArea and improve LicensePage layout ([#547](https://github.com/tsutsu3/pi-hole-client/issues/547)) - ([86e04af](https://github.com/tsutsu3/pi-hole-client/commit/86e04af897788cff2376e20f96b7c6b7dcebca73))
- Format dart source files ([#542](https://github.com/tsutsu3/pi-hole-client/issues/542)) - ([cd3ffb4](https://github.com/tsutsu3/pi-hole-client/commit/cd3ffb4f6f8b3060776edd5551c5aec9590cae98))

### 🧪 Testing

- Add comprehensive unit and widget tests for mappers, repositories, and detail screens ([#555](https://github.com/tsutsu3/pi-hole-client/issues/555)) - ([0da256f](https://github.com/tsutsu3/pi-hole-client/commit/0da256fd8d095539ddba6b3abce1c46424c11a78))
- Add comprehensive unit tests for logs, status, and utility components ([#550](https://github.com/tsutsu3/pi-hole-client/issues/550)) - ([066e7d2](https://github.com/tsutsu3/pi-hole-client/commit/066e7d27e34d6489021bd94ba344693a097d659b))

### ⚙️ Miscellaneous Tasks

- *(api)* Add PiholeV6Service wrapper for OpenAPI-generated v6 client ([#507](https://github.com/tsutsu3/pi-hole-client/issues/507)) - ([e12e52f](https://github.com/tsutsu3/pi-hole-client/commit/e12e52fecf318de08e13abc7a862bc7b486fcaa0))
- *(coverage)* Update coverage exclusions for generated files ([#510](https://github.com/tsutsu3/pi-hole-client/issues/510)) - ([3900935](https://github.com/tsutsu3/pi-hole-client/commit/39009354fce06e040ae69abf66d477ca9c1f3b63))
- *(openapi)* Add OpenAPI generator setup and bundled spec ([#502](https://github.com/tsutsu3/pi-hole-client/issues/502)) - ([575a941](https://github.com/tsutsu3/pi-hole-client/commit/575a9410283b92cc7705feb295b35348d474b9c8))
- *(website)* Fix warnings and bump dependencies ([#565](https://github.com/tsutsu3/pi-hole-client/issues/565)) - ([95b7b32](https://github.com/tsutsu3/pi-hole-client/commit/95b7b320ea0d7a34ba4d9d63c8b59946f7dfae85))
- *(winget)* Update documentation URL in winget manifest ([#505](https://github.com/tsutsu3/pi-hole-client/issues/505)) - ([9b447f6](https://github.com/tsutsu3/pi-hole-client/commit/9b447f6edfe6d3ba3cb1ff2add17e27c23d53442))
- *(winget)* Winget manifest for v1.8.0 ([#504](https://github.com/tsutsu3/pi-hole-client/issues/504)) - ([14afaa1](https://github.com/tsutsu3/pi-hole-client/commit/14afaa1730161bbc5c6083fbfeef0ad30b9aab63))
- Bump version to 1.9.0+84 - ([bd8d0c5](https://github.com/tsutsu3/pi-hole-client/commit/bd8d0c523a8b78af8538dff92d330e4dfc830602))
- Bump version to 1.9.0+82 - ([209a8e9](https://github.com/tsutsu3/pi-hole-client/commit/209a8e9dae732e3f2d3cdee3508478402116a622))
- Bump version to 1.9.0+80 - ([ccf5c8b](https://github.com/tsutsu3/pi-hole-client/commit/ccf5c8b735e9df92820f4d7d4cd788d45a0ce1a5))
- Bump version to 1.9.0+78 - ([10cd155](https://github.com/tsutsu3/pi-hole-client/commit/10cd155d7ebda17f193391f46021b73b4fcb8576))
- Remove unused UseCaseFactory and GraphSection enum ([#573](https://github.com/tsutsu3/pi-hole-client/issues/573)) - ([83e7645](https://github.com/tsutsu3/pi-hole-client/commit/83e76453780398df95daa465dd079f789fec1aec))

## [1.8.0_(75)](https://github.com/tsutsu3/pi-hole-client/compare/1.7.1_(65)..1.8.0_(75)) - 2026-02-07

### 🚀 Features

- *(groups)* Enhance group screen with domain and adlist management features ([#495](https://github.com/tsutsu3/pi-hole-client/issues/495)) - ([62dd6d7](https://github.com/tsutsu3/pi-hole-client/commit/62dd6d70f60b89bae0990a4434556da59d014bcf))
- *(security)* Replace self-signed certificate trust-all with proper certificate verification and pinning ([#473](https://github.com/tsutsu3/pi-hole-client/issues/473)) - ([bd8a5f8](https://github.com/tsutsu3/pi-hole-client/commit/bd8a5f8d03456e3a858d4d84337cde7415a06cb6))
- *(settings)* Add domain/adlists search screen ([#465](https://github.com/tsutsu3/pi-hole-client/issues/465)) - ([15ad03e](https://github.com/tsutsu3/pi-hole-client/commit/15ad03ecc0da08602a2d7f64b9811ced4390e0eb))
- *(ui)* Change domains screen header to not collapse on scroll ([#497](https://github.com/tsutsu3/pi-hole-client/issues/497)) - ([3613a60](https://github.com/tsutsu3/pi-hole-client/commit/3613a60c1a3481878bf11978d5c9c231becc30e6))
- *(ui)* Add group filter to domains and adlists screens ([#492](https://github.com/tsutsu3/pi-hole-client/issues/492)) - ([40caff2](https://github.com/tsutsu3/pi-hole-client/commit/40caff247dd5b2ca23ba08f7e9bfd13670022d98))
- *(widget)* Implement bootstrap-style breakpoint system for widget sizing and layout ([#499](https://github.com/tsutsu3/pi-hole-client/issues/499)) - ([7a53667](https://github.com/tsutsu3/pi-hole-client/commit/7a5366728042642286597fd437c9cc25f7045436))
- *(widget)* Improve widget preview and resize flexibility ([#491](https://github.com/tsutsu3/pi-hole-client/issues/491)) - ([46c7366](https://github.com/tsutsu3/pi-hole-client/commit/46c736646938e394c39584d8841ba02db4c871f3))
- *(widget)* Add Android home widge ([#470](https://github.com/tsutsu3/pi-hole-client/issues/470)) - ([6da347f](https://github.com/tsutsu3/pi-hole-client/commit/6da347f17b30780006b2ff8a62d121fddfa59f8a))
- Add PADD API and widget channel for Android home widget ([#472](https://github.com/tsutsu3/pi-hole-client/issues/472)) - ([76d820f](https://github.com/tsutsu3/pi-hole-client/commit/76d820ff58cb08788811184f7612beb5cfd651a9))
- Add groups&clients screen ([#460](https://github.com/tsutsu3/pi-hole-client/issues/460)) ([#460](https://github.com/tsutsu3/pi-hole-client/issues/460)) - ([d86a384](https://github.com/tsutsu3/pi-hole-client/commit/d86a3840d752ff7932a5f480bd957aa11e49f5ae))

### 🐛 Bug Fixes

- *(api)* Handle invalid UTF-8 in network devices response ([#489](https://github.com/tsutsu3/pi-hole-client/issues/489)) - ([6777b1a](https://github.com/tsutsu3/pi-hole-client/commit/6777b1a979bdefb848b144fcfaa32b23a24e71be))
- *(l10n)* Add regenerated app_localizations.dart ([#467](https://github.com/tsutsu3/pi-hole-client/issues/467)) - ([d7a2933](https://github.com/tsutsu3/pi-hole-client/commit/d7a293325736f68a99d87860cab660343c311e19))
- *(localization)* Update 'Denylist' to 'Blocklist' for consistency ([#466](https://github.com/tsutsu3/pi-hole-client/issues/466)) - ([fabe5b5](https://github.com/tsutsu3/pi-hole-client/commit/fabe5b519b35f6a544254d8eac845b47e068f7e1))
- *(ui)* Refactor provider usage in filtered domains and subscriptios screens ([#496](https://github.com/tsutsu3/pi-hole-client/issues/496)) - ([c82eca8](https://github.com/tsutsu3/pi-hole-client/commit/c82eca8b30da1dace2d10ab78a115e52bf047f49))
- *(website)* Add padding - ([c227b6b](https://github.com/tsutsu3/pi-hole-client/commit/c227b6bd0139c39f7c029d840c18aa67acfb197d))

### 🚜 Refactor

- *(settings)* Change SliverAppBar from large to medium to reduce top spacing - ([6d992d4](https://github.com/tsutsu3/pi-hole-client/commit/6d992d45e04697758d4f326ad5f8eee5091ed74d))

### 📚 Documentation

- *(website)* Update user manual ([#462](https://github.com/tsutsu3/pi-hole-client/issues/462)) - ([c596518](https://github.com/tsutsu3/pi-hole-client/commit/c596518ab551b5aa4367401747534bf1a1f73320))

### 🎨 Styling

- Normalize formatting and line endings ([#490](https://github.com/tsutsu3/pi-hole-client/issues/490)) - ([80a5c40](https://github.com/tsutsu3/pi-hole-client/commit/80a5c407955c1377a26d3a886a2d8ecc6fff06ab))

### ⚙️ Miscellaneous Tasks

- *(flutter)* Update Flutter version to 3.38.6 in workflow files ([#478](https://github.com/tsutsu3/pi-hole-client/issues/478)) - ([28fa4e8](https://github.com/tsutsu3/pi-hole-client/commit/28fa4e8317caf5c96ce8ca54006621ab4956a2e1))
- *(git)* Update .gitignore to include  AI agents directories ([#481](https://github.com/tsutsu3/pi-hole-client/issues/481)) - ([b53f415](https://github.com/tsutsu3/pi-hole-client/commit/b53f4157ec07f3a711d9eb16c187e483163674b5))
- *(mock)* Add DHCP handler with leases management ([#461](https://github.com/tsutsu3/pi-hole-client/issues/461)) - ([5e6af15](https://github.com/tsutsu3/pi-hole-client/commit/5e6af15133b38c5532d194d603b1af4300f6ffff))
- *(settings)* Remove deprecated security option from advanced settings ([#476](https://github.com/tsutsu3/pi-hole-client/issues/476)) - ([2a66dc3](https://github.com/tsutsu3/pi-hole-client/commit/2a66dc3fb412874730011e76f8b8c2aafbda9741))
- *(urls)* Update URLs for connection guide and privacy policy ([#464](https://github.com/tsutsu3/pi-hole-client/issues/464)) - ([d3e6185](https://github.com/tsutsu3/pi-hole-client/commit/d3e6185344897fabdc5a3c62bee83d76d664c7ac))
- *(website)* Add widget offline state documentation to FAQ and widget guide ([#500](https://github.com/tsutsu3/pi-hole-client/issues/500)) - ([1cc811d](https://github.com/tsutsu3/pi-hole-client/commit/1cc811d0fc17509a5ba35c0d9e60bdc217f3704d))
- *(website)* Refine certificate checking solution section for clarity ([#485](https://github.com/tsutsu3/pi-hole-client/issues/485)) - ([eab2fe1](https://github.com/tsutsu3/pi-hole-client/commit/eab2fe19bc98709e3544052884094c8dc86086a1))
- *(website)* Add Android Home Widget docs ([#474](https://github.com/tsutsu3/pi-hole-client/issues/474)) - ([2cc8e43](https://github.com/tsutsu3/pi-hole-client/commit/2cc8e4330ad1e26afef14d2600a1fbdb502adcc8))
- *(website)* Add Certificate Configuration Guide ([#482](https://github.com/tsutsu3/pi-hole-client/issues/482)) - ([ac0fdd1](https://github.com/tsutsu3/pi-hole-client/commit/ac0fdd1cb582a9be3344382b35ee5a47528dc324))
- *(website)* Add sitemap configuration to ignore search patterns ([#477](https://github.com/tsutsu3/pi-hole-client/issues/477)) - ([90f99da](https://github.com/tsutsu3/pi-hole-client/commit/90f99dad21e8b51384c244c1b3f0ead2a3ac603a))
- *(website)* Update headings for clarity in server settings manual ([#469](https://github.com/tsutsu3/pi-hole-client/issues/469)) - ([63fbe90](https://github.com/tsutsu3/pi-hole-client/commit/63fbe9061c25c5b107230426aedc229eb6850925))
- *(website)* Add find domains pages ([#468](https://github.com/tsutsu3/pi-hole-client/issues/468)) - ([40a5ce2](https://github.com/tsutsu3/pi-hole-client/commit/40a5ce2f9880b1707eb90c6d580e8d94eeb66f4a))
- *(website)* Enhance feature details section ([#463](https://github.com/tsutsu3/pi-hole-client/issues/463)) - ([c141b55](https://github.com/tsutsu3/pi-hole-client/commit/c141b550ede4c891c58730191422702bda517218))
- *(widget)* Update font sizes for card label and value ([#483](https://github.com/tsutsu3/pi-hole-client/issues/483)) - ([a389752](https://github.com/tsutsu3/pi-hole-client/commit/a3897521e617894c0554ad3e3f9eeeb9869db867))
- *(winget)* Winget manifest for v1.7.1 ([#454](https://github.com/tsutsu3/pi-hole-client/issues/454)) - ([c99f27c](https://github.com/tsutsu3/pi-hole-client/commit/c99f27c9c2b3f8b6681fd175bc540850eb77e5eb))

## [1.7.1_(65)](https://github.com/tsutsu3/pi-hole-client/compare/1.7.0_(63)..1.7.1_(65)) - 2025-12-10

### 🐛 Bug Fixes

- *(domains)* Relax domain validation for TLD and wildcard domains ([#441](https://github.com/tsutsu3/pi-hole-client/issues/441)) - ([02c9dfc](https://github.com/tsutsu3/pi-hole-client/commit/02c9dfc5db5e12ecae31bdc0f5ac6ad7523a3b4e))
- *(log)* Support microsecond-level reply times ([#436](https://github.com/tsutsu3/pi-hole-client/issues/436)) - ([7063b60](https://github.com/tsutsu3/pi-hole-client/commit/7063b604e5c56ecdc594f1aa7322037d03468836))
- *(login)* Support Pi-hole server login without password ([#448](https://github.com/tsutsu3/pi-hole-client/issues/448)) - ([0aa2239](https://github.com/tsutsu3/pi-hole-client/commit/0aa223971f6205a7bf5af1e1dc44bf4189469303))

### ⚙️ Miscellaneous Tasks

- *(ci)* Disable winget install action for Windows Server 2025 compatibility ([#427](https://github.com/tsutsu3/pi-hole-client/issues/427)) - ([3b52c80](https://github.com/tsutsu3/pi-hole-client/commit/3b52c80aead8f37cfaf53d5321f542b0d0b0fa21))
- *(winget)* Winget manifest for v1.7.0 ([#428](https://github.com/tsutsu3/pi-hole-client/issues/428)) - ([8877b09](https://github.com/tsutsu3/pi-hole-client/commit/8877b096768fa790087a44da92677099c7e02da3))

## [1.7.0_(63)](https://github.com/tsutsu3/pi-hole-client/compare/1.6.0_(59)..1.7.0_(63)) - 2025-10-25

### 🚀 Features

- *(api)* Support Pi-hole FTL v6.3 API changes ([#414](https://github.com/tsutsu3/pi-hole-client/issues/414)) - ([0ce38e4](https://github.com/tsutsu3/pi-hole-client/commit/0ce38e40770587abf4f02db1da00475a7fb4f2c7))
- *(indicator)* Add pull-to-refresh across settings ([#419](https://github.com/tsutsu3/pi-hole-client/issues/419)) - ([97a19e3](https://github.com/tsutsu3/pi-hole-client/commit/97a19e3a294504176872099491104b3024bb3a23))
- *(logs)* Add live log ([#420](https://github.com/tsutsu3/pi-hole-client/issues/420)) - ([7b562fb](https://github.com/tsutsu3/pi-hole-client/commit/7b562fbc8bc8d6e0ca5bd4065d21c35bcf46c55a))
- *(logs)* Add manual refresh and live log settings screen (auto-refresh not yet implemented) ([#408](https://github.com/tsutsu3/pi-hole-client/issues/408)) - ([df93a39](https://github.com/tsutsu3/pi-hole-client/commit/df93a3961621c4b81a32349c0e116a67773a8e08))
- *(server_settings)* Add local dns screen ([#396](https://github.com/tsutsu3/pi-hole-client/issues/396)) - ([1bb810e](https://github.com/tsutsu3/pi-hole-client/commit/1bb810e2343ef682faf644cbe99b5c73f014b946))
- *(theme)* Disable slow PredictiveBack transitions for faster page animations ([#423](https://github.com/tsutsu3/pi-hole-client/issues/423)) - ([f087c97](https://github.com/tsutsu3/pi-hole-client/commit/f087c97593e48882c337f120a85429e81cc21790))

### 🐛 Bug Fixes

- *(home)* Ensure FAB position resets after snackbar dismissal ([#392](https://github.com/tsutsu3/pi-hole-client/issues/392)) - ([bbc9274](https://github.com/tsutsu3/pi-hole-client/commit/bbc927426c5c7aa5cf1d01ce053c2730b1c39f10))
- *(logs)* Prevent duplicate entries by clearing list before reload ([#415](https://github.com/tsutsu3/pi-hole-client/issues/415)) - ([cd7cc64](https://github.com/tsutsu3/pi-hole-client/commit/cd7cc649d02cdbaa1415c1830ba7506bcaa675a3))
- *(settings)* Hide unfinished livelog settings from release build ([#413](https://github.com/tsutsu3/pi-hole-client/issues/413)) - ([d09380f](https://github.com/tsutsu3/pi-hole-client/commit/d09380fc06a1be7af069bda830bce67889a656ac))

### 🚜 Refactor

- I18n keys ([#410](https://github.com/tsutsu3/pi-hole-client/issues/410)) - ([75ac6a0](https://github.com/tsutsu3/pi-hole-client/commit/75ac6a0a0fa14b37758be04fa95ef8bf715a7887))

### 📚 Documentation

- *(readme)* Add link to Pi-hole client website - ([d3d70c4](https://github.com/tsutsu3/pi-hole-client/commit/d3d70c454375fd93ccd84867ae889babcc41c1b7))

### 🧪 Testing

- Add missing local_dns_provider_test.mocks.dart - ([2b03bee](https://github.com/tsutsu3/pi-hole-client/commit/2b03bee73ae74554b2a8ad00d9fdc310d82b5ac9))

### ⚙️ Miscellaneous Tasks

- *(docker)* Add Pi-hole nightly build to docker-compose for testing - ([27a0e4a](https://github.com/tsutsu3/pi-hole-client/commit/27a0e4a54064bad8d516755976546c64bb7a42c4))
- *(l10n)* Remove synthetic-package entry from l10n.yaml - ([d70cf4c](https://github.com/tsutsu3/pi-hole-client/commit/d70cf4c4c717aa37cbb19b39430ca78b6f1fff18))
- *(website)* Update index name - ([8f07e5a](https://github.com/tsutsu3/pi-hole-client/commit/8f07e5aa03b55ef38e11b92ad58fee16c2980540))
- *(website)* Add wiki page contents ([#417](https://github.com/tsutsu3/pi-hole-client/issues/417)) - ([d87f313](https://github.com/tsutsu3/pi-hole-client/commit/d87f3137b53e300e023068c3f407373d1133a26a))
- *(website)* Add Google Search Console verification meta tag - ([b4227af](https://github.com/tsutsu3/pi-hole-client/commit/b4227af7e78228e37cac3449e49f0fb3cd894134))
- *(winget)* Winget manifest for v1.6.0 ([#390](https://github.com/tsutsu3/pi-hole-client/issues/390)) - ([3c1d82b](https://github.com/tsutsu3/pi-hole-client/commit/3c1d82b9d087bdb9b2f8fa37d1cf971dfa5a2f2b))
- *(workflow)* Ignore paths for website and docs in pull requests - ([6fe472c](https://github.com/tsutsu3/pi-hole-client/commit/6fe472c3535ea60a0c76041caf06d85374caf230))

### 🛡️ Security

- *(deps)* Override webpack-dev-server to version 5.2.1 to fix CVE-2025-30360 ([#395](https://github.com/tsutsu3/pi-hole-client/issues/395)) - ([8bf6b95](https://github.com/tsutsu3/pi-hole-client/commit/8bf6b951d56173073a0d263e36663e2e8f971573))

## [1.6.0_(59)](https://github.com/tsutsu3/pi-hole-client/compare/1.5.1_(57)..1.6.0_(59)) - 2025-08-29

### 🚀 Features

- *(application_detail)* Add build version ([#359](https://github.com/tsutsu3/pi-hole-client/issues/359)) - ([2989f48](https://github.com/tsutsu3/pi-hole-client/commit/2989f48c5e8939e75b3728c619c67c7ff55bed8b))
- *(detail)* Add website links ([#387](https://github.com/tsutsu3/pi-hole-client/issues/387)) - ([70561ca](https://github.com/tsutsu3/pi-hole-client/commit/70561ca287f6d4a98c2bcc98c8bc003634913f6d))
- *(device)* Add localized "hours ago" to lastQuery timestamp display ([#364](https://github.com/tsutsu3/pi-hole-client/issues/364)) - ([0b684c8](https://github.com/tsutsu3/pi-hole-client/commit/0b684c887816a4af23d4b18fd5f532c20d48a94d))
- *(dhcp)* Add DHCP screen ([#365](https://github.com/tsutsu3/pi-hole-client/issues/365)) - ([dc5245d](https://github.com/tsutsu3/pi-hole-client/commit/dc5245de86463fdf368ef476fe9665a77d84b092))

### 🐛 Bug Fixes

- *(i18n)* Update DHCP disabled messages in localization files ([#381](https://github.com/tsutsu3/pi-hole-client/issues/381)) - ([cfc9c10](https://github.com/tsutsu3/pi-hole-client/commit/cfc9c104bf052c226ea08e531a6165242e0a05e0))
- *(site)* Fix base path ([#383](https://github.com/tsutsu3/pi-hole-client/issues/383)) - ([e30114f](https://github.com/tsutsu3/pi-hole-client/commit/e30114f783a58a35de1e79c4caf22ab0c61e6a0c))
- *(website)* Enable navbar to hide on scroll and remove background styles - ([e79049a](https://github.com/tsutsu3/pi-hole-client/commit/e79049ad3ef13709d0f1e55663347312e233dfa3))

### 🚜 Refactor

- Change folder structure and add local repositories ([#373](https://github.com/tsutsu3/pi-hole-client/issues/373)) - ([e58e84d](https://github.com/tsutsu3/pi-hole-client/commit/e58e84de384606b5cb691c0ec24742eb8aff5739))

### 📚 Documentation

- *(readme)* Add releases badge - ([dc40644](https://github.com/tsutsu3/pi-hole-client/commit/dc4064439c8baeb87122b54d320303f3047596df))
- *(website)* Update README to reflect project name and installation instructions - ([b86adad](https://github.com/tsutsu3/pi-hole-client/commit/b86adad45dba5721b8f67bcfd8fba149eeb31fab))

### 🎨 Styling

- *(website)* Improve formatting in README for clarity - ([f60cf60](https://github.com/tsutsu3/pi-hole-client/commit/f60cf60339f359bffb9601b30abc2fc4ef5280ff))
- Format lib, test, tesing, mock_api_server - ([07cc6ef](https://github.com/tsutsu3/pi-hole-client/commit/07cc6ef0b78238fd8d93f98841f51836ce6b659a))

### ⚙️ Miscellaneous Tasks

- *(lib)* Update Flutter version to 3.32.8 - ([91c421a](https://github.com/tsutsu3/pi-hole-client/commit/91c421a0a9037bd1ddee6bc8e66db09e65f36c22))
- *(mock_api_server)* Add Pi-hole v5 mock endpoints and auth middlewares ([#380](https://github.com/tsutsu3/pi-hole-client/issues/380)) - ([042166d](https://github.com/tsutsu3/pi-hole-client/commit/042166d198e10d088f76f5f9f6969cc057630f98))
- *(site)* Add web site ([#382](https://github.com/tsutsu3/pi-hole-client/issues/382)) - ([9637c79](https://github.com/tsutsu3/pi-hole-client/commit/9637c79489a668beef24f4a5ff34e2493edfb92b))
- *(test)* Remove unnecessary debug prints from test cases ([#361](https://github.com/tsutsu3/pi-hole-client/issues/361)) - ([9614620](https://github.com/tsutsu3/pi-hole-client/commit/961462060c3c87943a8fc80a2213370ce88eb7f6))
- *(website)* Fix dosusaurus config - ([e2b4bed](https://github.com/tsutsu3/pi-hole-client/commit/e2b4bed9bfd131bb83d2a2c9cd13be1af61c2aba))
- *(website)* Correct file extension from .yml to .yaml - ([2365032](https://github.com/tsutsu3/pi-hole-client/commit/2365032612128cb92c41b22543c3603dabf47684))
- *(website)* Fix artifact path - ([254f445](https://github.com/tsutsu3/pi-hole-client/commit/254f44592eccf38c65e576da671d9302c5da0a00))
- *(website)* Migrate from Nextra to Docusaurus ([#384](https://github.com/tsutsu3/pi-hole-client/issues/384)) - ([36011a3](https://github.com/tsutsu3/pi-hole-client/commit/36011a39139a5ed3ba895828a4c6e014000a8b88))
- *(winget)* Winget manifest for v1.5.1 ([#357](https://github.com/tsutsu3/pi-hole-client/issues/357)) - ([0acc177](https://github.com/tsutsu3/pi-hole-client/commit/0acc177b1df517277de7a9400ac556fc22dbdccc))
- Add v6 repos without modifying existing code ([#379](https://github.com/tsutsu3/pi-hole-client/issues/379)) - ([1279e85](https://github.com/tsutsu3/pi-hole-client/commit/1279e850ed530febb70f1a388d16ff011e3d9f47))
- Add v5 repos without modifying existing code  ([#377](https://github.com/tsutsu3/pi-hole-client/issues/377)) - ([51366dc](https://github.com/tsutsu3/pi-hole-client/commit/51366dc5986a69a9f44a04098a3ae68ca180d404))
- Add service without modifying existing code ([#376](https://github.com/tsutsu3/pi-hole-client/issues/376)) - ([f083014](https://github.com/tsutsu3/pi-hole-client/commit/f0830149d1f3cf3c7dae52cc73ff365f137de34b))

## [1.5.1_(57)](https://github.com/tsutsu3/pi-hole-client/compare/1.5.0_(55)..1.5.1_(57)) - 2025-07-14

### ⚙️ Miscellaneous Tasks

- *(freezed)* Rebuild generated models ([#355](https://github.com/tsutsu3/pi-hole-client/issues/355)) - ([2cbd4ea](https://github.com/tsutsu3/pi-hole-client/commit/2cbd4ea6bbd7a2f469019532e1b9e8198d304012))
- *(sentry)* Upgrade to v9.4.0 to avoid crash on manual Android init ([#354](https://github.com/tsutsu3/pi-hole-client/issues/354)) - ([322e847](https://github.com/tsutsu3/pi-hole-client/commit/322e84759372e212cd44041941669a1c85ae269c))

## [1.5.0_(55)](https://github.com/tsutsu3/pi-hole-client/compare/1.4.0_(43)..1.5.0_(55)) - 2025-07-14

### 🚀 Features

- *(home)* Tap tile to navigate to corresponding screen ([#331](https://github.com/tsutsu3/pi-hole-client/issues/331)) - ([5b6fb6e](https://github.com/tsutsu3/pi-hole-client/commit/5b6fb6e6afb265857be94f20161327d6cc2efb07))
- *(home)* Use skeleton loader instead of spinner ([#323](https://github.com/tsutsu3/pi-hole-client/issues/323)) - ([08ad7d7](https://github.com/tsutsu3/pi-hole-client/commit/08ad7d7a66037545e7c352902e7543f76c023901))
- *(settings/netowork)* Use skeleton loader instead of spinner ([#321](https://github.com/tsutsu3/pi-hole-client/issues/321)) - ([5f7a132](https://github.com/tsutsu3/pi-hole-client/commit/5f7a1328465cf662e84cb346b3b91e39b4bd17df))
- *(settings/session)* Use skeleton loader instead of spinner ([#320](https://github.com/tsutsu3/pi-hole-client/issues/320)) - ([1517c72](https://github.com/tsutsu3/pi-hole-client/commit/1517c7241365b683e25aaeb26eb404a52e6f6946))

### 🐛 Bug Fixes

- *(adlist)* Show loading indicator on subscription screen to prevent stale data flash ([#303](https://github.com/tsutsu3/pi-hole-client/issues/303)) - ([3db2f7e](https://github.com/tsutsu3/pi-hole-client/commit/3db2f7e3d59d7a4cf05561ed99cbbc0b997ed4f0))
- *(api)* Improve realtimeStatus stability by splitting requests into batches ([#314](https://github.com/tsutsu3/pi-hole-client/issues/314)) - ([0ba5699](https://github.com/tsutsu3/pi-hole-client/commit/0ba56999695c8b98b24b1ecec8bcdb3787d7172e))
- *(auto_refresh)* Avoid 'Connection closed before full header was received' on specific devices ([#343](https://github.com/tsutsu3/pi-hole-client/issues/343)) - ([8954e9d](https://github.com/tsutsu3/pi-hole-client/commit/8954e9ddb1dcf08d84de02475b35b440aa9f448a))
- *(domains)* Show loading state when switching servers to prevent outdated domain data ([#315](https://github.com/tsutsu3/pi-hole-client/issues/315)) - ([66f3380](https://github.com/tsutsu3/pi-hole-client/commit/66f3380025a5382f2437a93267caf592615b87aa))
- *(home)* Ensure HomeTile opens correct layout on tablet devices ([#347](https://github.com/tsutsu3/pi-hole-client/issues/347)) - ([b15d98e](https://github.com/tsutsu3/pi-hole-client/commit/b15d98e387fd65efe477489553cfa0f530e04e97))
- *(home)* Remove redundant near-simultaneous duplicate calls ([#335](https://github.com/tsutsu3/pi-hole-client/issues/335)) - ([448eac6](https://github.com/tsutsu3/pi-hole-client/commit/448eac64fcc5c3b81a49dc96ed33a3f510af4834))
- *(home)* Resolved delayed status feedback on server change in v5 ([#322](https://github.com/tsutsu3/pi-hole-client/issues/322)) - ([03a2fe9](https://github.com/tsutsu3/pi-hole-client/commit/03a2fe9adee980d451dd86f3ce768362dc52da29))
- *(home, servers)* Retain selected server during navigation while connecting  ([#340](https://github.com/tsutsu3/pi-hole-client/issues/340)) - ([2d06351](https://github.com/tsutsu3/pi-hole-client/commit/2d06351e2d44352107e94c850048ebafa15a5e23))
- *(log)* Display all clients ([#316](https://github.com/tsutsu3/pi-hole-client/issues/316)) - ([9bf013d](https://github.com/tsutsu3/pi-hole-client/commit/9bf013daeed97a71692f8a8552d0b8c5b8a98073))
- *(logs)* Prevent setState after dispose in enqueueLoad ([#338](https://github.com/tsutsu3/pi-hole-client/issues/338)) - ([0fd4f06](https://github.com/tsutsu3/pi-hole-client/commit/0fd4f06e7516a58a94d0dd67a57b834408af3578))
- *(logs)* Fully load paginated data within each time window ([#317](https://github.com/tsutsu3/pi-hole-client/issues/317)) - ([a342d9c](https://github.com/tsutsu3/pi-hole-client/commit/a342d9c2d487aca7cdbf7ba99cdbbf8af7d9f444))
- *(refresh)* Suppress loading indicator on resume ([#350](https://github.com/tsutsu3/pi-hole-client/issues/350)) - ([9e21cb6](https://github.com/tsutsu3/pi-hole-client/commit/9e21cb6f46818e9cd2aef41f75ab4f31713d8407))
- *(server)* Show server tile immediately after adding by recreating list for context.select() ([#334](https://github.com/tsutsu3/pi-hole-client/issues/334)) - ([73e11dd](https://github.com/tsutsu3/pi-hole-client/commit/73e11dd8fc1f13d6ab824a14cb9c2cfd3a84b798))
- *(settings)* Reset selected settings screen on navigation ([#348](https://github.com/tsutsu3/pi-hole-client/issues/348)) - ([d865c53](https://github.com/tsutsu3/pi-hole-client/commit/d865c53d42bca1db97edf9d347c9ca9775a15074))

### 🚜 Refactor

- *(api)* Remove Future.wait and handle requests separately ([#349](https://github.com/tsutsu3/pi-hole-client/issues/349)) - ([ffd68c2](https://github.com/tsutsu3/pi-hole-client/commit/ffd68c2e03277f73ed7e735af297557d0a739bea))
- *(constants)* Move RequestStatus enum to constants folder ([#332](https://github.com/tsutsu3/pi-hole-client/issues/332)) - ([f3b30a2](https://github.com/tsutsu3/pi-hole-client/commit/f3b30a2749cfcc037215958ced3c50acf6cbf43e))
- *(skeleton)* Keep icons and labels visible ([#311](https://github.com/tsutsu3/pi-hole-client/issues/311)) - ([8c4ad1b](https://github.com/tsutsu3/pi-hole-client/commit/8c4ad1b62c813d995fa76732c54870583d39b3fa))
- *(statistics)* Restructure provider access to reduce widget rebuilds ([#327](https://github.com/tsutsu3/pi-hole-client/issues/327)) - ([4fb4268](https://github.com/tsutsu3/pi-hole-client/commit/4fb4268caa6adf10f4f303e229e75c32ad29759b))
- *(ui)* Remove system UI overlay - ([ec6af0d](https://github.com/tsutsu3/pi-hole-client/commit/ec6af0dab664c9ec712aef50988ff2dcaa3aed5e))

### ⚡ Performance

- *(home)* Optimize rebuild timing of home graphs ([#326](https://github.com/tsutsu3/pi-hole-client/issues/326)) - ([16539f6](https://github.com/tsutsu3/pi-hole-client/commit/16539f679b8c98fd747efe2117ea365463d6dcbc))
- *(settings)* Reduce unnecessary rebuilds ([#328](https://github.com/tsutsu3/pi-hole-client/issues/328)) - ([5d8d957](https://github.com/tsutsu3/pi-hole-client/commit/5d8d957be8c5b3ac0c97cbcdb7c96b634f6843ea))
- *(settings/servers)* Reduce unnecessary rebuilds ([#329](https://github.com/tsutsu3/pi-hole-client/issues/329)) - ([0342bb4](https://github.com/tsutsu3/pi-hole-client/commit/0342bb46a06c9da65e8a4a5d45a8b4fdc3d26c3f))

### 🎨 Styling

- *(subscription)* Enhance the appearance of the enabled/disabled status label ([#330](https://github.com/tsutsu3/pi-hole-client/issues/330)) - ([f8a687c](https://github.com/tsutsu3/pi-hole-client/commit/f8a687c75c22c0d61ddc964afb6771abcbad3d8c))

### ⚙️ Miscellaneous Tasks

- *(build)* Update Gradle to 8.7 and AGP to 8.6.1 ([#312](https://github.com/tsutsu3/pi-hole-client/issues/312)) - ([4a369bc](https://github.com/tsutsu3/pi-hole-client/commit/4a369bc39d05bbcb1021adfba3393cf62a8c3a08))
- *(flutter)* Upgrade Flutter SDK, CI version, and dependencies ([#319](https://github.com/tsutsu3/pi-hole-client/issues/319)) - ([3592a94](https://github.com/tsutsu3/pi-hole-client/commit/3592a94eb736e2d9a19a638a1f11c0f0524908cc))
- *(logging)* Add additional logs - ([bcb7b9f](https://github.com/tsutsu3/pi-hole-client/commit/bcb7b9f31ef5a02c3b54f05a941b51ecc3963df7))
- *(logs)* Increase fetch size from 100 to 500 - ([f48cd28](https://github.com/tsutsu3/pi-hole-client/commit/f48cd28f24ce4f373f7584f532120d571bf23fbb))
- *(mock_ap_server)* Add host and delay options for server configuration - ([5becad2](https://github.com/tsutsu3/pi-hole-client/commit/5becad2accdebe0c2d9049371a3428faee462f23))
- *(terraform)* Initialize Pi-hole App Service infrastructure ([#341](https://github.com/tsutsu3/pi-hole-client/issues/341)) - ([ac15521](https://github.com/tsutsu3/pi-hole-client/commit/ac15521e42c6dbb09ce8d663de5650efb49e7a3d))
- *(winget)* Winget manifest for v1.4.0 ([#301](https://github.com/tsutsu3/pi-hole-client/issues/301)) - ([03789e4](https://github.com/tsutsu3/pi-hole-client/commit/03789e43e4e632a8997307aa90bc1f2651425812))
- Fix new contributor rendering ([#345](https://github.com/tsutsu3/pi-hole-client/issues/345)) - ([aed3c6d](https://github.com/tsutsu3/pi-hole-client/commit/aed3c6d7290b2aee656facc402f960204ec9e04c))

## [1.4.0_(43)](https://github.com/tsutsu3/pi-hole-client/compare/1.3.0_(41)..1.4.0_(43)) - 2025-06-14

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
