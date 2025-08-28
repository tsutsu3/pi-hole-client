import 'package:flutter/material.dart';

class CustomButtonListTile extends StatelessWidget {
  const CustomButtonListTile({
    required this.label,
    this.leadingIcon,
    this.color,
    this.onTap,
    this.padding,
    super.key,
  });

  final IconData? leadingIcon;
  final String label;
  final Color? color;
  final void Function()? onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Widget listTitle(String title, {Color? color}) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 16, color: color ?? colorScheme.onSurface),
        ),
      );
    }

    return ListTile(
      leading: leadingIcon != null
          ? CircleAvatar(
              radius: 12,
              backgroundColor: color ?? colorScheme.onSurface,
              child: Icon(
                size: 19,
                leadingIcon,
                color: Colors.white.withValues(alpha: 0.9),
              ),
            )
          : null,
      title: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: listTitle(label, color: color),
      ),
      onTap: onTap,
    );
  }
}
