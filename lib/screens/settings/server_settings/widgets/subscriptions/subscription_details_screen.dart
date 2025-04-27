import 'package:flutter/material.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/functions/conversions.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/functions/open_url.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/subscriptions.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/subscriptions_list_provider.dart';
import 'package:pi_hole_client/screens/settings/server_settings/widgets/subscriptions/edit_subscription_modal.dart';
import 'package:pi_hole_client/widgets/custom_list_tile.dart';
import 'package:pi_hole_client/widgets/delete_modal.dart';
import 'package:pi_hole_client/widgets/section_label.dart';
import 'package:provider/provider.dart';

class SubscriptionDetailsScreen extends StatefulWidget {
  const SubscriptionDetailsScreen({
    required this.subscription,
    required this.remove,
    required this.groups,
    this.colors,
    super.key,
  });

  final Subscription subscription;
  final void Function(Subscription) remove;
  final Map<int, String> groups;
  final AppColors? colors;

  @override
  State<SubscriptionDetailsScreen> createState() =>
      _SubscriptionDetailsScreenState();
}

class _SubscriptionDetailsScreenState extends State<SubscriptionDetailsScreen> {
  late Subscription _subscription;
  late ServersProvider serversProvider;
  late ApiGateway? apiGateway;
  late SubscriptionsListProvider subscriptionsListProvider;
  late AppConfigProvider appConfigProvider;

  @override
  void initState() {
    super.initState();
    _subscription = widget.subscription.copyWith();
  }

