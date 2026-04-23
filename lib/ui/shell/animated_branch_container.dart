import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

/// Shows only the active branch navigator and fades between branches.
///
/// Unlike an IndexedStack-based container, inactive branches are unmounted so
/// transient UI state (scroll position, pushed detail screens, dialogs) does
/// not persist across tab switches.
class AnimatedBranchContainer extends StatelessWidget {
  const AnimatedBranchContainer({
    required this.currentIndex,
    required this.children,
    super.key,
  });

  final int currentIndex;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
        return FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      child: KeyedSubtree(
        key: ValueKey(currentIndex),
        child: children[currentIndex],
      ),
    );
  }
}
