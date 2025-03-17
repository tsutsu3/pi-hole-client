import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pi_hole_client/classes/custom_scroll_behavior.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/functions/misc.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/host.dart';
import 'package:pi_hole_client/models/sensors.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/models/system.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/widgets/empty_data_screen.dart';
import 'package:pi_hole_client/widgets/error_message_screen.dart';
import 'package:pi_hole_client/widgets/list_tile_title.dart';
import 'package:pi_hole_client/widgets/section_label.dart';
import 'package:provider/provider.dart';

class ServerInfoScreen extends StatelessWidget {
  const ServerInfoScreen({super.key});

  Widget piholeIcon(BuildContext context) {
    return SvgPicture.asset(
      'assets/resources/pihole.svg',
      colorFilter: ColorFilter.mode(
        Theme.of(context).colorScheme.onSurfaceVariant,
        BlendMode.srcIn,
      ),
      width: 24,
      height: 24,
    );
  }

  Widget listTailText(BuildContext context, String title, {double? rate}) {
    final wRate = rate ?? 0.5;

    return LayoutBuilder(
      builder: (context, constraints) {
        final textStyle = TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        );

        // Calculate the width of the text
        final textPainter = TextPainter(
          text: TextSpan(text: title, style: textStyle),
          maxLines: 1,
          textDirection: TextDirection.ltr,
        )..layout();

        final textWidth = textPainter.size.width;
        final availableWidth = constraints.maxWidth * wRate;

        if (textWidth <= availableWidth) {
          // Right align if the text is short
          return Container(
            width: availableWidth,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              title,
              maxLines: 1,
              style: textStyle,
              softWrap: false,
            ),
          );
        } else {
          // Scroll horizontally if the text is long
          return SizedBox(
            width: availableWidth,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  title,
                  maxLines: 1,
                  style: textStyle,
                  softWrap: false,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget basicInfoSection(
    BuildContext context,
    Server? server,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(label: AppLocalizations.of(context)!.connectingServer),
        ListTile(
          dense: true,
          leading: const Icon(Icons.storage_outlined),
          title: listTileTitle(
            server?.alias ?? AppLocalizations.of(context)!.unknown,
            colorScheme: colorScheme,
          ),
          subtitle: Text(
            server?.address ?? AppLocalizations.of(context)!.unknown,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Icon(
            Icons.check_circle_rounded,
            color: Theme.of(context).extension<AppColors>()!.commonGreen,
          ),
        ),
      ],
    );
  }

  Widget hostInfoSection(
    BuildContext context,
    HostInfo? host,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(label: AppLocalizations.of(context)!.host),
        ListTile(
          dense: true,
          leading: const Icon(Icons.connected_tv_rounded),
          title: listTileTitle(
            AppLocalizations.of(context)!.host,
            colorScheme: colorScheme,
          ),
          trailing: listTailText(
            context,
            host?.hostName ?? AppLocalizations.of(context)!.unknown,
          ),
        ),
        ListTile(
          dense: true,
          leading: const Icon(Icons.tag_rounded),
          title: listTileTitle(
            AppLocalizations.of(context)!.model,
            colorScheme: colorScheme,
          ),
          trailing: listTailText(
            context,
            host?.model ?? AppLocalizations.of(context)!.unknown,
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: listTileTitle(
              AppLocalizations.of(context)!.moreDetails,
              colorScheme: colorScheme,
            ),
            children: [
              ListTile(
                dense: true,
                leading: const Icon(Icons.settings_rounded),
                title: listTileTitle(
                  AppLocalizations.of(context)!.system,
                  colorScheme: colorScheme,
                ),
                trailing: listTailText(
                  context,
                  host?.sysName ?? AppLocalizations.of(context)!.unknown,
                ),
              ),
              ListTile(
                dense: true,
                leading: const Icon(Icons.architecture_rounded),
                title: listTileTitle(
                  AppLocalizations.of(context)!.arch,
                  colorScheme: colorScheme,
                ),
                trailing: listTailText(
                  context,
                  host?.arch ?? AppLocalizations.of(context)!.unknown,
                ),
              ),
              ListTile(
                dense: true,
                leading: const Icon(Icons.system_update_rounded),
                title: listTileTitle(
                  AppLocalizations.of(context)!.release,
                  colorScheme: colorScheme,
                ),
                trailing: listTailText(
                  context,
                  host?.release ?? AppLocalizations.of(context)!.unknown,
                ),
              ),
              ListTile(
                dense: true,
                leading: const Icon(Icons.verified_rounded),
                title: listTileTitle(
                  AppLocalizations.of(context)!.version,
                  colorScheme: colorScheme,
                ),
                trailing: listTailText(
                  context,
                  host?.version ?? AppLocalizations.of(context)!.unknown,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget usageSection(
    BuildContext context,
    SystemInfo? system,
    SensorsInfo? sensors,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    String formatUptime(int seconds) {
      final days = seconds ~/ (24 * 3600);
      final hours = (seconds % (24 * 3600)) ~/ 3600;
      final minutes = (seconds % 3600) ~/ 60;
      return '$days d $hours h $minutes m';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(label: AppLocalizations.of(context)!.performance),
        ListTile(
          dense: true,
          leading: const Icon(Icons.memory_rounded),
          title: listTileTitle(
            AppLocalizations.of(context)!.cpuUsage,
            colorScheme: colorScheme,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: (system?.cpuUsage ?? 0.0) / 100.0,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primary,
                ),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
              const SizedBox(height: 4),
              Text(
                '${(system?.cpuUsage ?? 0.0).toStringAsFixed(2)}%',
              ),
            ],
          ),
        ),
        ListTile(
          dense: true,
          leading: const Icon(Icons.speed_rounded),
          title: listTileTitle(
            AppLocalizations.of(context)!.memoryUsage,
            colorScheme: colorScheme,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: (system?.ramUsage ?? 0.0) / 100.0,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primary,
                ),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
              const SizedBox(height: 4),
              Text(
                '${(system?.ramUsage ?? 0.0).toStringAsFixed(2)}%',
              ),
            ],
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: listTileTitle(
              AppLocalizations.of(context)!.moreDetails,
              colorScheme: colorScheme,
            ),
            children: [
              ListTile(
                dense: true,
                leading: const Icon(Icons.access_time),
                title: listTileTitle(
                  AppLocalizations.of(context)!.uptime,
                  colorScheme: colorScheme,
                ),
                trailing: listTailText(
                  context,
                  system != null
                      ? formatUptime(system.uptime)
                      : AppLocalizations.of(context)!.unknown,
                ),
              ),
              ListTile(
                dense: true,
                leading: const Icon(Icons.thermostat_rounded),
                title: listTileTitle(
                  AppLocalizations.of(context)!.cpuTemperature,
                  colorScheme: colorScheme,
                ),
                trailing: listTailText(
                  context,
                  sensors?.cpuTemp != null
                      ? '${(sensors?.cpuTemp ?? 0.0).toStringAsFixed(2)} ${convertTemperatureUnit(sensors?.unit)}'
                      : AppLocalizations.of(context)!.unknown,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget piholeVersionSection(
    BuildContext context,
    dynamic version,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(label: AppLocalizations.of(context)!.piholeVersion),
        ListTile(
          dense: true,
          leading: piholeIcon(context),
          title: listTileTitleNoPadding('Core', colorScheme: colorScheme),
          subtitle: Text('${version?.core.local.branch ?? '-'}'),
          trailing: listTailText(context, version?.core.local.version ?? '-'),
        ),
        ListTile(
          dense: true,
          leading: piholeIcon(context),
          title: listTileTitleNoPadding('FTL', colorScheme: colorScheme),
          subtitle: Text('${version?.ftl.local.branch ?? '-'}'),
          trailing: listTailText(context, version?.ftl.local.version ?? '-'),
        ),
        ListTile(
          dense: true,
          leading: piholeIcon(context),
          title: listTileTitleNoPadding('Web', colorScheme: colorScheme),
          subtitle: Text('${version?.web.local.branch ?? '-'}'),
          trailing: listTailText(context, version?.web.local.version ?? '-'),
        ),
        ListTile(
          dense: true,
          leading: piholeIcon(context),
          title: listTileTitleNoPadding('Docker', colorScheme: colorScheme),
          subtitle: const Text('-'),
          trailing: listTailText(
            context,
            (version?.docker.local?.isNotEmpty ?? false)
                ? version!.docker.local!
                : '-',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final apiGateway = context.select<ServersProvider, ApiGateway?>(
      (provider) => provider.selectedApiGateway,
    );
    final server = context.select<ServersProvider, Server?>(
      (provider) => provider.selectedServer,
    );

    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.serverInfo),
        ),
        body: FutureBuilder(
          future: apiGateway?.fetchAllServerInfo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return ErrorMessageScreen(
                message: AppLocalizations.of(context)!.dataFetchFailed,
              );
            } else if (!snapshot.hasData) {
              return const EmptyDataScreen();
            }

            final serverInfo = snapshot.data;
            final version = serverInfo?.version;
            final host = serverInfo?.host;
            final system = serverInfo?.system;
            final sensor = serverInfo?.sensors;

            logger.d('Server Info version: ${version?.toJson()}');
            logger.d('Server Info host: ${host?.toJson()}');
            logger.d('Server Info system: ${system?.toJson()}');
            logger.d('Server Info sensor: ${sensor?.toJson()}');

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  basicInfoSection(context, server),
                  const SizedBox(height: 20),
                  // v5 API not support host info and usage info
                  if (apiGateway?.server.apiVersion != 'v5') ...[
                    hostInfoSection(context, host),
                    const SizedBox(height: 20),
                    usageSection(context, system, sensor),
                    const SizedBox(height: 20),
                  ],
                  piholeVersionSection(context, version),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
