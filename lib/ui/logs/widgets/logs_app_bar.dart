import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/custom_radio.dart';

/// A custom AppBar widget for the logs screen, supporting search, filter, and sort functionalities.
///
/// Displays either a default app bar with filter and sort actions, or a search bar depending on [showSearchBar].
///
/// - [showSearchBar]: Whether to display the search bar.
/// - [onSearchClose]: Callback when the search bar is closed.
/// - [onSearchClear]: Callback when the search input is cleared.
/// - [onSearchChanged]: Callback when the search input changes.
/// - [onSearchOpen]: Callback when the search bar is opened.
/// - [onFilterTap]: Callback when the filter button is tapped.
/// - [onSortChanged]: Callback when the sort option is changed.
/// - [sortStatus]: The current sort status (used to highlight the selected sort option).
/// - [filterChips]: List of filter chips to display below the app bar.
/// - [searchController]: Controller for the search input field.
/// - [width]: The width of the app bar, used to size the search field appropriately.
/// - [hasActiveChips]: Whether there are active filter chips to display.
///
/// Implements [PreferredSizeWidget] to allow usage as an AppBar.
class LogsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LogsAppBar({
    required this.showSearchBar,
    required this.onSearchClose,
    required this.onSearchClear,
    required this.onSearchChanged,
    required this.onSearchOpen,
    required this.onFilterTap,
    required this.onSortChanged,
    required this.sortStatus,
    required this.filterChips,
    required this.searchController,
    required this.width,
    required this.hasActiveChips,
    super.key,
  });

  final bool showSearchBar;
  final VoidCallback onSearchClose;
  final VoidCallback onSearchClear;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onSearchOpen;
  final VoidCallback onFilterTap;
  final ValueChanged<int> onSortChanged;
  final int sortStatus;
  final Widget filterChips;
  final TextEditingController searchController;
  final double width;
  final bool hasActiveChips;

  @override
  Size get preferredSize => Size.fromHeight(hasActiveChips ? 110 : 60);

  @override
  Widget build(BuildContext context) {
    return showSearchBar
        ? _buildSearchAppBar(context)
        : _buildDefaultAppBar(context);
  }

  /// Builds the default [AppBar] for the logs screen.
  ///
  /// The app bar includes:
  /// - A title displaying the localized "Query Logs" string.
  /// - A search icon button that triggers [onSearchOpen].
  /// - A filter icon button that triggers [onFilterTap].
  /// - A sort popup menu button that allows sorting logs from latest to oldest or vice versa,
  ///   triggering [onSortChanged] with the selected value.
  /// - If [filterChips] is not empty, a horizontal list of filter chips is displayed at the bottom
  ///   of the app bar.
  ///
  /// [context] is the build context used for localization and widget building.
  ///
  /// Returns a [PreferredSizeWidget] representing the configured app bar.
  PreferredSizeWidget _buildDefaultAppBar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.queryLogs),
      toolbarHeight: 60,
      actions: [
        IconButton(
          onPressed: onSearchOpen,
          icon: const Icon(Icons.search_rounded),
          splashRadius: 20,
        ),
        IconButton(
          onPressed: onFilterTap,
          icon: const Icon(Icons.filter_list_rounded),
          splashRadius: 20,
        ),
        PopupMenuButton(
          splashRadius: 20,
          icon: const Icon(Icons.sort_rounded),
          onSelected: onSortChanged,
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 0,
              child: _buildSortOption(
                context,
                icon: Icons.arrow_downward_rounded,
                label: AppLocalizations.of(context)!.fromLatestToOldest,
                value: 0,
              ),
            ),
            PopupMenuItem(
              value: 1,
              child: _buildSortOption(
                context,
                icon: Icons.arrow_upward_rounded,
                label: AppLocalizations.of(context)!.fromOldestToLatest,
                value: 1,
              ),
            ),
          ],
        ),
      ],
      bottom: hasActiveChips
          ? PreferredSize(
              preferredSize: const Size(double.maxFinite, 50),
              child: Container(
                width: double.maxFinite,
                height: 50,
                padding: const EdgeInsets.only(bottom: 10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 5),
                    filterChips,
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            )
          : const PreferredSize(preferredSize: Size.zero, child: SizedBox()),
    );
  }

  /// Builds a custom search AppBar widget for the logs screen.
  ///
  /// The AppBar includes:
  /// - A back arrow button to close the search mode (`onSearchClose`).
  /// - A clear button to clear the search input (`onSearchClear`).
  /// - A centered [TextField] for entering the search query, with autofocus enabled.
  /// - The search field displays a localized hint text and uses a custom width and height.
  ///
  /// Parameters:
  /// - [context]: The build context used for localization and theming.
  ///
  /// Returns:
  /// - A [PreferredSizeWidget] representing the search AppBar.
  PreferredSizeWidget _buildSearchAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      leading: IconButton(
        onPressed: onSearchClose,
        icon: const Icon(Icons.arrow_back),
        splashRadius: 20,
      ),
      actions: [
        IconButton(
          onPressed: onSearchClear,
          icon: const Icon(Icons.clear_rounded),
          splashRadius: 20,
        ),
      ],
      title: Container(
        width: width - 136,
        height: 60,
        margin: const EdgeInsets.only(bottom: 5),
        child: Center(
          child: TextField(
            controller: searchController,
            onChanged: onSearchChanged,
            autofocus: true,
            style: const TextStyle(fontSize: 18),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: AppLocalizations.of(context)!.searchUrl,
              hintStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds a sort option widget consisting of an icon, label, and a custom radio button.
  ///
  /// Displays the provided [icon] and [label] in a row, followed by a [CustomRadio] widget
  /// that indicates the current sort selection. The [value] parameter represents the value
  /// associated with this sort option, and [sortStatus] is used to determine the selected state.
  ///
  /// - [context]: The build context.
  /// - [icon]: The icon to display for the sort option.
  /// - [label]: The label text for the sort option.
  /// - [value]: The value associated with this sort option.
  Widget _buildSortOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required int value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 15),
              Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
            ],
          ),
        ),
        CustomRadio(
          value: value,
          groupValue: sortStatus,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ],
    );
  }
}
