import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pi_hole_client/domain/model/app/app_log.dart';
import 'package:pi_hole_client/ui/app_logs/widgets/app_log_type_icon.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/formats.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/utils/format.dart';
import 'package:provider/provider.dart';

class AppLogDetailsScreen extends StatelessWidget {
  const AppLogDetailsScreen({required this.log, super.key});

  final AppLog log;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final dateTime = formatTimestamp(log.dateTime, kUnifiedDateTimeLogFormat);

    Future<void> copyLogClipboard() async {
      final appConfigViewModel = context.read<AppConfigViewModel>();

      try {
        await Clipboard.setData(
          ClipboardData(text: appLogToText(log, dateTime: dateTime)),
        );
      } on PlatformException {
        if (!context.mounted) return;
        showErrorSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: loc.logCopyFailed,
        );
        return;
      }

      if (!context.mounted) return;
      showNeutralSnackBar(
        context: context,
        appConfigViewModel: appConfigViewModel,
        label: loc.logCopiedClipboard,
      );
    }

    Widget tile(IconData icon, String title, String value) => ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(value),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.logDetails),
        actions: [
          IconButton(
            onPressed: copyLogClipboard,
            icon: const Icon(Icons.copy_rounded),
            tooltip: loc.copyLogClipboard,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SectionLabel(label: loc.overview),
            tile(Icons.subject_rounded, loc.summary, log.message),
            tile(appLogTypeIcon(log.type), loc.type, log.type),
            tile(Icons.access_time_outlined, loc.time, dateTime),
            if (log.serverAddress != null)
              tile(Icons.dns_rounded, loc.serverAddress, log.serverAddress!),
            if (log.statusCode != null)
              tile(Icons.numbers_rounded, loc.statusCode, log.statusCode!),
            if (log.details != null) ...[
              SectionLabel(label: loc.details),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: _DetailsBox(details: log.details!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// A read-only text box that scrolls when [details] has more than 5 lines.
class _DetailsBox extends StatefulWidget {
  const _DetailsBox({required this.details});

  final String details;

  @override
  State<_DetailsBox> createState() => _DetailsBoxState();
}

class _DetailsBoxState extends State<_DetailsBox> {
  static const _maxLines = 5;
  static const _padding = 16.0;

  // Shared with the Scrollbar, so that the bar is shown on mobile too.
  final _scrollController = ScrollController();

  // Where the mouse wheel scroll goes to. Null when no wheel scroll is running.
  double? _wheelTarget;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Scrolls one line for each wheel step, with a short animation.
  ///
  /// By default, one wheel step jumps about 3 lines at once. That is too much
  /// for a box that shows only 5 lines.
  void _onPointerSignal(PointerSignalEvent event, double lineHeight) {
    if (event is! PointerScrollEvent || event.scrollDelta.dy == 0) return;
    final position = _scrollController.position;
    if (position.maxScrollExtent == 0) return;

    GestureBinding.instance.pointerSignalResolver.register(event, (_) {
      final target =
          ((_wheelTarget ?? position.pixels) +
                  event.scrollDelta.dy.sign * lineHeight)
              .clamp(position.minScrollExtent, position.maxScrollExtent);
      _wheelTarget = target;
      _scrollController
          .animateTo(
            target,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeOut,
          )
          .whenComplete(() {
            if (_wheelTarget == target) _wheelTarget = null;
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    final style = DefaultTextStyle.of(context).style;
    final lineHeight =
        MediaQuery.textScalerOf(context).scale(style.fontSize ?? 14) *
        (style.height ?? 1.2);

    return Container(
      constraints: BoxConstraints(
        maxHeight: lineHeight * _maxLines + _padding * 2,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      // Keep the bar inside the rounded border.
      child: ScrollbarTheme(
        data: ScrollbarTheme.of(
          context,
        ).copyWith(crossAxisMargin: 4, mainAxisMargin: 10),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          // Hide the bar that desktop adds by default, so that only one is shown.
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(
              context,
            ).copyWith(scrollbars: false),
            // Selection outside the scroll view, so that dragging a selection
            // past an edge scrolls the box like a text field does.
            child: SelectionArea(
              child: SingleChildScrollView(
                controller: _scrollController,
                // The Listener is inside the scroll view, so that it handles the
                // wheel before the scroll view does.
                child: Listener(
                  onPointerSignal: (event) =>
                      _onPointerSignal(event, lineHeight),
                  child: Padding(
                    padding: const EdgeInsets.all(_padding),
                    child: Text(widget.details),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Returns [log] as plain text to paste in an issue.
///
/// The labels are not translated, so that anyone can read the text.
String appLogToText(AppLog log, {required String dateTime}) {
  return [
    'Summary: ${log.message}',
    'Type: ${log.type}',
    'Time: $dateTime',
    if (log.serverAddress != null) 'Server address: ${log.serverAddress}',
    if (log.statusCode != null) 'Status code: ${log.statusCode}',
    if (log.details != null) 'Details: ${log.details}',
  ].join('\n');
}
