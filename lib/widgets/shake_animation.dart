// Taken from: https://stackoverflow.com/a/59124572

import 'package:flutter/material.dart';

class ShakeAnimation extends StatefulWidget {
  const ShakeAnimation({required this.child, super.key});

  final Widget child;

  @override
  State<ShakeAnimation> createState() => ShakeAnimationState();
}

class ShakeAnimationState extends State<ShakeAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    super.initState();
  }

  void shake() {
    controller!.forward(from: 0.0);
  }

  void stop() {
    controller!.stop();
  }

  @override
  Widget build(BuildContext context) {
    final offsetAnimation = Tween(begin: 0.0, end: 40.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(controller!)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller!.reverse();
        }
      });

    return AnimatedBuilder(
      animation: offsetAnimation,
      child: widget.child,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.only(
            left: offsetAnimation.value + 50.0,
            right: 50.0 - offsetAnimation.value,
          ),
          child: child,
        );
      },
    );
  }
}
