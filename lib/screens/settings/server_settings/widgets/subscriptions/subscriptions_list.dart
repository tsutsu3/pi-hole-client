import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/subscriptions.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/groups_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/subscriptions_list_provider.dart';
import 'package:pi_hole_client/screens/settings/server_settings/widgets/subscriptions/add_subscription_modal.dart';
import 'package:pi_hole_client/screens/settings/server_settings/widgets/subscriptions/subscription_details_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/widgets/subscriptions/subscription_tile.dart';
import 'package:pi_hole_client/widgets/tab_content_list.dart';
import 'package:provider/provider.dart';

class SubscriptionsList extends StatefulWidget {
  const SubscriptionsList({
    required this.type,
    required this.scrollController,
    required this.onSubscriptionSelected,
    required this.selectedSubscription,
    super.key,
  });

  final String type;
  final ScrollController scrollController;
  final void Function(Subscription) onSubscriptionSelected;
  final Subscription? selectedSubscription;

  @override
  State<SubscriptionsList> createState() => _SubscriptionsListState();
}

class _SubscriptionsListState extends State<SubscriptionsList> {
  late bool isVisible;

  @override
  void initState() {
    super.initState();
    isVisible = true;
    widget.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (mounted && isVisible == true) {
        setState(() => isVisible = false);
      }
    } else {
      if (widget.scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (mounted && isVisible == false) {
          setState(() => isVisible = true);
        }
      }
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final serversProvider = Provider.of<ServersProvider>(context);
    final subscriptionsListProvider =
        Provider.of<SubscriptionsListProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);
    final apiGateway = serversProvider.selectedApiGateway;
    final groups = context.watch<GroupsProvider>().groupItems;

    final subscriptionsList = widget.type == 'blacklist'
        ? subscriptionsListProvider.filteredBlacklistSubscriptions
        : subscriptionsListProvider.filteredWhitelistSubscriptions;

    Future<void> removeSubscription(Subscription subscription) async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.deleting);

      final result = await apiGateway?.removeSubscription(
        url: subscription.address,
        stype: subscription.type,
      );

      if (!context.mounted) return;

      process.close();

      if (result?.result == APiResponseType.success) {
        subscriptionsListProvider.removeSubscriptionFromList(subscription);
        await Navigator.maybePop(context);

        if (!context.mounted) return;
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.adlistRemoved,
        );
      } else if (result?.result == APiResponseType.notFound) {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.adlistNotExists,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.errorRemovingAdlist,
        );
      }
    }

    Future<void> onAddSubscription(Map<String, dynamic> value) async {
      final data = SubscriptionRequest.fromJson(value);

      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.addingAdlist);

      final result = await apiGateway?.createSubscription(body: data);

      if (!context.mounted) return;

      process.close();

      if (result?.result == APiResponseType.success) {
        await subscriptionsListProvider.fetchSubscriptionsList();
        if (!context.mounted) return;
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.adlistAdded,
        );
      } else if (result?.result == APiResponseType.alreadyAdded) {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.adlistAlreadyAdded,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.cannotAddAdlist,
        );
      }
    }

    void openModalAddSubscriptionToList() {
      if (MediaQuery.of(context).size.width > ResponsiveConstants.medium) {
        showDialog(
          context: context,
          useRootNavigator:
              false, // Prevents unexpected app exit on mobile when pressing back
          builder: (ctx) => AddSubscriptionModal(
            selectedlist: widget.type,
            addSubscription: onAddSubscription,
            window: true,
            groups: groups,
          ),
        );
      } else {
        showModalBottomSheet(
          context: context,
          builder: (ctx) => AddSubscriptionModal(
            selectedlist: widget.type,
            addSubscription: onAddSubscription,
            window: false,
            groups: groups,
          ),
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
        );
      }
    }

    return Stack(
      children: [
        CustomTabContentList(
          loadingGenerator: () => SizedBox(
            width: double.maxFinite,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 50),
                Text(
                  AppLocalizations.of(context)!.loadingList,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          itemsCount: subscriptionsList.length,
          contentWidget: (index) {
            final thisSubscription = subscriptionsList[index];
            return Padding(
              padding: index == 0 &&
                      MediaQuery.of(context).size.width >
                          ResponsiveConstants.large
                  ? const EdgeInsets.only(top: 16)
                  : EdgeInsets.zero,
              child: SubscriptionTile(
                subscription: thisSubscription,
                isSubscriptionSelected:
                    widget.selectedSubscription == thisSubscription,
                showSubscriptionDetails: (d) {
                  widget.onSubscriptionSelected(d);
                  if (MediaQuery.of(context).size.width <=
                      ResponsiveConstants.large) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SubscriptionDetailsScreen(
                          subscription: d,
                          remove: removeSubscription,
                          colors: serversProvider.colors,
                          groups: groups,
                        ),
                      ),
                    );
                  }
                },
                colors: serversProvider.colors,
              ),
            );
          },
          noData: Container(
            height: double.maxFinite,
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.noAdlists,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          errorGenerator: () => SizedBox(
            width: double.maxFinite,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error,
                  size: 50,
                  color: Colors.red,
                ),
                const SizedBox(height: 50),
                Text(
                  AppLocalizations.of(context)!.adlistsNotLoaded,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          loadStatus: subscriptionsListProvider.loadingStatus,
          onRefresh: () async =>
              subscriptionsListProvider.fetchSubscriptionsList(),
          bottomSpaceHeight: 80,
        ),
        SafeArea(
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                bottom: isVisible
                    ? appConfigProvider.showingSnackbar
                        ? 70
                        : 20
                    : -70,
                right: 20,
                child: FloatingActionButton(
                  onPressed: openModalAddSubscriptionToList,
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