  @override
  void didUpdateWidget(covariant SubscriptionDetailsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.subscription != widget.subscription) {
      setState(() {
        _subscription = widget.subscription.copyWith();
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appConfigProvider = context.watch<AppConfigProvider>();
    serversProvider = context.watch<ServersProvider>();
    subscriptionsListProvider = context.watch<SubscriptionsListProvider>();
    apiGateway = serversProvider.selectedApiGateway;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.adlistDetails),
        actions: [
          IconButton(
            onPressed: () => openUrl(_subscription.address),
            icon: const Icon(Icons.travel_explore_rounded),
            tooltip: AppLocalizations.of(context)!.searchAdlistInternet,
          ),
          IconButton(
            onPressed: () => showDialog(
              context: context,
              useRootNavigator:
                  false, // Prevents unexpected app exit on mobile when pressing back
              builder: (context) => DeleteModal(
                title: AppLocalizations.of(context)!.deleteAdlist,
                message: AppLocalizations.of(context)!.deleteAdlistMessage,
                onDelete: () {
                  Navigator.maybePop(context);
                  widget.remove(_subscription);
                },
              ),
            ),
            icon: const Icon(Icons.delete_rounded),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SectionLabel(label: AppLocalizations.of(context)!.adlistSettings),
            CustomListTile(
              leadingIcon: Icons.public_rounded,
              label: AppLocalizations.of(context)!.adlistAddress,
              description: _subscription.address,
            ),
            CustomListTile(
              leadingIcon: Icons.category_rounded,
              label: AppLocalizations.of(context)!.type,
              description: _subscription.type,
              color: _subscription.type == 'block'
                  ? Theme.of(context).extension<AppColors>()!.commonRed
                  : Theme.of(context).extension<AppColors>()!.commonGreen,
            ),
            CustomListTile(
              leadingIcon: Icons.check_rounded,
              label: AppLocalizations.of(context)!.status,
              description: _subscription.enabled
                  ? AppLocalizations.of(context)!.enabled
                  : AppLocalizations.of(context)!.disabled,
              onTap: () {
                onEditSubscription(
                  _subscription
                      .copyWith(
                        enabled: !_subscription.enabled,
                      )
                      .toJson(),
                );
              },
              trailing: Switch(
                value: _subscription.enabled,
                onChanged: (value) {
                  onEditSubscription(
                    _subscription
                        .copyWith(
                          enabled: value,
                        )
                        .toJson(),
                  );
                },
              ),
            ),
            CustomListTile(
              leadingIcon: Icons.group_rounded,
              label: AppLocalizations.of(context)!.groups,
              description: getGroupNames().join(', '),
              trailing: Icon(
                Icons.edit_rounded,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onTap: openGroupsModal,
            ),
            CustomListTile(
              leadingIcon: Icons.comment_rounded,
              label: AppLocalizations.of(context)!.comment,
              description: _subscription.comment == ''
                  ? AppLocalizations.of(context)!.noComment
                  : _subscription.comment,
              trailing: Icon(
                Icons.edit_rounded,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onTap: openCommentModal,
            ),
            SectionLabel(label: AppLocalizations.of(context)!.adlistInfo),
            CustomListTile(
              leadingIcon: Icons.label_outline_rounded,
              label: AppLocalizations.of(context)!.id,
              description: _subscription.id.toString(),
            ),
            CustomListTile(
              leadingIcon: Icons.monitor_heart_outlined,
              label: AppLocalizations.of(context)!.adlistStatus,
              description:
                  getSubscriptionStatusType(_subscription.status.index),
            ),
            CustomListTile(
              leadingIcon: Icons.domain_add_rounded,
              label: AppLocalizations.of(context)!.domains,
              description: _subscription.number.toString(),
            ),
            CustomListTile(
              leadingIcon: Icons.domain_disabled_rounded,
              label: AppLocalizations.of(context)!.invalidDomains,
              description: _subscription.invalidDomains.toString(),
            ),
            CustomListTile(
              leadingIcon: Icons.event_available_rounded,
              label: AppLocalizations.of(context)!.dateAdded,
              description:
                  formatTimestamp(_subscription.dateAdded, 'yyyy-MM-dd HH:mm'),
            ),
            CustomListTile(
              leadingIcon: Icons.edit_calendar_rounded,
              label: AppLocalizations.of(context)!.dateModified,
              description: formatTimestamp(
                _subscription.dateModified,
                'yyyy-MM-dd HH:mm',
              ),
            ),
            CustomListTile(
              leadingIcon: Icons.event_repeat_rounded,
              label: AppLocalizations.of(context)!.dateUpdated,
              description: formatTimestamp(
                _subscription.dateUpdated,
                'yyyy-MM-dd HH:mm',
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> getGroupNames() {
    final groupNames = <String>[];
    for (final group in _subscription.groups) {
      groupNames.add(widget.groups[group]!);
    }
    return groupNames;
  }

  Future<void> onEditSubscription(Map<String, dynamic> value) async {
    final body = SubscriptionRequest.fromJson(value);

    final process = ProcessModal(context: context);
    process.open(AppLocalizations.of(context)!.updatingAdlist);

    final result = await apiGateway?.updateSubscription(body: body);

    process.close();

    if (result?.result == APiResponseType.success) {
      await subscriptionsListProvider.fetchSubscriptionsList();

      setState(() {
        _subscription = result!.data!.subscriptions.first.copyWith();
      });

      if (!mounted) return;

      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.adlistUpdated,
      );
    } else {
      if (!mounted) return;

      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.cannotEditAdlist,
      );
    }
  }

  void openCommentModal() {
    final mediaQuery = MediaQuery.of(context);
    final isSmallLandscape = mediaQuery.size.width > mediaQuery.size.height &&
        mediaQuery.size.height < ResponsiveConstants.medium;

    if (MediaQuery.of(context).size.width > ResponsiveConstants.medium) {
      showDialog(
        context: context,
        useSafeArea: !isSmallLandscape,
        useRootNavigator:
            false, // Prevents unexpected app exit on mobile when pressing back
        builder: (ctx) => EditSubscriptionModal(
          subscription: _subscription,
          keyItem: 'comment',
          title: AppLocalizations.of(context)!.editComment,
          icon: Icons.comment_rounded,
          onConfirm: onEditSubscription,
          groups: widget.groups,
          window: true,
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => EditSubscriptionModal(
          subscription: _subscription,
          keyItem: 'comment',
          title: AppLocalizations.of(context)!.editComment,
          icon: Icons.comment_rounded,
          onConfirm: onEditSubscription,
          groups: widget.groups,
          window: false,
        ),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
      );
    }
  }

  void openGroupsModal() {
    if (MediaQuery.of(context).size.width > ResponsiveConstants.medium) {
      showDialog(
        context: context,
        useRootNavigator:
            false, // Prevents unexpected app exit on mobile when pressing back
        builder: (ctx) => EditSubscriptionModal(
          subscription: _subscription,
          keyItem: 'groups',
          title: AppLocalizations.of(context)!.editGroups,
          icon: Icons.group_rounded,
          onConfirm: onEditSubscription,
          groups: widget.groups,
          window: true,
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => EditSubscriptionModal(
          subscription: _subscription,
          keyItem: 'groups',
          title: AppLocalizations.of(context)!.editGroups,
          icon: Icons.group_rounded,
          onConfirm: onEditSubscription,
          groups: widget.groups,
          window: false,
        ),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
      );
    }
  }
}
