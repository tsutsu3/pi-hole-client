import 'dart:io';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pi_hole_client/config2/responsive.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/servers/add_server_fullscreen.dart';
import 'package:pi_hole_client/screens/servers/servers_list.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:provider/provider.dart';

class ServersPage extends StatefulWidget {
  const ServersPage({
    super.key,
    this.isFromBase,
  });

  final bool? isFromBase;

  @override
  State<ServersPage> createState() => _ServersPageState();
}

class _ServersPageState extends State<ServersPage> {
  late bool isVisible;
  final ScrollController scrollController = ScrollController();

  List<int> expandedCards = [];

  List<int> showButtons = [];

  List<ExpandableController> expandableControllerList = [];

  Future<void> expandOrContract(int index) async {
    expandableControllerList[index].expanded =
        !expandableControllerList[index].expanded;
  }

  @override
  void initState() {
    super.initState();

    isVisible = true;
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (mounted && isVisible == true) {
        setState(() => isVisible = false);
      }
    } else {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (mounted && isVisible == false) {
          setState(() => isVisible = true);
        }
      }
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final serversList = context.select<ServersProvider, List<Server>>(
      (p) => p.getServersList,
    );
    final showingSnackbar = context.select<AppConfigProvider, bool>(
      (p) => p.showingSnackbar,
    );

    final width = MediaQuery.of(context).size.width;

    if (expandableControllerList.length != serversList.length) {
      expandableControllerList = List.generate(
        serversList.length,
        (_) => ExpandableController(),
      );
    }

    Future<void> openAddServer({Server? server}) async {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) return;

        if (width > ResponsiveConstants.medium) {
          showDialog(
            context: context,
            useRootNavigator:
                false, // Prevents unexpected app exit on mobile when pressing back
            barrierDismissible: false,
            builder: (context) => AddServerFullscreen(
              server: server,
              window: true,
              title: AppLocalizations.of(context)!.createConnection,
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) => AddServerFullscreen(
                server: server,
                window: false,
                title: AppLocalizations.of(context)!.createConnection,
              ),
            ),
          );
        }
      });
    }

    return PopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.servers),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              ServersList(
                context: context,
                controllers: expandableControllerList,
                onChange: expandOrContract,
                scrollController: scrollController,
                breakingWidth: ResponsiveConstants.medium,
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                bottom: isVisible
                    ? showingSnackbar
                        ? 70
                        : (Platform.isIOS ? 40 : 20)
                    : -70,
                right: 20,
                child: FloatingActionButton(
                  onPressed: openAddServer,
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
