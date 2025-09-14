import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/app_styles.dart';

class BogoStoreCard extends StatefulWidget {
  final List<String> images;
  final String storeName;
  final String distance;
  final String location;
  final bool initiallyFavorited;
  final bool useNetworkImages;

  const BogoStoreCard({
    super.key,
    required this.images,
    this.storeName = 'Store Name',
    this.distance = '5.2KM',
    this.location = 'Afghanistan',
    this.initiallyFavorited = false,
    this.useNetworkImages = false,
  }) : assert(images.length >= 1, 'images cannot be empty');

  @override
  State<BogoStoreCard> createState() => _BogoStoreCardState();
}

class _BogoStoreCardState extends State<BogoStoreCard> {
  late final PageController _pc;
  int _page = 0;
  late bool _fav;

  @override
  void initState() {
    super.initState();
    _fav = widget.initiallyFavorited;
    _pc = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final screenHeight = MediaQuery.of(context).size.height;

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        height: screenHeight * 0.22, // responsive height (22% of screen)
        width: double.infinity,
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: PageView.builder(
                controller: _pc,
                reverse: isRtl,
                physics: const BouncingScrollPhysics(),
                itemCount: widget.images.length,
                onPageChanged: (i) => setState(() => _page = i),
                itemBuilder: (_, i) {
                  final path = widget.images[i];
                  return widget.useNetworkImages
                      ? Image.network(path, fit: BoxFit.cover)
                      : Image.asset(path, fit: BoxFit.cover);
                },
              ),
            ),
            Positioned.fill(
              child: IgnorePointer(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color(0xAA000000), Colors.transparent],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: InkWell(
                onTap: () => setState(() => _fav = !_fav),
                customBorder: const CircleBorder(),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 180),
                    transitionBuilder: (c, a) =>
                        ScaleTransition(scale: a, child: c),
                    child: Icon(
                      _fav ? Icons.favorite : Icons.favorite_border,
                      key: ValueKey(_fav),
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 18,
              right: 60, // prevent text overflow under indicators
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.storeName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: BAppStyles.poppins(
                      fontSize: BSizes.fontSizeLg,
                      weight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: Colors.white, size: 16),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          '${widget.distance} ${widget.location}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: BAppStyles.poppins(
                            fontSize: BSizes.fontSizeSm,
                            weight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 16,
              bottom: 20,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(widget.images.length, (i) {
                  final bool isActive = i == _page;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOut,
                    width: isActive ? 6 : 16,
                    height: 6,
                    margin: EdgeInsets.only(left: i == 0 ? 0 : 2),
                    decoration: BoxDecoration(
                      color: isActive
                          ? BAppColors.main
                          : BAppColors.black300.withOpacity(0.65),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
