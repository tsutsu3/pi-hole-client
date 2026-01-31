import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PiholeIcon extends StatelessWidget {
  const PiholeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/resources/pihole.svg',
      colorFilter: ColorFilter.mode(
        Theme.of(context).colorScheme.onSurfaceVariant,
        BlendMode.srcIn,
      ),
      width: 24,
      height: 24,
    );
  }
}
