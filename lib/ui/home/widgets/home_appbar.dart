import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/home/widgets/home_appbar/adblock_status_icon.dart';
import 'package:pi_hole_client/ui/home/widgets/home_appbar/server_actions_menu.dart';
import 'package:pi_hole_client/ui/home/widgets/home_appbar/server_label.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({required this.innerBoxIsScrolled, super.key});

  final bool innerBoxIsScrolled;

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      floating: true,
      centerTitle: false,
      forceElevated: innerBoxIsScrolled,
      leading: const AdBlockStatusIcon(),
      title: const ServerLabel(),
      actions: const [ServerActionsMenu()],
    );
  }
}
