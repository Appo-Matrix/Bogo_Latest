import 'package:bogo_latest/features/dashboard/item_detail/widgets/offer_card.dart' show OfferCard;
import 'package:flutter/material.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OfferCard(offerText: "BUY 1\nget one", count: "x0", isActive: false, borderRadius: 35),
            OfferCard(offerText: "25%\ndiscount", count: "x3", isActive: true, borderRadius: 35),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text("Valid Till 31-12-2023", style: TextStyle(color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}
