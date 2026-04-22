import 'package:flutter/material.dart';

import '../data/hotlines.dart';
import '../widgets/hotline_tile.dart';

class SubBHomeUI extends StatelessWidget {
  const SubBHomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    final items =
        allHotlines.where((h) => h.category == 'การเดินทาง').toList();
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10, bottom: 16),
      itemCount: items.length,
      itemBuilder: (_, i) {
        final h = items[i];
        return HotlineTile(
          title: h.title,
          subtitle: h.subtitle,
          phone: h.phone,
          leadingIcon: h.leadingIcon,
          leadingAsset: h.leadingAsset,
        );
      },
    );
  }
}

