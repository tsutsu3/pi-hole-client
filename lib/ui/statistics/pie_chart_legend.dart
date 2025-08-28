import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/utils/conversions.dart';

class PieChartLegend extends StatelessWidget {
  const PieChartLegend({
    required this.data,
    super.key,
    this.dataUnit,
    this.onValueTap,
  });

  final Map<String, dynamic> data;
  final String? dataUnit;
  final void Function(String)? onValueTap;

  @override
  Widget build(BuildContext context) {
    final defaultColors = Theme.of(context).extension<GraphColors>()!.colors;
    final greyColor = Theme.of(
      context,
    ).extension<AppColors>()!.commonLightGrey!;

    final colorList = <Color>[];
    var colorIndex = 0;
    for (final key in data.keys) {
      if (key.toLowerCase() == 'empty') {
        colorList.add(greyColor);
      } else {
        colorList.add(defaultColors[colorIndex % defaultColors.length]);
        colorIndex++;
      }
    }

    List<Widget> generateLegendList(Map<String, dynamic> data) {
      final items = <Widget>[];
      var index = 0;
      data.forEach((key, value) {
        items.add(
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onValueTap != null ? () => onValueTap!(key) : null,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: colorList[index],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              key,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 65,
                      child: Text(
                        dataUnit == '%'
                            ? '${formatPercentage(value, Platform.localeName)} %'
                            : '$value${dataUnit != null ? ' $dataUnit' : ''}',
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        index++;
      });
      return items;
    }

    return Column(children: generateLegendList(data));
  }
}
