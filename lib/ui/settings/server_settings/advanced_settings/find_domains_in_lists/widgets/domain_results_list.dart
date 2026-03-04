import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/domains/widgets/domain_tile.dart';
import 'package:pi_hole_client/utils/conversions.dart';

class DomainResultsList extends StatelessWidget {
  const DomainResultsList({
    required this.results,
    required this.colors,
    required this.onTap,
    super.key,
  });

  final List<Domain> results;
  final AppColors? colors;
  final ValueChanged<Domain> onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: results.length,
      separatorBuilder: (_, _) => const SizedBox(height: 6),
      itemBuilder: (context, index) {
        final domain = results[index];
        if (colors == null) {
          return ListTile(
            leading: const Icon(Icons.domain_rounded),
            title: Text(domain.name),
            subtitle: Text(getDomainTypeLabel(domain.type, domain.kind)),
            onTap: () => onTap(domain),
          );
        }
        return DomainTile(
          domain: domain,
          colors: colors!,
          showDomainDetails: onTap,
        );
      },
    );
  }
}
