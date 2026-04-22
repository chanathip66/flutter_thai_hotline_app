import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/hotlines.dart';
import '../widgets/hotline_tile.dart';
import '../widgets/promo_banner.dart';
import 'about_ui.dart';
import 'sub_a_home_ui.dart';
import 'sub_b_home_ui.dart';
import 'sub_c_home_ui.dart';
import 'sub_d_home_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _index = 0;
  final _searchCtrl = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  bool get _isSearching => _searchQuery.isNotEmpty;

  List<HotlineItem> get _searchResults {
    final q = _searchQuery.toLowerCase();
    final qDigits = q.replaceAll(RegExp(r'[^0-9]'), '');
    return allHotlines.where((h) {
      final matchesText = h.title.toLowerCase().contains(q) ||
          (h.subtitle?.toLowerCase().contains(q) ?? false) ||
          h.category.toLowerCase().contains(q);
      final matchesPhone = qDigits.isNotEmpty &&
          h.phone.replaceAll(RegExp(r'[^0-9]'), '').contains(qDigits);
      return matchesText || matchesPhone;
    }).toList();
  }

  final _pages = const <Widget>[
    SubAHomeUI(),
    SubBHomeUI(),
    SubCHomeUI(),
    SubDHomeUI(),
  ];

  String get _title {
    return switch (_index) {
      0 => 'สายด่วนเหตุฉุกเฉิน',
      1 => 'สายด่วนการเดินทาง',
      2 => 'สายด่วนธนาคาร',
      _ => 'สายด่วนสาธารณูปโภค',
    };
  }

  String get _subtitle {
    return switch (_index) {
      0 => 'โทรได้ทันที ตลอด 24 ชั่วโมง',
      1 => 'เดินทางปลอดภัย แจ้งเหตุได้เลย',
      2 => 'อายัดบัตร-แจ้งปัญหาธุรกรรม',
      _ => 'ไฟฟ้า น้ำประปา แก๊ส',
    };
  }

  IconData get _categoryIcon {
    return switch (_index) {
      0 => Icons.local_fire_department_rounded,
      1 => Icons.directions_bus_rounded,
      2 => Icons.account_balance_rounded,
      _ => Icons.electrical_services_rounded,
    };
  }

  Future<void> _callNumber(String phone) async {
    final uri = Uri(scheme: 'tel', path: phone);
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ไม่สามารถโทรออกได้')),
      );
    }
  }

  void _showQuickCallSheet() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final theme = Theme.of(context);

        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          padding: const EdgeInsets.fromLTRB(0, 14, 0, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E6DA),
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'โทรด่วนยอดนิยม',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF1A2210),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'เลือกเบอร์ที่ต้องการโทรได้ทันที',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF7A8370),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _quickCallTile(
                title: 'ตำรวจ',
                subtitle: 'แจ้งเหตุด่วนเหตุร้าย',
                phone: '191',
                icon: Icons.local_police_outlined,
              ),
              const Divider(height: 1, thickness: 1, color: Color(0xFFF0F2EB), indent: 78, endIndent: 20),
              _quickCallTile(
                title: 'แพทย์ฉุกเฉิน',
                subtitle: 'กู้ชีพฉุกเฉิน',
                phone: '1669',
                icon: Icons.medical_services_outlined,
              ),
              const Divider(height: 1, thickness: 1, color: Color(0xFFF0F2EB), indent: 78, endIndent: 20),
              _quickCallTile(
                title: 'ดับเพลิง',
                subtitle: 'เหตุเพลิงไหม้',
                phone: '199',
                icon: Icons.local_fire_department_outlined,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _quickCallTile({
    required String title,
    required String subtitle,
    required String phone,
    required IconData icon,
  }) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        _callNumber(phone);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF0F7E0),
              ),
              alignment: Alignment.center,
              child: Icon(
                icon,
                color: const Color(0xFF4F7A1F),
                size: 22,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1A2210),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$subtitle • $phone',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF8A9281),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF4F7A1F),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.call_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int itemIndex,
  }) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final selected = _index == itemIndex;
    final itemColor = selected ? cs.primary : const Color(0xFF7B8472);

    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => setState(() => _index = itemIndex),
        child: SizedBox(
          height: 74,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedScale(
                duration: const Duration(milliseconds: 180),
                scale: selected ? 1 : 0.94,
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Icon(icon, color: itemColor, size: 27),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: itemColor,
                  fontSize: 12,
                  fontWeight: selected ? FontWeight.w800 : FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCenterNavItem() {
    final theme = Theme.of(context);

    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: _showQuickCallSheet,
        child: SizedBox(
          height: 80,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: -8,
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFE7FF99),
                        Color(0xFFB7F200),
                      ],
                    ),
                    border: Border.all(color: Colors.white, width: 6),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x18000000),
                        blurRadius: 16,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.phone_in_talk_rounded,
                    color: Color(0xFF314400),
                    size: 27,
                  ),
                ),
              ),
              Positioned(
                bottom: 6,
                child: Text(
                  'โทรด่วน',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: const Color(0xFF58614E),
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    final results = _searchResults;
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
      padding: const EdgeInsets.only(top: 10, bottom: 16),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/icon/logothai.png',
          height: 32,
          fit: BoxFit.contain,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Tooltip(
              message: 'โปรไฟล์',
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const AboutUI()),
                  );
                },
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFEFF6DD),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Center(
                      child: Text(
                        'ชจ',
                        style: TextStyle(
                          color: Color(0xFF4F7A1F),
                          fontWeight: FontWeight.w800,
                          fontSize: 13,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF4FBE8),
              Color(0xFFF9FCF4),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE4ECD2)),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search_rounded,
                      color: Color(0xFF8A9281),
                      size: 22,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _searchCtrl,
                        onChanged: (v) => setState(() => _searchQuery = v.trim()),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF1A2210),
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 14),
                          hintText: 'ค้นหาเบอร์ ชื่อหน่วยงาน หรือหมวด',
                          hintStyle: theme.textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFF8A9281),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    if (_isSearching)
                      IconButton(
                        tooltip: 'ล้าง',
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          _searchCtrl.clear();
                          setState(() => _searchQuery = '');
                          FocusScope.of(context).unfocus();
                        },
                        icon: const Icon(
                          Icons.cancel_rounded,
                          color: Color(0xFFB0B8A5),
                          size: 20,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            if (!_isSearching)
              Padding(
              padding: const EdgeInsets.fromLTRB(20, 6, 20, 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD6EFA8),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            'สายด่วน',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: const Color(0xFF3A5C0A),
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          _title,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF1A2210),
                            height: 1.15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _subtitle,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFF7A8370),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Icon(
                    _categoryIcon,
                    size: 56,
                    color: const Color(0xFF3A5C0A).withValues(alpha: 0.12),
                  ),
                ],
              ),
            ),
            if (!_isSearching) const PromoBanner(),
            Expanded(
              child: _isSearching
                  ? _buildSearchResults()
                  : _pages[_index],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 94 + bottomInset,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Positioned.fill(
              child: Container(
                padding: EdgeInsets.only(bottom: bottomInset),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    _buildNavItem(
                      icon: Icons.local_police_outlined,
                      label: 'ฉุกเฉิน',
                      itemIndex: 0,
                    ),
                    _buildNavItem(
                      icon: Icons.directions_bus_outlined,
                      label: 'การเดินทาง',
                      itemIndex: 1,
                    ),
                    _buildCenterNavItem(),
                    _buildNavItem(
                      icon: Icons.account_balance_outlined,
                      label: 'ธนาคาร',
                      itemIndex: 2,
                    ),
                    _buildNavItem(
                      icon: Icons.electrical_services_outlined,
                      label: 'สาธารณูปโภค',
                      itemIndex: 3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

