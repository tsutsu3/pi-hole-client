import 'package:flutter/material.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/log.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';

/// A UI-coupled service that handles API actions related to log entries,
/// specifically adding URLs to the whitelist or blacklist.
///
/// This service encapsulates logic for executing API requests with appropriate
/// UI feedback mechanisms such as loading modals and snackbars. It is intended
/// to be used in contexts where [BuildContext] and [AppConfigProvider] are available,
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
///   apiGateway: apiGateway,
///   context: context,
///   appConfigProvider: appConfigProvider,
/// );
/// await service.whiteBlackList('white', log);
/// ```
class LogActionsService {
  LogActionsService({
    required this.apiGateway,
    required this.context,
    required this.appConfigProvider,
  });

  final ApiGateway apiGateway;
  final BuildContext context;
  final AppConfigProvider appConfigProvider;

  /// Adds the URL from the given [log] to either the whitelist or blacklist, depending on the [list] type.
  ///
  /// While the operation is in progress, a loading modal is shown.
  /// After completion, a snackbar is displayed to indicate success or failure:
  /// - If successful, a message indicates whether the URL was newly added or already present.
  /// - If failed, an error message is shown.
  ///
  /// Parameters:
  /// - [list]: Should be either `'white'` to add to the whitelist or `'black'` for the blacklist.
  /// - [log]: The log entry that contains the URL to be added.
  ///
  /// Does not throw exceptions. Returns early if the context is unmounted.
  Future<void> whiteBlackList(String list, Log log) async {
    final loc = AppLocalizations.of(context)!;
    final loading = ProcessModal(context: context);

    loading.open(
      list == 'white' ? loc.addingWhitelist : loc.addingBlacklist,
    );

    final result = await apiGateway.setWhiteBlacklist(log.url, list);

    loading.close();

    if (!context.mounted) return;

    if (result.result == APiResponseType.success) {
      if (result.data!.message.contains('Added')) {
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: list == 'white' ? loc.addedWhitelist : loc.addedBlacklist,
        );
      } else {
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: list == 'white' ? loc.alreadyWhitelist : loc.alreadyBlacklist,
        );
      }
    } else {
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label:
            list == 'white' ? loc.couldntAddWhitelist : loc.couldntAddBlacklist,
      );
    }
  }
}
