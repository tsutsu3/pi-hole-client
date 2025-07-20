import 'package:flutter/material.dart';
import 'package:pi_hole_client/config2/formats.dart';
import 'package:pi_hole_client/config2/responsive.dart';
import 'package:pi_hole_client/data2/services/gateways/shared/models/domain.dart';
import 'package:pi_hole_client/ui2/core/themes/theme.dart';
import 'package:pi_hole_client/utils2/conversions.dart';
import 'package:pi_hole_client/utils2/format.dart';

/// A widget that displays a domain item with its type, address, date added.
///
/// This tile is responsive and adapts its layout based on the screen width:
/// - On large screens, the tile has rounded corners and a highlighted background when selected.
/// - On smaller screens, it displays in a flat style without extra padding.
///
/// The tile shows the following information:
/// - A domain address
/// - The date the domain was added
/// - The domain type (e.g. whitelist, blacklist, etc.)
///
/// Tapping the tile triggers a callback to show the domain details.
class DomainTile extends StatelessWidget {
  /// Creates a [DomainTile].
  ///
  /// The [domain], [showDomainDetails], and [colors] parameters must not be null.
  /// The optional [isDomainSelected] controls the visual highlight for selection.
  const DomainTile({
    required this.domain,
    required this.showDomainDetails,
    required this.colors,
    this.isDomainSelected,
    super.key,
  });

  /// The domain data to display.
  final Domain domain;

  /// A callback to be triggered when the tile is tapped.
  final void Function(Domain) showDomainDetails;

  /// Custom color palette for themed elements.
  final AppColors colors;

  /// Whether this tile is currently selected.
  final bool? isDomainSelected;

  @override
  Widget build(BuildContext context) {
    Widget domainType(int type) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: Text(
          getDomainType(type),
          style: TextStyle(
            color: convertColorFromNumber(colors, type),
            fontSize: 13,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }

    Widget domainStatusIcon(int enabled) {
      final appColors = Theme.of(context).extension<AppColors>()!;

      switch (enabled) {
        case 0:
          // Disabled
          return Icon(
            Icons.remove_circle_rounded,
            color: appColors.queryGrey,
          );
        case 1:
          // Enabled
          return Icon(
            Icons.check_circle_outline_rounded,
            color: Theme.of(context).colorScheme.secondary,
          );
        default:
          return Icon(
            Icons.help_rounded,
            color: appColors.queryGrey,
          );
      }
    }

    /// The content of the tile, which includes the domain address, date added,
    /// and domain type.
    final Widget content = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        domainStatusIcon(domain.enabled),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                domain.domain,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                formatTimestamp(domain.dateAdded, kUnifiedDateFormat),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context).listTileTheme.textColor,
                  fontSize: 14,
                  height: 1.4,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        domainType(domain.type),
      ],
    );

    if (MediaQuery.of(context).size.width > ResponsiveConstants.large) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Material(
          borderRadius: BorderRadius.circular(28),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(28),
            onTap: () => showDomainDetails(domain),
            child: AnimatedContainer(
              curve: Curves.ease,
              duration: const Duration(milliseconds: 200),
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: isDomainSelected == true
                    ? Theme.of(context).colorScheme.primaryContainer
                    : null,
              ),
              child: content,
            ),
          ),
        ),
      );
    } else {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => showDomainDetails(domain),
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: content,
          ),
        ),
      );
    }
  }
}
