import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CategoryBanner extends StatefulWidget {
  const CategoryBanner({
    super.key,
    required this.imageUrls,
    this.aspectRatio = 16 / 7,
  });

  final List<String> imageUrls;
  final double aspectRatio;

  @override
  State<CategoryBanner> createState() => _CategoryBannerState();
}

class _CategoryBannerState extends State<CategoryBanner> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final hasMultiple = widget.imageUrls.length > 1;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 4, 16, 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 16,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: hasMultiple
                ? CarouselSlider(
                    items: widget.imageUrls.map(_bannerImage).toList(),
                    options: CarouselOptions(
                      aspectRatio: widget.aspectRatio,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 4),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 700),
                      onPageChanged: (i, _) => setState(() => _current = i),
                    ),
                  )
                : Image.network(
                    widget.imageUrls.first,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return AspectRatio(
                        aspectRatio: widget.aspectRatio,
                        child: const ColoredBox(
                          color: Color(0xFFF0F5E4),
                          child: Center(
                            child: SizedBox(
                              width: 28,
                              height: 28,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.4,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => AspectRatio(
                      aspectRatio: widget.aspectRatio,
                      child: const ColoredBox(
                        color: Color(0xFFF0F5E4),
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            color: Color(0xFF9AA393),
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
        if (hasMultiple)
          Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.imageUrls.length, (i) {
                final active = i == _current;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: active ? 22 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: active
                        ? const Color(0xFF4F7A1F)
                        : const Color(0xFFCFD9BC),
                    borderRadius: BorderRadius.circular(3),
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }

  Widget _bannerImage(String url) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      width: double.infinity,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const ColoredBox(
          color: Color(0xFFF0F5E4),
          child: Center(
            child: SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(strokeWidth: 2.4),
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) => const ColoredBox(
        color: Color(0xFFF0F5E4),
        child: Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            color: Color(0xFF9AA393),
            size: 32,
          ),
        ),
      ),
    );
  }
}
