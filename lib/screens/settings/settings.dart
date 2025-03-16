import 'package:flutter/material.dart';
import 'package:flutter_split_view/flutter_split_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pi_hole_client/constants/languages.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/constants/urls.dart';
import 'package:pi_hole_client/functions/open_url.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
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
import 'package:pi_hole_client/screens/settings/server_settings/server_info.dart';
import 'package:pi_hole_client/widgets/custom_list_tile.dart';
import 'package:pi_hole_client/widgets/section_label.dart';
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
  Widget build(BuildContext context) {
    final serversProvider = Provider.of<ServersProvider>(context);
    final statusProvider = Provider.of<StatusProvider>(context);
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
            subtitle: serversProvider.selectedServer != null
                ? statusProvider.isServerConnected == true
                    ? '${AppLocalizations.of(context)!.connectedTo} ${serversProvider.selectedServer!.alias}'
                    : AppLocalizations.of(context)!.notConnectServer
                : AppLocalizations.of(context)!.notSelected,
            screenToNavigate: const ServersPage(),
            thisItem: 2,
          ),
          settingsTile(
            icon: Icons.settings,
            title: AppLocalizations.of(context)!.advancedSetup,
            subtitle: AppLocalizations.of(context)!.advancedSetupDescription,
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
            icon: Icons.computer_rounded,
            title: AppLocalizations.of(context)!.serverInfo,
            subtitle: serversProvider.selectedServer != null
                ? statusProvider.isServerConnected == true
                    ? '${AppLocalizations.of(context)!.serverName}: ${serversProvider.selectedServer!.alias}'
                    : AppLocalizations.of(context)!.notConnectServer
                : AppLocalizations.of(context)!.notSelected,
            screenToNavigate: const ServerInfoScreen(),
            thisItem: 4,
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
            thisItem: 5,
          ),
          settingsTile(
            icon: Icons.privacy_tip_rounded,
            title: AppLocalizations.of(context)!.privacy,
            subtitle: AppLocalizations.of(context)!.privacyInfo,
            screenToNavigate: const PrivacyScreen(),
            thisItem: 6,
          ),
          settingsTile(
            icon: Icons.balance_rounded,
            title: AppLocalizations.of(context)!.legal,
            subtitle: AppLocalizations.of(context)!.legalInfo,
            screenToNavigate: const LegalScreen(),
            thisItem: 7,
          ),
          settingsTile(
            icon: Icons.description_rounded,
            title: AppLocalizations.of(context)!.licenses,
            subtitle: AppLocalizations.of(context)!.licensesInfo,
            screenToNavigate: const LicensesScreen(),
            thisItem: 8,
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
}
