import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui2/core/themes/theme.dart';

class InfoTrailing extends StatelessWidget {
  const InfoTrailing({
    required this.isUpdate,
    required this.text,
    super.key,
  });

  final bool isUpdate;
  final String text;

  @override
  Widget build(BuildContext context) {
    final IconData icon;
    final Color color;

    if (isUpdate) {
      icon = Icons.arrow_circle_up_rounded;
      color = Theme.of(context).colorScheme.error;
    } else {
      icon = Icons.check_circle_outline_rounded;
      color =
          Theme.of(context).extension<AppColors>()?.queryBlue ?? Colors.blue;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
