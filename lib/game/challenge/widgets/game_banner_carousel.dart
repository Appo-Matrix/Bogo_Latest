import 'package:flutter/material.dart';

class GameBannerCarousel extends StatefulWidget {
  final List<String> imageAssets;
  final double height;
  final double width;
  final BorderRadiusGeometry borderRadius;
  final ValueChanged<int>? onIndexChanged;

  const GameBannerCarousel({
    super.key,
    required this.imageAssets,
    this.height = 392,
    this.width  = 361,
    this.borderRadius = const BorderRadius.all(Radius.circular(35)),
    this.onIndexChanged,
  });

  @override
  State<GameBannerCarousel> createState() => _GameBannerCarouselState();
}

class _GameBannerCarouselState extends State<GameBannerCarousel> {
  late final PageController _ctrl;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _ctrl = PageController(initialPage: 0, viewportFraction: 1.0);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = widget.width;
    final h = widget.height;
    final len = widget.imageAssets.length;

    String? prevImg() => (_index - 1 >= 0) ? widget.imageAssets[_index - 1] : null;
    String? nextImg() => (_index + 1 < len) ? widget.imageAssets[_index + 1] : null;

    return SizedBox(
      width: w,
      height: h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ---- BACK PREVIEW: previous (smaller, higher) ----
          if (prevImg() != null)
            _BackPreview(
              img: prevImg()!,
              width: w * .86,
              height: h * .86,
              dy: -24,
              radius: widget.borderRadius,
            ),

          // ---- BACK PREVIEW: next (middle size) ----
          if (nextImg() != null)
            _BackPreview(
              img: nextImg()!,
              width: w * .93,
              height: h * .93,
              dy: -12,
              radius: widget.borderRadius,
            ),

          // ---- FOREGROUND: swipeable current card (NO LOOP) ----
          ClipRRect(
            borderRadius: widget.borderRadius,
            child: SizedBox(
              width: w,
              height: h,
              child: PageView.builder(
                controller: _ctrl,
                itemCount: len,                  // <- no infinite
                physics: const PageScrollPhysics(), // edges pe ruk jayega
                onPageChanged: (i) {
                  setState(() => _index = i);
                  widget.onIndexChanged?.call(i);
                },
                itemBuilder: (_, i) => Image.asset(
                  widget.imageAssets[i],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackPreview extends StatelessWidget {
  final String img;
  final double width;
  final double height;
  final double dy;
  final BorderRadiusGeometry radius;

  const _BackPreview({
    required this.img,
    required this.width,
    required this.height,
    required this.dy,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: dy,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.topCenter,
        child: ClipRRect(
          borderRadius: radius,
          child: Opacity( // thoda depth feel
            opacity: 0.95,
            child: Image.asset(
              img,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
