import 'package:flutter/material.dart';

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
