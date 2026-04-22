import 'package:flutter/material.dart';

import '../data/hotlines.dart';
import 'hotline_tile.dart';

class HotlineSearchDelegate extends SearchDelegate<void> {
  HotlineSearchDelegate()
      : super(
          searchFieldLabel: 'ค้นหาเบอร์ ชื่อหน่วยงาน หรือหมวด',
          keyboardType: TextInputType.text,
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    final base = Theme.of(context);
    return base.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1A2210)),
        titleTextStyle: base.textTheme.titleMedium?.copyWith(
          color: const Color(0xFF1A2210),
          fontWeight: FontWeight.w700,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Color(0xFF9AA393),
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: base.textTheme.copyWith(
        titleLarge: base.textTheme.titleLarge?.copyWith(
          color: const Color(0xFF1A2210),
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    if (query.isEmpty) return null;
    return [
      IconButton(
        tooltip: 'ล้าง',
        icon: const Icon(Icons.clear_rounded),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'กลับ',
      icon: const Icon(Icons.arrow_back_rounded),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) => _buildList(context);

  @override
  Widget buildSuggestions(BuildContext context) => _buildList(context);

  Widget _buildList(BuildContext context) {
    final q = query.trim().toLowerCase();
    final qDigits = q.replaceAll(RegExp(r'[^0-9]'), '');

    final results = q.isEmpty
        ? allHotlines
        : allHotlines.where((h) {
            final matchesText = h.title.toLowerCase().contains(q) ||
                (h.subtitle?.toLowerCase().contains(q) ?? false) ||
                h.category.toLowerCase().contains(q);
            final matchesPhone = qDigits.isNotEmpty &&
                h.phone.replaceAll(RegExp(r'[^0-9]'), '').contains(qDigits);
            return matchesText || matchesPhone;
          }).toList();

    if (results.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.search_off_rounded,
              size: 56,
              color: Color(0xFFC0CAB2),
            ),
            const SizedBox(height: 12),
            Text(
              'ไม่พบผลการค้นหา',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF6B7462),
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 4),
            const Text(
              'ลองพิมพ์ชื่อหน่วยงานหรือเบอร์อีกครั้ง',
              style: TextStyle(color: Color(0xFF9AA393)),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: results.length,
      itemBuilder: (_, i) {
        final h = results[i];
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
