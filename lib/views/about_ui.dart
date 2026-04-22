import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUI extends StatelessWidget {
  const AboutUI({super.key});

  static const _accent = Color(0xFF4F7A1F);
  static const _ink = Color(0xFF1F2519);
  static const _inkMuted = Color(0xFF7B8472);
  static const _divider = Color(0xFFEDEFE6);
  static const _surface = Colors.white;

  static const _studentId = '6852D10005';
  static const _fullName = 'ชนาธิป จุ้ยเจิม';
  static const _email = 's6852d10005@sau.ac.th';
  static const _faculty = 'ศิลปศาสตร์และวิทยาศาสตร์';
  static const _university = 'มหาวิทยาลัยเอเชียอาคเนย์';
  static const _universityEn = 'Southeast Asia University';
  static const _profileImageAsset = 'assets/images/profile.jpg';
  static const _universityLogoAsset = 'assets/icon/asiaicon.png';

  String get _initials {
    final parts = _fullName.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.characters.first;
    return parts.first.characters.first + parts.last.characters.first;
  }

  Future<void> _copy(BuildContext context, String text, String label) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('คัดลอก$labelแล้ว'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _sendEmail(String address) async {
    await launchUrl(Uri(scheme: 'mailto', path: address));
  }

  Widget _buildProfileAvatar(ThemeData theme) {
    return Container(
      width: 64,
      height: 64,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFEFF6DD),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        _profileImageAsset,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return Center(
            child: Text(
              _initials,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
                color: _accent,
                fontSize: 22,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: _surface,
      appBar: AppBar(
        backgroundColor: _surface,
        surfaceTintColor: _surface,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back, color: _ink),
        ),
        title: Text(
          'โปรไฟล์',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: _ink,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(theme),
                const SizedBox(height: 8),
                _sectionLabel(theme, 'ข้อมูลนักศึกษา'),
                _buildCard(children: [
                  _row(
                    context: context,
                    label: 'รหัสนักศึกษา',
                    value: _studentId,
                    trailingIcon: Icons.copy_rounded,
                    onTap: () => _copy(context, _studentId, 'รหัสนักศึกษา'),
                  ),
                  const _Divider(),
                  _row(
                    context: context,
                    label: 'อีเมล',
                    value: _email,
                    trailingIcon: Icons.chevron_right_rounded,
                    onTap: () => _sendEmail(_email),
                  ),
                  const _Divider(),
                  _row(
                    context: context,
                    label: 'คณะ/สาขาวิชา',
                    value: _faculty,
                  ),
                ]),
                const SizedBox(height: 16),
                _sectionLabel(theme, 'เกี่ยวกับแอป'),
                _buildCard(children: [
                  _row(
                    context: context,
                    label: 'เวอร์ชัน',
                    value: '1.0.0',
                  ),
                  const _Divider(),
                  _row(
                    context: context,
                    label: 'พัฒนาโดย',
                    value: 'Chanathip',
                  ),
                ]),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: Column(
        children: [
          Row(
            children: [
              _buildProfileAvatar(theme),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _fullName,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: _ink,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'นักศึกษา',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: _inkMuted,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAF4),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: _divider),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE8ECDD)),
                  ),
                  padding: const EdgeInsets.all(6),
                  child: Image.asset(
                    _universityLogoAsset,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.school_outlined,
                      color: _accent,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'สถานศึกษา',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: _inkMuted,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _university,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: _ink,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _universityEn,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: _inkMuted,
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

  Widget _sectionLabel(ThemeData theme, String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Text(
        text,
        style: theme.textTheme.labelMedium?.copyWith(
          color: _inkMuted,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
        ),
      ),
    );
  }

  Widget _buildCard({required List<Widget> children}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: _surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _divider),
      ),
      child: Column(children: children),
    );
  }

  Widget _row({
    required BuildContext context,
    required String label,
    required String value,
    IconData? trailingIcon,
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);
    final content = Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: _inkMuted,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              value,
              textAlign: TextAlign.right,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: _ink,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (trailingIcon != null) ...[
            const SizedBox(width: 8),
            Icon(trailingIcon, size: 18, color: _inkMuted),
          ],
        ],
      ),
    );

    if (onTap == null) return content;
    return InkWell(
      onTap: onTap,
      child: content,
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16),
      child: Divider(height: 1, thickness: 1, color: Color(0xFFF1F3EB)),
    );
  }
}

