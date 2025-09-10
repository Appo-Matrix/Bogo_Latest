import 'package:flutter/material.dart';

// ====== your custom themes ======
import '../../../../core/utils/constants/app_colors.dart';   // BAppColors
import '../../../../core/utils/constants/app_sizes.dart';    // BSizes
import '../../../../core/utils/constants/app_styles.dart';   // BAppStyles

class BogoStoreCard extends StatefulWidget {
  final List<String> images; // swipeable images
  final String storeName;
  final String distance;
  final String location;
  final bool initiallyFavorited;

  const BogoStoreCard({
    super.key,
    required this.images,
    this.storeName = "Store Name",
    this.distance = "5.2KM",
    this.location = "Afghanistan",
    this.initiallyFavorited = false,
  });

  @override
  State<BogoStoreCard> createState() => _BogoStoreCardState();
}

class _BogoStoreCardState extends State<BogoStoreCard> {
  late final PageController _pc;
  int _page = 0;
  bool _fav = false;

  @override
  void initState() {
    super.initState();
    _fav = widget.initiallyFavorited;
    _pc = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(BSizes.cardRadiusLg),
      child: Container(
        height: 177,
        width: double.infinity,
        color: Colors.black,
        child: Stack(
          children: [
            // images swipe (full expand)
            SizedBox.expand(
              child: PageView.builder(
                controller: _pc,
                physics: const BouncingScrollPhysics(),
                itemCount: widget.images.length,
                onPageChanged: (i) => setState(() => _page = i),
                itemBuilder: (_, i) => Image.asset(
                  widget.images[i],
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // bottom gradient
            Positioned.fill(
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

            // favorite toggle
            Positioned(
              top: 12,
              right: 12,
              child: InkWell(
                onTap: () => setState(() => _fav = !_fav),
                customBorder: const CircleBorder(),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: 44,
                  height: 44,
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
                      size: 22,
                    ),
                  ),
                ),
              ),
            ),

            // store info bottom-left
            Positioned(
              left: 16,
              bottom: 18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.storeName,
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
                          color: Colors.white, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        "${widget.distance} ${widget.location}",
                        style: BAppStyles.poppins(
                          fontSize: BSizes.fontSizeMd,
                          weight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // indicator dots bottom-right
            Positioned(
              right: 16,
              bottom: 20,
              child: Row(
                children: List.generate(widget.images.length, (i) {
                  final bool active = i == _page;
                  return Container(
                    width: active ? 12 : 8,
                    height: 8,
                    margin: const EdgeInsets.only(left: 4),
                    decoration: BoxDecoration(
                      color: active ? BAppColors.main : BAppColors.black300,
                      borderRadius: BorderRadius.circular(4),
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
