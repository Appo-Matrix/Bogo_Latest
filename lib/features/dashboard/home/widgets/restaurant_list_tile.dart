import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart'; // BAppColors
import '../../../../core/utils/constants/app_sizes.dart'; // BSizes
import '../../../../core/utils/constants/app_styles.dart'; // BAppStyles

class RestaurantListTile extends StatefulWidget {
  final String imageAsset;
  final String title;
  final String distance; // e.g., "5.2KM"
  final String country; // e.g., "Afghanistan"
  final String rating; // e.g., "4.2"
  final String ratingCount; // e.g., "55"
  final String xp; // e.g., "300"
  final bool initiallyFavorited;
  final bool showClosedOverlay; // optional “Close” on image

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
      padding: const EdgeInsets.symmetric(vertical: 10), // list breathing
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image thumb
          ClipRRect(
            borderRadius: BorderRadius.circular(35), // big round like mock
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

          // middle content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title
                  Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: BAppStyles.poppins(
                      color: BAppColors.black1000,
                      fontSize: BSizes.lg,
                      weight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // location row
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          size: 16, color: BAppColors.black700),
                      const SizedBox(width: 6),
                      Flexible(
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
                  const SizedBox(height: 6),

                  // rating row
                  Row(
                    children: [
                      Icon(Icons.star_rounded,
                          size: 16, color: BAppColors.black700),
                      const SizedBox(width: 6),
                      Text(
                        "${widget.rating} (${widget.ratingCount})",
                        style: BAppStyles.poppins(
                          color: BAppColors.black700,
                          fontSize: BSizes.iconSm,
                          weight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // XP chip
                  Container(
                    width: 91,
                    height: 26,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: BAppColors.yellow900, // warm yellow chip
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
                        // small icon (using emoji_events as generic XP/trophy)
                        Icon(Icons.emoji_events_rounded,
                            size: 16, color: BAppColors.white),
                        const SizedBox(width: 6),
                        Text(
                          "${widget.xp} XP",
                          style: BAppStyles.poppins(
                            color: BAppColors.white,
                            fontSize: BSizes.fontSizeSm,
                            weight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 10),

          // favorite icon on the right
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
    );
  }
}
