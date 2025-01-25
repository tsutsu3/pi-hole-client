import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/responsive.dart';

/// Displays a status metric in a responsive tile.
///
/// `HomeTileItem` is used to show key statistics such as total queries,
/// blocked queries, or percentage blocked in the Pi-hole dashboard.
///
/// ## Parameters
/// - `icon`: The icon to display in the card.
/// - `iconColor`: The color of the icon.
/// - `color`: The color of the card.
/// - `label`: The label to display in the card.
/// - `value`: The value to display in the card.
/// - `width`: The width of the card.
class HomeTileItem extends StatelessWidget {
  const HomeTileItem({
    required this.icon,
    required this.iconColor,
    required this.color,
    required this.label,
    required this.value,
    required this.width,
    super.key,
  });

  final IconData icon;
  final Color iconColor;
  final Color color;
  final String label;
  final String value;
  final double width;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: width > ResponsiveConstants.medium ? 0.25 : 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: HomeTile(
          icon: icon,
          iconColor: iconColor,
          color: color,
          label: label,
          value: value,
        ),
      ),
    );
  }
}

class HomeTile extends StatelessWidget {
  const HomeTile({
    required this.icon,
    required this.iconColor,
    required this.color,
    required this.label,
    required this.value,
    super.key,
  });

  final IconData icon;
  final Color iconColor;
  final Color color;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Stack(
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 65,
                  color: iconColor,
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: Text(
                          label,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                        value,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
