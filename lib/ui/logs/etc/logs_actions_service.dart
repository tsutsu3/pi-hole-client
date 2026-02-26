import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/metrics/queries.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/view_models/logs_viewmodel.dart';

/// A UI-coupled service that handles API actions related to log entries,
/// specifically adding URLs to the whitelist or blacklist.
///
/// This service encapsulates logic for executing API requests with appropriate
/// UI feedback mechanisms such as loading modals and snackbars. It is intended
/// to be used in contexts where [BuildContext] and [AppConfigViewModel] are available,
/// such as within a screen widget.
///
/// Key responsibilities:
/// - Invoking the API to register a URL as whitelisted or blacklisted
/// - Displaying a loading indicator during the process
/// - Showing success or error snackbars based on the API response
///
/// This service is tightly coupled to the UI layer and should not be used in
/// pure business logic or non-widget environments.
///
/// Example:
/// ```dart
/// final service = LogActionsService(
///   logsViewModel: logsViewModel,
///   context: context,
///   appConfigViewModel: appConfigViewModel,
/// );
/// await service.whiteBlackList('white', log);
/// ```
class LogActionsService {
  LogActionsService({
    required this.logsViewModel,
    required this.context,
    required this.appConfigViewModel,
  });

  final LogsViewModel logsViewModel;
  final BuildContext context;
  final AppConfigViewModel appConfigViewModel;

  /// Adds the URL from the given [log] to either the whitelist or blacklist,
  /// depending on the [list] type.
  ///
  /// While the operation is in progress, a loading modal is shown.
  /// After completion, a snackbar is displayed to indicate success or failure.
  ///
  /// Parameters:
  /// - [list]: Should be either `'white'` to add to the whitelist or `'black'` for the blacklist.
  /// - [log]: The log entry that contains the URL to be added.
  ///
  /// Does not throw exceptions. Returns early if the context is unmounted.
  Future<void> whiteBlackList(String list, Log log) async {
    final loc = AppLocalizations.of(context)!;
    final loading = ProcessModal(context: context);

    loading.open(list == 'white' ? loc.addingWhitelist : loc.addingBlacklist);

    final result = await logsViewModel.addDomainToList(
      list: list,
      domain: log.url,
    );

    loading.close();

    if (!context.mounted) return;

    result.fold(
      (_) {
        showSuccessSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: list == 'white'
              ? loc.domainWhitelistAdded
              : loc.domainBlacklistAdded,
        );
      },
      (_) => showErrorSnackBar(
        context: context,
        appConfigViewModel: appConfigViewModel,
        label: list == 'white'
            ? loc.domainWhitelistAddFailed
            : loc.domainBlacklistAddFailed,
      ),
    );
  }
}
