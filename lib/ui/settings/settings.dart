import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/urls.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/l10n/languages.dart';
import 'package:pi_hole_client/ui/core/responsive.dart';
import 'package:pi_hole_client/ui/core/ui/components/custom_list_tile.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_viewmodel.dart';
import 'package:pi_hole_client/utils/open_url.dart';
import 'package:provider/provider.dart';

/// The settings list widget.
///
/// On mobile, shown full-screen via the `/settings` route.
/// On desktop, shown as the master pane inside [SettingsShell].
class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedServer = context.select<ServersViewModel, Server?>(
      (p) => p.selectedServer,
    );
    final serverStatus = context.select<StatusViewModel, LoadStatus>(
      (p) => p.getServerStatus,
    );
    final appConfigViewModel = context.watch<AppConfigViewModel>();
    final width = MediaQuery.of(context).size.width;

    /// Navigate to a settings sub-route.
    ///
    /// On desktop, resets the stack to `/settings` first, then pushes the
    /// target. This clears any intermediate pages (e.g. Advanced → Sessions)
    /// so that back always returns to the settings list.
    /// On mobile, simply pushes a full-screen page.
    void navigateToSetting(String routeName) {
      if (width > ResponsiveConstants.large) {
        context.goNamed(Routes.settings);
        context.pushNamed(routeName);
      } else {
        context.pushNamed(routeName);
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
          CustomListTile(
            leadingIcon: Icons.light_mode_rounded,
            label: AppLocalizations.of(context)!.theme,
            description: getThemeString(),
            onTap: () => navigateToSetting(Routes.settingsAppTheme),
          ),
          CustomListTile(
            leadingIcon: Icons.language,
            label: AppLocalizations.of(context)!.language,
            description: getLanguageString(),
            onTap: () => navigateToSetting(Routes.settingsAppLanguage),
          ),
          CustomListTile(
            leadingIcon: Icons.storage_rounded,
            label: AppLocalizations.of(context)!.servers,
            description: _buildServerSubtitle(
              context: context,
              selectedServer: selectedServer,
              serverStatus: serverStatus,
              isAliasOnly: false,
            ),
            onTap: () => navigateToSetting(Routes.settingsAppServers),
          ),
          CustomListTile(
            leadingIcon: Icons.settings_rounded,
            label: AppLocalizations.of(context)!.advancedSetup,
            description:
                AppLocalizations.of(context)!.advancedAppSetupDescription,
            onTap: () => navigateToSetting(Routes.settingsAppAdvanced),
          ),
        ],
      );
    }

    Widget serverSettings(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(label: AppLocalizations.of(context)!.serverSettings),
          CustomListTile(
            leadingIcon: Icons.connected_tv_rounded,
            label: AppLocalizations.of(context)!.serverInfo,
            description: _buildServerSubtitle(
              context: context,
              selectedServer: selectedServer,
              serverStatus: serverStatus,
              isAliasOnly: true,
            ),
            onTap: () => navigateToSetting(Routes.settingsServerInfo),
          ),
          CustomListTile(
            leadingIcon: Icons.security_rounded,
            label: AppLocalizations.of(context)!.adlists,
            description: AppLocalizations.of(context)!.adlistDescription,
            onTap: () => navigateToSetting(Routes.settingsServerAdlists),
          ),
          CustomListTile(
            leadingIcon: Icons.group_rounded,
            label: AppLocalizations.of(context)!.groupsAndClients,
            description:
                AppLocalizations.of(context)!.groupsAndClientsDescription,
            onTap: () => navigateToSetting(Routes.settingsServerGroupClient),
          ),
          CustomListTile(
            leadingIcon: Icons.build_rounded,
            label: AppLocalizations.of(context)!.advancedSetup,
            description:
                AppLocalizations.of(context)!.advancedServerSetupDescription,
            onTap: () => navigateToSetting(Routes.settingsServerAdvanced),
          ),
        ],
      );
    }

    Widget aboutSettings(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(label: AppLocalizations.of(context)!.about),
          CustomListTile(
            leadingIcon: Icons.phone_android_rounded,
            label: AppLocalizations.of(context)!.applicationDetail,
            description: AppLocalizations.of(context)!.aboutThisApp,
            onTap: () => navigateToSetting(Routes.settingsAboutAppDetail),
          ),
          CustomListTile(
            leadingIcon: Icons.privacy_tip_rounded,
            label: AppLocalizations.of(context)!.privacy,
            description: AppLocalizations.of(context)!.privacyInfo,
            onTap: () => navigateToSetting(Routes.settingsAboutPrivacy),
          ),
          CustomListTile(
            leadingIcon: Icons.balance_rounded,
            label: AppLocalizations.of(context)!.legal,
            description: AppLocalizations.of(context)!.legalInfo,
            onTap: () => navigateToSetting(Routes.settingsAboutLegal),
          ),
          CustomListTile(
            leadingIcon: Icons.description_rounded,
            label: AppLocalizations.of(context)!.licenses,
            description: AppLocalizations.of(context)!.licensesInfo,
            onTap: () => navigateToSetting(Routes.settingsAboutLicenses),
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
