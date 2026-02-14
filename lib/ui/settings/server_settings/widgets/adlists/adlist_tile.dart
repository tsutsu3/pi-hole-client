import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';

/// A widget that displays an adlist item with its status, address,
/// and domain validation statistics.
///
/// This tile is responsive and adapts its layout based on the screen width:
/// - On large screens, the tile has rounded corners and a highlighted background when selected.
/// - On smaller screens, it displays in a flat style without extra padding.
///
/// The tile shows the following information:
/// - A status icon (e.g. ok, error, etc.)
/// - The adlist address
/// - Number of valid and invalid domains
/// - Whether the adlist is enabled (as a label)
///
/// Tapping the tile triggers a callback to show the adlist details.
///
/// The appearance of the tile (selected state, color theme) can be controlled via parameters.
class AdlistTile extends StatelessWidget {
  /// Creates a [AdlistTile].
  ///
  /// The [adlist], [showAdlistDetails], and [colors] parameters must not be null.
  /// The optional [isAdlistSelected] controls the visual highlight for selection.
  const AdlistTile({
    required this.adlist,
    required this.showAdlistDetails,
    required this.colors,
    this.isAdlistSelected,
    super.key,
  });

  /// The adlist data to display.
  final Adlist adlist;

  /// A callback to be triggered when the tile is tapped.
  final void Function(Adlist) showAdlistDetails;

  /// Custom color palette for themed elements.
  final AppColors colors;

  /// Whether this tile is currently selected.
  final bool? isAdlistSelected;

  @override
  Widget build(BuildContext context) {
    final isWide =
        MediaQuery.of(context).size.width > ResponsiveConstants.large;

    Widget adlistStatusIcon(int type) {
      final appColors = Theme.of(context).extension<AppColors>()!;

      switch (type) {
        case 0:
          return Icon(Icons.help_rounded, color: appColors.queryGrey);
        case 1:
          return Icon(Icons.check_circle_rounded, color: appColors.commonGreen);
        case 2:
          return Icon(Icons.update_rounded, color: appColors.commonGreen);
        case 3:
          return Icon(Icons.error_rounded, color: appColors.queryGrey);
        case 4:
          return Icon(Icons.cancel_rounded, color: appColors.commonRed);
        default:
          return Icon(Icons.question_mark_rounded, color: appColors.queryGrey);
      }
    }

    /// The content of the tile, including the adlist address, domain statistics, and status.
    final Widget content = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        adlistStatusIcon(adlist.status.index),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                adlist.address,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${AppLocalizations.of(context)!.domains}: ${adlist.number}',
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
        const SizedBox(width: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: adlist.enabled
              ? BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                )
              : null,
          child: Text(
            adlist.enabled
                ? AppLocalizations.of(context)!.enabled
                : AppLocalizations.of(context)!.disabled,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: adlist.enabled
                  ? Theme.of(context).colorScheme.primary
                  : colors.queryGrey,
            ),
          ),
        ),
      ],
    );

    return Padding(
      padding: isWide
          ? const EdgeInsets.symmetric(horizontal: 12)
          : EdgeInsets.zero,
      child: Material(
        borderRadius: isWide ? BorderRadius.circular(28) : null,
        color: Colors.transparent,
        child: InkWell(
          borderRadius: isWide ? BorderRadius.circular(28) : null,
          onTap: () => showAdlistDetails(adlist),
          child: AnimatedContainer(
            curve: Curves.ease,
            duration: const Duration(milliseconds: 200),
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: isWide ? 12 : 16,
            ),
            decoration: isWide && isAdlistSelected == true
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  )
                : null,
            child: content,
          ),
        ),
      ),
    );
  }
}
