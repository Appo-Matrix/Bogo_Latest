import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

/// ---------------- Store Details Screen ----------------
class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({super.key});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  int _currentIndex = 0;
// use the new class in v5
  final CarouselSliderController _carouselController = CarouselSliderController();

  final List<String> _storeImages = [
    BImages.profile,
    BImages.profile,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// ---------------- APP BAR ----------------
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
          const SizedBox(width: 12),
        ],
      ),

      /// ---------------- BODY ----------------
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              /// -------- Store Background Slider --------
              _buildStoreSlider(),

              const SizedBox(height: 30),

              /// -------- Action Buttons --------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _ActionIcon(Icons.call, "Call"),
                  _ActionIcon(Icons.chat, "Chat"),
                  _ActionIcon(Icons.location_on, "Map"),
                  _ActionIcon(Icons.share, "Share"),
                ],
              ),

              const SizedBox(height: 20),

              /// -------- Information --------
              _buildInformation(),

              const SizedBox(height: 20),

              /// -------- Tags --------
              _buildTags(),

              const SizedBox(height: 20),

              /// -------- Offers --------
              _buildOffers(),

              const SizedBox(height: 20),

              /// -------- Map --------
              _buildMap(),

              const SizedBox(height: 12),

              /// -------- Reviews --------
              _buildReviews(),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- Widgets ----------------

  Widget _buildStoreSlider() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: 300,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() => _currentIndex = index);
              },
            ),
            items: _storeImages.map((imagePath) {
              return Image.asset(imagePath, width: double.infinity, fit: BoxFit.cover);
            }).toList(),
          ),
        ),

        /// Dots Indicator
        Positioned(
          bottom: 10,
          right: 16,
          child: Row(
            children: List.generate(_storeImages.length, (index) {
              bool isActive = _currentIndex == index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: 20,
                height: 4,
                decoration: BoxDecoration(
                  color: isActive ? Colors.white : Colors.white54,
                  borderRadius: BorderRadius.circular(6),
                ),
              );
            }),
          ),
        ),

        /// Rating
        Positioned(
          top: 60,
          right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 16),
                SizedBox(width: 4),
                Text("4.2", style: TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
          ),
        ),

        /// Favorite Button
        Positioned(
          top: 20,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.black45,
            child: IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ),

        /// Store Info Overlay
        Positioned(
          bottom: 8,
          left: 16,
          right: 16,
          child: ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(BImages.bogoAi),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: const Text(
              "Store Name",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            subtitle: const Row(
              children: [
                Icon(Icons.location_on, color: Colors.white70, size: 16),
                SizedBox(width: 4),
                Text("5.2 km · Afghanistan", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Row(
          children: [
            Icon(Icons.info_outline, color: Colors.black87, size: 24),
            SizedBox(width: 8),
            Text("Information",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
          ],
        ),
        SizedBox(height: 6),
        Text(
          "At our barber shop, we provide the highest levels of service and attention to detail.",
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildTags() {
    return SizedBox(
      height: 92,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          _IconCard(icon: Icons.free_breakfast, text: "Breakfast"),
          _IconCard(icon: Icons.beach_access, text: "Beach"),
          _IconCard(icon: Icons.fitness_center, text: "Gym"),
          _IconCard(icon: Icons.spa, text: "Spa"),
          _IconCard(icon: Icons.wifi, text: "Free WiFi"),
        ],
      ),
    );
  }

  Widget _buildOffers() {
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

  Widget _buildMap() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Row(
          children: [
            Icon(Icons.location_on_outlined, color: Colors.black87, size: 24),
            SizedBox(width: 8),
            Text("Maps",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
          ],
        ),
        MapCard(),
      ],
    );
  }

  Widget _buildReviews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Row(
          children: [
            Icon(Icons.star, color: Colors.black87, size: 24),
            SizedBox(width: 8),
            Text("Reviews",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
          ],
        ),
        ReviewSection(),
      ],
    );
  }
}

/// -------- Review Section --------
/// -------- Review Section --------
class ReviewSection extends StatefulWidget {
  const ReviewSection({super.key});

  @override
  State<ReviewSection> createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  int _selectedRating = 0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// ⭐ Interactive Stars
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(5, (index) {
              final starIndex = index + 1;
              return GestureDetector(
                onTap: () {
                  setState(() => _selectedRating = starIndex);
                },
                child: Icon(
                  Icons.star,
                  size: 28, // adjust size as needed
                  color: _selectedRating >= starIndex
                      ? Colors.amber
                      : Colors.grey.shade400,
                ),
              );
            }),
          ),

          const SizedBox(height: 16),

          /// 💬 Input field
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white, ), // ✅ White border around
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _reviewController,
                  decoration: const InputDecoration(
                    hintText: "Share your thoughts...",
                    border: InputBorder.none, // ✅ No input border
                  ),
                ),
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
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ),
            ],
          ),
        ),

          const SizedBox(height: 20),

          /// Example reviews
          const ReviewTile(
            name: "Tania Wyman",
            comment:
            "I bought it 3 weeks ago and now come back just to say “Awesome” I really enjoy it.",
            imagePath: BImages.bogoAi,
          ),
          const SizedBox(height: 20),
          const ReviewTile(
            name: "John Smith",
            comment: "Great product. Love it!",
            imagePath: BImages.bogoAi,
          ),
        ],
      ),
    );
  }
}

