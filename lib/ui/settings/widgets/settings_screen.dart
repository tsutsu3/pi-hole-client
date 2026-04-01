import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/l10n/languages.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/responsive.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/urls.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/utils/open_url.dart';
import 'package:provider/provider.dart';

/// The settings list widget.
///
/// On mobile, shown full-screen via the `/settings` route.
/// On desktop, shown as the master pane inside `SettingsShell`.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedServer = context.select<ServersViewModel, Server?>(
      (p) => p.selectedServer,
    );
    final serverStatus = context.select<StatusViewModel, LoadStatus>(
      (p) => p.getServerStatus,
    );
    final appThemeMode = context.select<AppConfigViewModel, AppThemeMode>(
      (vm) => vm.appThemeMode,
    );
    final selectedLanguage = context.select<AppConfigViewModel, String>(
      (vm) => vm.selectedLanguage,
    );
    final width = MediaQuery.of(context).size.width;

    /// Navigate to a settings sub-route.
    ///
    /// On desktop, resets the stack to `/settings` first, then pushes the
    /// target. This clears any intermediate pages (e.g. Advanced -> Sessions)
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
      switch (appThemeMode) {
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
        (option) => option.key == selectedLanguage,
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
          ListTile(
            leading: const Icon(Icons.light_mode_rounded),
            title: Text(AppLocalizations.of(context)!.theme),
            subtitle: Text(getThemeString()),
            onTap: () => navigateToSetting(Routes.settingsAppTheme),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(AppLocalizations.of(context)!.language),
            subtitle: Text(getLanguageString()),
            onTap: () => navigateToSetting(Routes.settingsAppLanguage),
          ),
          ListTile(
            leading: const Icon(Icons.storage_rounded),
            title: Text(AppLocalizations.of(context)!.servers),
            subtitle: Text(
              _buildServerSubtitle(
                context: context,
                selectedServer: selectedServer,
                serverStatus: serverStatus,
                isAliasOnly: false,
              ),
            ),
            onTap: () => navigateToSetting(Routes.settingsAppServers),
          ),
          ListTile(
            leading: const Icon(Icons.settings_rounded),
            title: Text(AppLocalizations.of(context)!.advancedSetup),
            subtitle: Text(
              AppLocalizations.of(context)!.advancedAppSetupDescription,
            ),
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
          ListTile(
            leading: const Icon(Icons.connected_tv_rounded),
            title: Text(AppLocalizations.of(context)!.serverInfo),
            subtitle: Text(
              _buildServerSubtitle(
                context: context,
                selectedServer: selectedServer,
                serverStatus: serverStatus,
                isAliasOnly: true,
              ),
            ),
            onTap: () => navigateToSetting(Routes.settingsServerInfo),
          ),
          ListTile(
            leading: const Icon(Icons.security_rounded),
            title: Text(AppLocalizations.of(context)!.adlists),
            subtitle: Text(AppLocalizations.of(context)!.adlistDescription),
            onTap: () => navigateToSetting(Routes.settingsServerAdlists),
          ),
          ListTile(
            leading: const Icon(Icons.group_rounded),
            title: Text(AppLocalizations.of(context)!.groupsAndClients),
            subtitle: Text(
              AppLocalizations.of(context)!.groupsAndClientsDescription,
            ),
            onTap: () => navigateToSetting(Routes.settingsServerGroupClient),
          ),
          ListTile(
            leading: const Icon(Icons.build_rounded),
            title: Text(AppLocalizations.of(context)!.advancedSetup),
            subtitle: Text(
              AppLocalizations.of(context)!.advancedServerSetupDescription,
            ),
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
          ListTile(
            leading: const Icon(Icons.phone_android_rounded),
            title: Text(AppLocalizations.of(context)!.applicationDetail),
            subtitle: Text(AppLocalizations.of(context)!.aboutThisApp),
            onTap: () => navigateToSetting(Routes.settingsAboutAppDetail),
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_rounded),
            title: Text(AppLocalizations.of(context)!.privacy),
            subtitle: Text(AppLocalizations.of(context)!.privacyInfo),
            onTap: () => navigateToSetting(Routes.settingsAboutPrivacy),
          ),
          ListTile(
            leading: const Icon(Icons.balance_rounded),
            title: Text(AppLocalizations.of(context)!.legal),
            subtitle: Text(AppLocalizations.of(context)!.legalInfo),
            onTap: () => navigateToSetting(Routes.settingsAboutLegal),
          ),
          ListTile(
            leading: const Icon(Icons.description_rounded),
            title: Text(AppLocalizations.of(context)!.licenses),
            subtitle: Text(AppLocalizations.of(context)!.licensesInfo),
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: width > ResponsiveConstants.large
                  ? SliverAppBar(
                      pinned: true,
                      centerTitle: false,
                      forceElevated: innerBoxIsScrolled,
                      title: Text(AppLocalizations.of(context)!.settings),
                    )
                  : SliverAppBar.medium(
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
