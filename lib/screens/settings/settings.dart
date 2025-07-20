import 'package:flutter/material.dart';
import 'package:flutter_split_view/flutter_split_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pi_hole_client/config2/enums.dart';
import 'package:pi_hole_client/config2/languages.dart';
import 'package:pi_hole_client/config2/responsive.dart';
import 'package:pi_hole_client/config2/urls.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/screens/servers/servers.dart';
import 'package:pi_hole_client/screens/settings/about/app_detail_screen.dart';
import 'package:pi_hole_client/screens/settings/about/legal_screen.dart';
import 'package:pi_hole_client/screens/settings/about/licenses_screen.dart';
import 'package:pi_hole_client/screens/settings/about/privacy_screen.dart';
import 'package:pi_hole_client/screens/settings/app_settings/advanced_settings/advanced_options.dart';
import 'package:pi_hole_client/screens/settings/app_settings/language_screen.dart';
import 'package:pi_hole_client/screens/settings/app_settings/theme_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_server_options.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_settings/network_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/server_info.dart';
import 'package:pi_hole_client/screens/settings/server_settings/subscriptions.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/ui/components/custom_list_tile.dart';
import 'package:pi_hole_client/ui2/core/ui/components/section_label.dart';
import 'package:pi_hole_client/utils2/open_url.dart';
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

    final appConfigProvider = context.read<AppConfigProvider>();
    final width = MediaQuery.of(context).size.width;

    final screenToShow = appConfigProvider.selectedSettingsScreen;
    if (screenToShow != null && width > ResponsiveConstants.large) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final splitView = context.findAncestorStateOfType<SplitViewState>();
        if (splitView != null) {
          switch (screenToShow) {
            case 5:
              splitView.setSecondary(const SubscriptionLists());
            case 6:
              splitView.setSecondary(const AdvancedServerOptions());
              final apiVersion =
                  context.read<ServersProvider>().selectedServer?.apiVersion;
              if (apiVersion == 'v6') {
                splitView.push(const NetworkScreen());
              }
          }
          appConfigProvider.setSelectedSettingsScreen(screen: null);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedServer = context.select<ServersProvider, Server?>(
      (p) => p.selectedServer,
    );
    final serverStatus = context.select<StatusProvider, LoadStatus>(
      (p) => p.getServerStatus,
    );
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    final width = MediaQuery.of(context).size.width;

    if (width <= ResponsiveConstants.large &&
        appConfigProvider.selectedSettingsScreen != null) {
      appConfigProvider.setSelectedSettingsScreen(screen: null);
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
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => screenToNavigate),
            );
          },
        );
      }
    }

    String getThemeString() {
      switch (appConfigProvider.selectedThemeNumber) {
        case 0:
          return AppLocalizations.of(context)!.systemTheme;

        case 1:
          return AppLocalizations.of(context)!.light;

        case 2:
          return AppLocalizations.of(context)!.dark;

        default:
          return '';
      }
    }

    String getLanguageString() {
      final selectedLanguageOption = languageOptions.firstWhere(
        (option) => option.key == appConfigProvider.selectedLanguage,
        orElse: () =>
            languageOptions.firstWhere((option) => option.key == 'en'),
      );
      return selectedLanguageOption.displayName;
    }

    Widget appSettings(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(
            label: AppLocalizations.of(context)!.appSettings,
          ),
          settingsTile(
            icon: Icons.light_mode_rounded,
            title: AppLocalizations.of(context)!.theme,
            subtitle: getThemeString(),
            thisItem: 0,
            screenToNavigate: const ThemeScreen(),
          ),
          settingsTile(
            icon: Icons.language,
            title: AppLocalizations.of(context)!.language,
            subtitle: getLanguageString(),
            thisItem: 1,
            screenToNavigate: const LanguageScreen(),
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
          settingsTile(
            icon: Icons.settings_rounded,
            title: AppLocalizations.of(context)!.advancedSetup,
            subtitle: AppLocalizations.of(context)!.advancedAppSetupDescription,
            screenToNavigate: const AdvancedOptions(),
            thisItem: 3,
          ),
        ],
      );
    }

    Widget serverSettings(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(
            label: AppLocalizations.of(context)!.serverSettings,
          ),
          settingsTile(
            icon: Icons.connected_tv_rounded,
            title: AppLocalizations.of(context)!.serverInfo,
            subtitle: _buildServerSubtitle(
              context: context,
              selectedServer: selectedServer,
              serverStatus: serverStatus,
              isAliasOnly: true,
            ),
            screenToNavigate: const ServerInfoScreen(),
            thisItem: 4,
          ),
          settingsTile(
            icon: Icons.security_rounded,
            title: AppLocalizations.of(context)!.adlistManagementTitle,
            subtitle: AppLocalizations.of(context)!.adlistManagementDescription,
            screenToNavigate: const SubscriptionLists(),
            thisItem: 5,
          ),
          settingsTile(
            icon: Icons.build_rounded,
            title: AppLocalizations.of(context)!.advancedSetup,
            subtitle:
                AppLocalizations.of(context)!.advancedServerSetupDescription,
            screenToNavigate: const AdvancedServerOptions(),
            thisItem: 6,
          ),
        ],
      );
    }

    Widget aboutSettings(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(
            label: AppLocalizations.of(context)!.about,
          ),
          settingsTile(
            icon: Icons.phone_android_rounded,
            title: AppLocalizations.of(context)!.applicationDetail,
            subtitle: AppLocalizations.of(context)!.aboutThisApp,
            screenToNavigate: AppDetailScreen(
              appVersion: appConfigProvider.getAppInfo?.version,
            ),
            thisItem: 7,
          ),
          settingsTile(
            icon: Icons.privacy_tip_rounded,
            title: AppLocalizations.of(context)!.privacy,
            subtitle: AppLocalizations.of(context)!.privacyInfo,
            screenToNavigate: const PrivacyScreen(),
            thisItem: 8,
          ),
          settingsTile(
            icon: Icons.balance_rounded,
            title: AppLocalizations.of(context)!.legal,
            subtitle: AppLocalizations.of(context)!.legalInfo,
            screenToNavigate: const LegalScreen(),
            thisItem: 9,
          ),
          settingsTile(
            icon: Icons.description_rounded,
            title: AppLocalizations.of(context)!.licenses,
            subtitle: AppLocalizations.of(context)!.licensesInfo,
            screenToNavigate: const LicensesScreen(),
            thisItem: 10,
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
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar.large(
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
