import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';
import '../../constants/app_styles.dart';

// Navigation bar item model
class BogoNavItem {
  final String asset;
  final String? selectedAsset;
  final String label;

  const BogoNavItem({
    required this.asset,
    this.selectedAsset,
    required this.label,
  });
}

class BogoBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;
  final List<BogoNavItem> items;

  // Layout & style properties
  final double barHeight;
  final double? barWidth;
  final double cornerRadius;
  final double indicatorDiameter;
  final double indicatorOverlap;
  final double notchRadiusExtra;
  final double topGap;

  // Colors
  final Color barColor;
  final Color indicatorColor;
  final Color selectedColor;
  final Color unselectedColor;

  const BogoBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
    required this.items,
    this.barHeight = 92,
    this.barWidth = 394,
    this.cornerRadius = 46,
    this.indicatorDiameter = 60,
    this.indicatorOverlap = 26,
    this.notchRadiusExtra = 8,
    this.topGap = 22,
    this.barColor = BAppColors.black1000,
    this.indicatorColor = BAppColors.primary,
    this.selectedColor = BAppColors.white,
    this.unselectedColor = BAppColors.lightGray400,
  }) : assert(items.length >= 2);

  @override
  Widget build(BuildContext context) {
    final double r = indicatorDiameter / 2;
    final double indicatorTop = topGap - (indicatorDiameter - indicatorOverlap);
    final double notchR = r + notchRadiusExtra;

    return SafeArea(
      top: false,
      child: SizedBox(
        height: barHeight + topGap + 8,
        child: Center(
          child: SizedBox(
            width: barWidth,
            child: LayoutBuilder(
              builder: (context, c) {
                final double w = c.maxWidth;
                final int count = items.length;
                final double step = w / count;
                final double targetCenterX = (currentIndex + 0.5) * step;

                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Background with notch
                    Positioned.fill(
                      top: topGap,
                      child: TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 260),
                        curve: Curves.easeInOut,
                        tween: Tween<double>(
                          begin: 0.5 * step,
                          end: targetCenterX,
                        ),
                        builder: (context, notchCenterX, _) {
                          return CustomPaint(
                            painter: _BogoBarPainter(
                              barColor: barColor,
                              borderRadius: cornerRadius,
                              notchCenterX: notchCenterX,
                              notchRadius: notchR,
                            ),
                          );
                        },
                      ),
                    ),

                    // // Shadow under indicator
                    // AnimatedPositioned(
                    //   duration: const Duration(milliseconds: 260),
                    //   curve: Curves.easeInOut,
                    //   top: indicatorTop + r + 6,
                    //   left: targetCenterX - r,
                    //   child: IgnorePointer(
                    //     child: Container(
                    //       width: indicatorDiameter,
                    //       height: r * 0.6,
                    //       decoration: const BoxDecoration(
                    //         color: Color(0x33000000),
                    //         borderRadius: BorderRadius.all(
                    //           Radius.elliptical(56, 18),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    // Floating indicator with selected icon
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 260),
                      curve: Curves.easeInOut,
                      top: indicatorTop,
                      left: targetCenterX - r,
                      child: Container(
                        width: indicatorDiameter,
                        height: indicatorDiameter,
                        decoration: BoxDecoration(
                          color: indicatorColor,
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 12,
                              offset: Offset(0, 6),
                              color: Color(0x33000000),
                            ),
                          ],
                        ),
                        child: Center(
                          child: _SelectedPngIcon(
                            item: items[currentIndex],
                            size: BSizes.iconMd,
                            fallbackColor: BAppColors.white,
                          ),
                        ),
                      ),
                    ),

                    // Row of nav items
                    Positioned.fill(
                      top: topGap,
                      child: Row(
                        children: List.generate(count, (i) {
                          final bool selected = i == currentIndex;
                          return Expanded(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () => onItemSelected(i),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 180),
                                    switchInCurve: Curves.easeOut,
                                    switchOutCurve: Curves.easeIn,
                                    child: selected
                                        ? SizedBox(
                                            height: BSizes.iconMd,
                                            width: BSizes.iconMd,
                                          )
                                        : Image.asset(
                                            items[i].asset,
                                            width: BSizes.iconMd,
                                            height: BSizes.iconMd,
                                            gaplessPlayback: true,
                                            color: unselectedColor,
                                            colorBlendMode: BlendMode.srcIn,
                                          ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    items[i].label,
                                    style: selected
                                        ? BAppStyles.poppins(
                                            color: selectedColor,
                                            fontSize: BSizes.fontSizeMd,
                                            weight: FontWeight.bold,
                                          )
                                        : BAppStyles.poppins(
                                            color: unselectedColor,
                                            fontSize: BSizes.fontSizeMd,
                                            weight: FontWeight.w500,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// Selected icon inside the indicator
class _SelectedPngIcon extends StatelessWidget {
  final BogoNavItem item;
  final double size;
  final Color fallbackColor;

  const _SelectedPngIcon({
    required this.item,
    required this.size,
    required this.fallbackColor,
  });

  @override
  Widget build(BuildContext context) {
    if (item.selectedAsset != null) {
      return Image.asset(item.selectedAsset!, width: size, height: size);
    }
    return Image.asset(
      item.asset,
      width: size,
      height: size,
      color: fallbackColor,
      colorBlendMode: BlendMode.srcIn,
    );
  }
}

// Custom painter for nav bar background and notch
class _BogoBarPainter extends CustomPainter {
  final Color barColor;
  final double borderRadius;
  final double notchCenterX;
  final double notchRadius;

  _BogoBarPainter({
    required this.barColor,
    required this.borderRadius,
    required this.notchCenterX,
    required this.notchRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final RRect rrect = RRect.fromLTRBR(
      0,
      0,
      size.width,
      size.height,
      Radius.circular(borderRadius),
    );
    final Path bg = Path()..addRRect(rrect);

    final Path notch = Path()
      ..addOval(
        Rect.fromCircle(center: Offset(notchCenterX, 0), radius: notchRadius),
      );

    final Path finalPath = Path.combine(PathOperation.difference, bg, notch);

    final Paint p = Paint()..color = barColor;
    final Paint glow = Paint()
      ..shader = const RadialGradient(
        center: Alignment(-0.95, 0.6),
        radius: 0.9,
        colors: [Color(0x22FFFFFF), Color(0x00000000)],
      ).createShader(Offset.zero & size);

    canvas.drawPath(finalPath, p);
    canvas.drawPath(finalPath, glow);
  }

  @override
  bool shouldRepaint(covariant _BogoBarPainter old) =>
      notchCenterX != old.notchCenterX ||
      notchRadius != old.notchRadius ||
      barColor != old.barColor ||
      borderRadius != old.borderRadius;
}
