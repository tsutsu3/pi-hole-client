import 'package:flutter/material.dart';
import 'package:flutter_split_view/flutter_split_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/urls.dart';
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/l10n/languages.dart';
import 'package:pi_hole_client/ui/core/responsive.dart';
import 'package:pi_hole_client/ui/core/ui/components/custom_list_tile.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/local_dns_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/viewmodel/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/servers/servers.dart';
import 'package:pi_hole_client/ui/settings/about/app_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/about/legal_screen.dart';
import 'package:pi_hole_client/ui/settings/about/licenses_screen.dart';
import 'package:pi_hole_client/ui/settings/about/privacy_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_options.dart';
import 'package:pi_hole_client/ui/settings/app_settings/language_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/theme_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/viewmodel/adlists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_server_options.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/network_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/network_screen/viewmodel/network_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/server_info.dart';
import 'package:pi_hole_client/ui/settings/server_settings/server_info/viewmodel/server_info_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/viewmodel/clients_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/viewmodel/groups_viewmodel.dart';
import 'package:pi_hole_client/utils/open_url.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > ResponsiveConstants.large) {
      return SplitView.material(
        hideDivider: true,
        // flexWidth: const FlexWidth(mainViewFlexWidth: 1, secondaryViewFlexWidth: 2),
        placeholder: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                AppLocalizations.of(context)!.selectOptionLeftColumn,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ),
        child: const SettingsWidget(),
      );
    } else {
      return const SettingsWidget();
    }
  }
}

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  int? selectedScreen;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final appConfigViewModel = context.read<AppConfigViewModel>();
    final width = MediaQuery.of(context).size.width;

    final screenToShow = appConfigViewModel.selectedSettingsScreen;
    if (screenToShow != null && width > ResponsiveConstants.large) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final splitView = context.findAncestorStateOfType<SplitViewState>();
        if (splitView != null) {
          switch (screenToShow) {
            case 5:
              final adlistBundle = context.read<RepositoryBundle?>();
              if (adlistBundle != null) {
                splitView.setSecondary(
                  MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                        create: (_) => AdlistsViewModel(
                          adListRepository: adlistBundle.adlist,
                        )..loadAdlists.run(),
                      ),
                      ChangeNotifierProvider(
                        create: (_) =>
                            GroupsViewModel(groupRepository: adlistBundle.group)
                              ..loadGroups.run(),
                      ),
                    ],
                    child: const AdlistScreen(),
                  ),
                );
              }
            case 11:
              final clientBundle = context.read<RepositoryBundle?>();
              if (clientBundle != null) {
                splitView.setSecondary(
                  MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                        create: (_) => ClientsViewModel(
                          clientRepository: clientBundle.client,
                        )..loadClients.run(),
                      ),
                      ChangeNotifierProvider(
                        create: (_) =>
                            GroupsViewModel(groupRepository: clientBundle.group)
                              ..loadGroups.run(),
                      ),
                      ChangeNotifierProvider(
                        create: (_) => DomainsViewModel(
                          domainRepository: clientBundle.domain,
                        )..loadDomains.run(),
                      ),
                      ChangeNotifierProvider(
                        create: (_) => AdlistsViewModel(
                          adListRepository: clientBundle.adlist,
                        )..loadAdlists.run(),
                      ),
                      ChangeNotifierProvider(
                        create: (_) => LocalDnsViewModel(
                          localDnsRepository: clientBundle.localDns,
                          networkRepository: clientBundle.network,
                        ),
                      ),
                    ],
                    child: const GroupClientScreen(),
                  ),
                );
              }
            case 6:
              splitView.setSecondary(const AdvancedServerOptions());
              final apiVersion = context
                  .read<ServersViewModel>()
                  .selectedServer
                  ?.apiVersion;
              if (apiVersion == 'v6') {
                final bundle = context.read<RepositoryBundle?>();
                if (bundle != null) {
                  splitView.push(
                    NetworkScreen(
                      viewModel: NetworkViewModel(
                        networkRepository: bundle.network,
                        ftlRepository: bundle.ftl,
                      )..loadDevices.run(),
                    ),
                  );
                }
              }
          }
          appConfigViewModel.setSelectedSettingsScreen(screen: null);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedServer = context.select<ServersViewModel, Server?>(
      (p) => p.selectedServer,
    );
    final serverStatus = context.select<StatusViewModel, LoadStatus>(
      (p) => p.getServerStatus,
    );
    final appConfigViewModel = Provider.of<AppConfigViewModel>(context);

    final width = MediaQuery.of(context).size.width;

    if (width <= ResponsiveConstants.large &&
        appConfigViewModel.selectedSettingsScreen != null) {
      appConfigViewModel.setSelectedSettingsScreen(screen: null);
    }

    Widget settingsTile({
      required String title,
      required String subtitle,
      required Widget screenToNavigate,
      required int thisItem,
      IconData? icon,
      Widget? trailing,
    }) {
      if (width > ResponsiveConstants.large) {
        return CustomListTile(
          label: title,
          description: subtitle,
          leadingIcon: icon,
          trailing: trailing,
          onTap: () {
            setState(() => selectedScreen = thisItem);
            SplitView.of(context).setSecondary(screenToNavigate);
          },
        );
      } else {
        return CustomListTile(
          label: title,
          description: subtitle,
          leadingIcon: icon,
          trailing: trailing,
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => screenToNavigate));
          },
        );
      }
    }

    Widget routedSettingsTile({
      required BuildContext context,
      required double width,
      required String title,
      required String subtitle,
      required int thisItem,
      required String routeName,
      required VoidCallback splitViewChild,
      IconData? icon,
    }) {
      if (width > ResponsiveConstants.large) {
        return CustomListTile(
          label: title,
          description: subtitle,
          leadingIcon: icon,
          onTap: () {
            setState(() => selectedScreen = thisItem);
            splitViewChild();
          },
        );
      } else {
        return CustomListTile(
          label: title,
          description: subtitle,
          leadingIcon: icon,
          onTap: () => context.pushNamed(routeName),
        );
      }
    }

    String getThemeString() {
      switch (appConfigViewModel.appThemeMode) {
        case AppThemeMode.system:
          return AppLocalizations.of(context)!.systemTheme;

        case AppThemeMode.light:
          return AppLocalizations.of(context)!.light;

        case AppThemeMode.dark:
          return AppLocalizations.of(context)!.dark;
      }
    }

    String getLanguageString() {
      final selectedLanguageOption = languageOptions.firstWhere(
        (option) => option.key == appConfigViewModel.selectedLanguage,
        orElse: () =>
            languageOptions.firstWhere((option) => option.key == 'en'),
      );
      return selectedLanguageOption.displayName;
    }

    Widget appSettings(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(label: AppLocalizations.of(context)!.appSettings),
          routedSettingsTile(
            context: context,
            width: width,
            icon: Icons.light_mode_rounded,
            title: AppLocalizations.of(context)!.theme,
            subtitle: getThemeString(),
            thisItem: 0,
            routeName: Routes.settingsAppTheme,
            splitViewChild: () {
              SplitView.of(context).setSecondary(const ThemeScreen());
            },
          ),
          routedSettingsTile(
            context: context,
            width: width,
            icon: Icons.language,
            title: AppLocalizations.of(context)!.language,
            subtitle: getLanguageString(),
            thisItem: 1,
            routeName: Routes.settingsAppLanguage,
            splitViewChild: () {
              SplitView.of(context).setSecondary(const LanguageScreen());
            },
          ),
          settingsTile(
            icon: Icons.storage_rounded,
            title: AppLocalizations.of(context)!.servers,
            subtitle: _buildServerSubtitle(
              context: context,
              selectedServer: selectedServer,
              serverStatus: serverStatus,
              isAliasOnly: false,
            ),
            screenToNavigate: const ServersPage(),
            thisItem: 2,
          ),
          routedSettingsTile(
            context: context,
            width: width,
            icon: Icons.settings_rounded,
            title: AppLocalizations.of(context)!.advancedSetup,
            subtitle: AppLocalizations.of(context)!.advancedAppSetupDescription,
            thisItem: 3,
            routeName: Routes.settingsAppAdvanced,
            splitViewChild: () {
              SplitView.of(context).setSecondary(const AdvancedOptions());
            },
          ),
        ],
      );
    }

    Widget serverSettings(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(label: AppLocalizations.of(context)!.serverSettings),
          routedSettingsTile(
            context: context,
            width: width,
            icon: Icons.connected_tv_rounded,
            title: AppLocalizations.of(context)!.serverInfo,
            subtitle: _buildServerSubtitle(
              context: context,
              selectedServer: selectedServer,
              serverStatus: serverStatus,
              isAliasOnly: true,
            ),
            thisItem: 4,
            routeName: Routes.settingsServerInfo,
            splitViewChild: () {
              final bundle = context.read<RepositoryBundle?>();
              if (bundle == null) return;
              final server = context.read<ServersViewModel>().selectedServer;
              if (server == null) return;
              SplitView.of(context).setSecondary(
                ServerInfoScreen(
                  viewModel: ServerInfoViewModel(ftlRepository: bundle.ftl)
                    ..loadServerInfo.run(),
                  serverAlias: server.alias,
                  serverAddress: server.address,
                ),
              );
            },
          ),
          routedSettingsTile(
            context: context,
            width: width,
            icon: Icons.security_rounded,
            title: AppLocalizations.of(context)!.adlists,
            subtitle: AppLocalizations.of(context)!.adlistDescription,
            thisItem: 5,
            routeName: Routes.settingsServerAdlists,
            splitViewChild: () {
              final bundle = context.read<RepositoryBundle?>();
              if (bundle == null) return;
              SplitView.of(context).setSecondary(
                MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (_) =>
                          AdlistsViewModel(adListRepository: bundle.adlist)
                            ..loadAdlists.run(),
                    ),
                    ChangeNotifierProvider(
                      create: (_) =>
                          GroupsViewModel(groupRepository: bundle.group)
                            ..loadGroups.run(),
                    ),
                  ],
                  child: const AdlistScreen(),
                ),
              );
            },
          ),
          routedSettingsTile(
            context: context,
            width: width,
            icon: Icons.group_rounded,
            title: AppLocalizations.of(context)!.groupsAndClients,
            subtitle: AppLocalizations.of(context)!.groupsAndClientsDescription,
            thisItem: 11,
            routeName: Routes.settingsServerGroupClient,
            splitViewChild: () {
              final bundle = context.read<RepositoryBundle?>();
              if (bundle == null) return;
              SplitView.of(context).setSecondary(
                MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (_) =>
                          ClientsViewModel(clientRepository: bundle.client)
                            ..loadClients.run(),
                    ),
                    ChangeNotifierProvider(
                      create: (_) =>
                          GroupsViewModel(groupRepository: bundle.group)
                            ..loadGroups.run(),
                    ),
                    ChangeNotifierProvider(
                      create: (_) => DomainsViewModel(
                        domainRepository: bundle.domain,
                      )..loadDomains.run(),
                    ),
                    ChangeNotifierProvider(
                      create: (_) =>
                          AdlistsViewModel(adListRepository: bundle.adlist)
                            ..loadAdlists.run(),
                    ),
                    ChangeNotifierProvider(
                      create: (_) => LocalDnsViewModel(
                        localDnsRepository: bundle.localDns,
                        networkRepository: bundle.network,
                      ),
                    ),
                  ],
                  child: const GroupClientScreen(),
                ),
              );
            },
          ),
          routedSettingsTile(
            context: context,
            width: width,
            icon: Icons.build_rounded,
            title: AppLocalizations.of(context)!.advancedSetup,
            subtitle: AppLocalizations.of(
              context,
            )!.advancedServerSetupDescription,
            thisItem: 6,
            routeName: Routes.settingsServerAdvanced,
            splitViewChild: () {
              SplitView.of(context).setSecondary(
                const AdvancedServerOptions(),
              );
            },
          ),
        ],
      );
    }

    Widget aboutSettings(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(label: AppLocalizations.of(context)!.about),
          settingsTile(
            icon: Icons.phone_android_rounded,
            title: AppLocalizations.of(context)!.applicationDetail,
            subtitle: AppLocalizations.of(context)!.aboutThisApp,
            screenToNavigate: AppDetailScreen(
              appVersion: appConfigViewModel.getAppInfo?.version,
            ),
            thisItem: 7,
          ),
          routedSettingsTile(
            context: context,
            width: width,
            icon: Icons.privacy_tip_rounded,
            title: AppLocalizations.of(context)!.privacy,
            subtitle: AppLocalizations.of(context)!.privacyInfo,
            thisItem: 8,
            routeName: Routes.settingsAboutPrivacy,
            splitViewChild: () {
              SplitView.of(context).setSecondary(const PrivacyScreen());
            },
          ),
          routedSettingsTile(
            context: context,
            width: width,
            icon: Icons.balance_rounded,
            title: AppLocalizations.of(context)!.legal,
            subtitle: AppLocalizations.of(context)!.legalInfo,
            thisItem: 9,
            routeName: Routes.settingsAboutLegal,
            splitViewChild: () {
              SplitView.of(context).setSecondary(const LegalScreen());
            },
          ),
          routedSettingsTile(
            context: context,
            width: width,
            icon: Icons.description_rounded,
            title: AppLocalizations.of(context)!.licenses,
            subtitle: AppLocalizations.of(context)!.licensesInfo,
            thisItem: 10,
            routeName: Routes.settingsAboutLicenses,
            splitViewChild: () {
              SplitView.of(context).setSecondary(const LicensesScreen());
            },
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => openUrl(Urls.playStore),
                  icon: SvgPicture.asset(
                    'assets/resources/google-play.svg',
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),
                    width: 30,
                    height: 30,
                  ),
                  tooltip: AppLocalizations.of(context)!.visitGooglePlay,
                ),
                IconButton(
                  onPressed: () => openUrl(Urls.gitHub),
                  icon: SvgPicture.asset(
                    'assets/resources/github.svg',
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),
                    width: 30,
                    height: 30,
                  ),
                  tooltip: AppLocalizations.of(context)!.gitHub,
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        // minimum: const EdgeInsets.all(16),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
                sliver: SliverAppBar.medium(
                  floating: true,
                  centerTitle: false,
                  forceElevated: innerBoxIsScrolled,
                  title: Text(AppLocalizations.of(context)!.settings),
                ),
              ),
            ];
          },
          body: SafeArea(
            top: false,
            bottom: false,
            child: Builder(
              builder: (context) => CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                  ),
                  SliverList.list(
                    children: [
                      appSettings(context),
                      serverSettings(context),
                      aboutSettings(context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _buildServerSubtitle({
    required BuildContext context,
    required Server? selectedServer,
    required LoadStatus serverStatus,
    required bool isAliasOnly,
  }) {
    if (selectedServer == null) {
      return AppLocalizations.of(context)!.notSelected;
    }

    switch (serverStatus) {
      case LoadStatus.loaded:
        if (isAliasOnly) {
          return selectedServer.alias;
        }
        return '${AppLocalizations.of(context)!.connectedTo} ${selectedServer.alias}';
      case LoadStatus.loading:
        return AppLocalizations.of(context)!.connectingToServer;
      case LoadStatus.error:
        return AppLocalizations.of(context)!.notConnectServer;
    }
  }
}
