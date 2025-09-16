import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:bogo_latest/features/dashboard/item_detail/widgets/review_tile.dart';
import 'package:flutter/material.dart';

class ReviewsSection extends StatefulWidget {
  const ReviewsSection({super.key});

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  int _selectedRating = 0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title Row
         Row(
          children: [
            Icon(Icons.star_rate_rounded, color: Colors.black, size: 20),
            SizedBox(width: 6),
            Text(
              "Reviews",
              style: BAppStyles.poppins(fontSize: 14, color: Colors.black54, weight: FontWeight.w600),
            ),
          ],
        ),


        /// Rating Stars Row
        Row(
          children: List.generate(5, (index) {
            final starIndex = index + 1;
            return GestureDetector(
              onTap: () {
                setState(() => _selectedRating = starIndex);
              },
              child: Icon(
                Icons.star,
                size: 24,
                color: _selectedRating >= starIndex ? Colors.amber : Colors.grey.shade300,
              ),
            );
          }),
        ),

        const SizedBox(height: 16),

        /// Input Field with Send Button
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child:TextField(
                  controller: _reviewController,
                  maxLines: 1, // 👈 max 2 lines
                  style: const TextStyle(color: Colors.black), // 👈 typed text black
                  decoration: InputDecoration(
                    hintText: "Share your thoughts",
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.transparent), // 👈 black when focused
                    ),
                  ),
                )


              ),
              InkWell(
                onTap: () {
                  if (_reviewController.text.isNotEmpty && _selectedRating > 0) {
                    debugPrint("Rating: $_selectedRating");
                    debugPrint("Review: ${_reviewController.text}");
                    _reviewController.clear();
                    setState(() => _selectedRating = 0);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20), // 👈 custom border radius
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Icon(Icons.send_rounded, color: Colors.black),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        /// Reviews List
        const ReviewTile(
          name: "Tania Wyman",
          comment:
          "I bought it 3 weeks ago and now come back just to say “Awesome” I really enjoy it.",
          imagePath: BImages.profile,
        ),
        const SizedBox(height: 20),
        const ReviewTile(
          name: "Tania Wyman",
          comment: "Great product. Love it!",
          imagePath: BImages.profile,
        ),
      ],
    );
  }
}
