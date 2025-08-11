import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_provider.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Displays a status metric in a responsive tile.
///
/// `HomeTileItem` is used to show key statistics such as total queries,
/// blocked queries, or percentage blocked in the Pi-hole dashboard.
///
/// ## Parameters
/// - `icon`: The icon to display in the card.
/// - `iconColor`: The color of the icon.
/// - `color`: The color of the card.
/// - `label`: The label to display in the card.
/// - `value`: The value to display in the card.
/// - `width`: The width of the card.
/// - `valueSelector`: A function that selects the value to display.
/// - `onTap`: An optional callback that is called when the card is tapped.
class HomeTileItem extends StatelessWidget {
  const HomeTileItem({
    required this.icon,
    required this.iconColor,
    required this.color,
    required this.label,
    required this.width,
    required this.valueSelector,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final Color iconColor;
  final Color color;
  final String label;
  final double width;
  final VoidCallback? onTap;

  /// Realtime value selector (ex: select value from StatusProvider)
  final String Function(BuildContext context) valueSelector;

  @override
  Widget build(BuildContext context) {
    final loadStatus = context.select<StatusProvider, LoadStatus>(
      (provider) => provider.getStatusLoading,
    );

    return FractionallySizedBox(
      widthFactor: width > ResponsiveConstants.medium ? 0.25 : 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Material(
          child: InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color,
              ),
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Skeleton.keep(
                          child: Icon(
                            icon,
                            size: 65,
                            color: iconColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                child: Skeleton.keep(
                                  child: Text(
                                    label,
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              _ValueSection(
                                loadStatus: loadStatus,
                                valueSelector: valueSelector,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

/// A widget that displays a value or an error indicator based on the [loadStatus].
///
/// If [loadStatus] is [LoadStatus.error], it shows a warning icon and an error message.
/// Otherwise, it displays the value returned by [valueSelector].
///
/// The [valueSelector] is a function that takes the current [BuildContext] and returns
/// a string to be displayed.
///
/// Example usage:
/// ```dart
/// _ValueSection(
///   loadStatus: myLoadStatus,
///   valueSelector: (context) => '42',
/// )
/// ```
class _ValueSection extends StatelessWidget {
  const _ValueSection({
    required this.loadStatus,
    required this.valueSelector,
  });

  final LoadStatus loadStatus;
  final String Function(BuildContext context) valueSelector;

  @override
  Widget build(BuildContext context) {
    if (loadStatus == LoadStatus.error) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            size: 24,
            color: Colors.white,
          ),
          const SizedBox(width: 4),
          Text(
            AppLocalizations.of(context)!.error,
            style: const TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    }

    final value = valueSelector(context);

    return Text(
      value,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