class ReviewTile extends StatelessWidget {
  final String name;
  final String comment;
  final String imagePath;

  const ReviewTile({
    super.key,
    required this.name,
    required this.comment,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Image.asset(imagePath,
              width: 50, height: 50, fit: BoxFit.cover),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  Align(
                    child: Row(
                      children: List.generate(
                        5,
                            (index) => const Icon(Icons.star,
                            color: Colors.amber, size: 16),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                comment,
                style: const TextStyle(fontSize: 13, color: Colors.black87),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


/// -------- Offer Card --------
class OfferCard extends StatelessWidget {
  final String offerText;
  final String count;
  final bool isActive;
  final double borderRadius;

  const OfferCard({
    super.key,
    required this.offerText,
    required this.count,
    this.isActive = true,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    const cardWidth = 180.0;
    return ClipPath(
      clipper: TicketClipper(radius: borderRadius),
      child: Container(
        height: 92,
        width: cardWidth,
        color: isActive ? Colors.black : Colors.grey.shade300,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Text(
                offerText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            /// Dashed lines
            Positioned(
              left: cardWidth * 0.2,
              top: 0,
              bottom: 0,
              child: CustomPaint(
                size: const Size(1, double.infinity),
                painter: DashedLinePainter(color: isActive ? Colors.white : Colors.black54),
              ),
            ),
            Positioned(
              left: cardWidth * 0.8,
              top: 0,
              bottom: 0,
              child: CustomPaint(
                size: const Size(1, double.infinity),
                painter: DashedLinePainter(color: isActive ? Colors.white : Colors.black54),
              ),
            ),

            /// Count
            Positioned(
              right: 10,
              child: Text(
                count,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  final double radius;
  const TicketClipper({this.radius = 16});

  @override
  Path getClip(Size size) {
    const cutRadius = 10.0;
    final rectPath = Path()
      ..addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(radius)));

    final cutPath = Path()
      ..addOval(Rect.fromCircle(center: Offset(size.width * 0.2, 0), radius: cutRadius))
      ..addOval(Rect.fromCircle(center: Offset(size.width * 0.8, 0), radius: cutRadius))
      ..addOval(Rect.fromCircle(center: Offset(size.width * 0.2, size.height), radius: cutRadius))
      ..addOval(Rect.fromCircle(center: Offset(size.width * 0.8, size.height), radius: cutRadius));

    return Path.combine(PathOperation.difference, rectPath, cutPath);
  }

  @override
  bool shouldReclip(TicketClipper oldClipper) => oldClipper.radius != radius;
}

class DashedLinePainter extends CustomPainter {
  final Color color;
  final double dashHeight;
  final double dashSpace;

  DashedLinePainter({required this.color, this.dashHeight = 8, this.dashSpace = 4});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color..strokeWidth = 1;
    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// -------- Action Icon --------
class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ActionIcon(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 92,
          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(35)),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

/// -------- Icon Card --------
class _IconCard extends StatelessWidget {
  final IconData icon;
  final String text;
  const _IconCard({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 142,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black, width: 0.5),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: Colors.black87),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

/// -------- Map Card --------
class MapCard extends StatefulWidget {
  const MapCard({super.key});

  @override
  State<MapCard> createState() => _MapCardState();
}

class _MapCardState extends State<MapCard> {
  bool _locationGranted = false;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    var status = await Permission.location.request();
    if (status.isGranted) setState(() => _locationGranted = true);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        /// Map
        Container(
          margin: const EdgeInsets.only(left: 60, top: 10),
          height: 189,
          decoration: BoxDecoration(
            color: BAppColors.black600,
            borderRadius: BorderRadius.circular(35),
          ),
          clipBehavior: Clip.antiAlias,
          child: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(35.9208, 74.3089), // 📍 Gilgit Baltistan
              zoom: 12,
            ),
            zoomControlsEnabled: false,
            myLocationButtonEnabled: true,
            myLocationEnabled: _locationGranted,
          ),
        ),

        /// Distance pill
        Positioned(
          left: 0,
          top: 90,
          child: Container(
            height: 92,
            width: 163,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(35)),
            child: const Center(
              child: Text("2.7 km",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
            ),
          ),
        ),
      ],
    );
  }
}
