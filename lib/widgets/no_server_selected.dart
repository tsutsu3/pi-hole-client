import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pi_hole_client/constants/responsive.dart';

import 'package:pi_hole_client/screens/servers/add_server_fullscreen.dart';

class NoServerSelected extends StatelessWidget {
  const NoServerSelected({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    void selectServer() {
      Future.delayed(
        Duration.zero,
        () => {
          if (width > ResponsiveConstants.medium)
            {
              if (context.mounted)
                {
                  showDialog(
                    context: context,
                    builder: (context) => AddServerFullscreen(
                      window: true,
                      title: AppLocalizations.of(context)!.createConnection,
                    ),
                    barrierDismissible: false,
                  ),
                },
            }
          else
            {
              if (context.mounted)
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) => AddServerFullscreen(
                        window: false,
                        title: AppLocalizations.of(context)!.createConnection,
                      ),
                    ),
                  ),
                },
            },
        },
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: height - 162 > 300 ? 300 : height - 162,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.link_off,
                  size: 70,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                Text(
                  AppLocalizations.of(context)!.noServerSelected,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 24,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: selectServer,
                  label: Text(AppLocalizations.of(context)!.selectConnection),
                  icon: const Icon(Icons.storage_rounded),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
