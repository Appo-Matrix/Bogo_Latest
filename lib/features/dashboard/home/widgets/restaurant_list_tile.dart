import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';

class RestaurantListTile extends StatefulWidget {
  final String imageAsset;
  final String title;
  final String distance;
  final String country;
  final String rating;
  final String ratingCount;
  final String xp;
  final bool initiallyFavorited;
  final bool showClosedOverlay;

  const RestaurantListTile({
    super.key,
    required this.imageAsset,
    this.title = "Store Name",
    this.distance = "5.2KM",
    this.country = "Afghanistan",
    this.rating = "4.2",
    this.ratingCount = "55",
    this.xp = "300",
    this.initiallyFavorited = false,
    this.showClosedOverlay = false,
  });

  @override
  State<RestaurantListTile> createState() => _RestaurantListTileState();
}

class _RestaurantListTileState extends State<RestaurantListTile> {
  bool _fav = false;

  @override
  void initState() {
    super.initState();
    _fav = widget.initiallyFavorited;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Stack(
              children: [
                Image.asset(
                  widget.imageAsset,
                  width: 108,
                  height: 108,
                  fit: BoxFit.cover,
                ),
                if (widget.showClosedOverlay)
                  Container(
                    width: 108,
                    height: 108,
                    color: Colors.black.withOpacity(0.45),
                    alignment: Alignment.center,
                    child: Text(
                      "Close",
                      style: BAppStyles.poppins(
                        color: Colors.white,
                        fontSize: BSizes.fontSizeMd,
                        weight: FontWeight.w700,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 14),

          // Content + fav button
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + Favorite button
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: BAppStyles.poppins(
                            color: BAppColors.black1000,
                            fontSize: BSizes.lg,
                            weight: FontWeight.w700,
                          ),
                        ),
                      ),
                      InkResponse(
                        onTap: () => setState(() => _fav = !_fav),
                        radius: 24,
                        child: Icon(
                          _fav ? Icons.favorite : Icons.favorite_border,
                          size: 26,
                          color: BAppColors.black900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Location
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          size: 16, color: BAppColors.black700),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          "${widget.distance}  ${widget.country}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: BAppStyles.poppins(
                            color: BAppColors.black600,
                            fontSize: BSizes.iconSm,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Rating
                  Row(
                    children: [
                      Icon(Icons.star_rounded,
                          size: 16, color: BAppColors.black700),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          "${widget.rating} (${widget.ratingCount})",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: BAppStyles.poppins(
                            color: BAppColors.black700,
                            fontSize: BSizes.iconSm,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // XP chip
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: BAppColors.yellow900,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x22000000),
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.emoji_events_rounded,
                              size: 16, color: BAppColors.white),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              "${widget.xp} XP",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: BAppStyles.poppins(
                                color: BAppColors.white,
                                fontSize: BSizes.fontSizeSm,
                                weight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
