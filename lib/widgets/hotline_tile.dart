import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HotlineTile extends StatefulWidget {
  const HotlineTile({
    super.key,
    required this.title,
    required this.phone,
    this.subtitle,
    this.leadingIcon,
    this.leadingAsset,
  });

  final String title;
  final String? subtitle;
  final String phone;
  final IconData? leadingIcon;
  final String? leadingAsset;

  @override
  State<HotlineTile> createState() => _HotlineTileState();
}

class _HotlineTileState extends State<HotlineTile> {
  bool _busy = false;

  Future<void> _call() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      final uri = Uri(scheme: 'tel', path: widget.phone);
      final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!ok && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ไม่สามารถโทรออกได้')),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('เกิดข้อผิดพลาดขณะโทร')),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: _busy ? null : _call,
          child: Container(
            padding: const EdgeInsets.fromLTRB(14, 14, 12, 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFEAEFE0)),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 44,
                  height: 44,
                  child: widget.leadingAsset != null
                      ? Image.asset(
                          widget.leadingAsset!,
                          fit: BoxFit.contain,
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF6DD),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            widget.leadingIcon ?? Icons.phone_in_talk_outlined,
                            color: const Color(0xFF4F7A1F),
                            size: 22,
                          ),
                        ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          color: const Color(0xFF21271B),
                          fontSize: 15,
                        ),
                      ),
                      if (widget.subtitle != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          widget.subtitle!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFF8C9481),
                            fontSize: 12.5,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.phone,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF1F2519),
                    fontSize: 16,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(width: 10),
                _CallActionButton(busy: _busy, onTap: _busy ? null : _call),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CallActionButton extends StatelessWidget {
  const _CallActionButton({required this.busy, required this.onTap});

  final bool busy;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: const Color(0xFFC8D3B2)),
          ),
          child: busy
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF4F7A1F),
                    ),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.call_rounded,
                      color: Color(0xFF4F7A1F),
                      size: 14,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'โทรออก',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: const Color(0xFF4F7A1F),
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

