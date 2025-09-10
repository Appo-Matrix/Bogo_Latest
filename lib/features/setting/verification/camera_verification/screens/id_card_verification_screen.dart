import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizes.dart';
import '../../../../../core/utils/constants/app_styles.dart';
import 'selfie_with_id_card_screen.dart';

class IdCardVerificationScreen extends StatefulWidget {
  const IdCardVerificationScreen({super.key});

  @override
  State<IdCardVerificationScreen> createState() =>
      _IdCardVerificationScreenState();
}

class _IdCardVerificationScreenState extends State<IdCardVerificationScreen> {
  CameraController? _controller;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final status = await Permission.camera.request();
    if (!status.isGranted) return;

    final cams = await availableCameras();
    final back = cams.firstWhere(
      (c) => c.lensDirection == CameraLensDirection.back,
      orElse: () => cams.first,
    );

    _controller =
        CameraController(back, ResolutionPreset.high, enableAudio: false);
    await _controller!.initialize();
    if (!mounted) return;
    setState(() => _ready = true);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.black1000,
      body: SafeArea(
        child: Stack(
          children: [
            if (_ready)
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(26),
                  child: CameraPreview(_controller!),
                ),
              ),

            // ===== Outside-blur MASK (W=298, H=511, r=26) + white border =====
            Positioned.fill(child: _maskOverlay()),

            // ===== UI (kept above blur) =====
            Positioned(
                left: 14,
                top: 8,
                child:
                    _circleBtn(Icons.arrow_back, () => Navigator.pop(context))),
            Positioned(
                right: 14,
                top: 8,
                child: _circleBtn(Icons.info_outline, () {})),

            Positioned(
              left: 20,
              top: 66,
              child: Transform.rotate(
                angle: -0.18,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  decoration: BoxDecoration(
                    color: BAppColors.main,
                    borderRadius: BorderRadius.circular(38),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4))
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Photo of your\nID card",
                        style: BAppStyles.poppins(
                          color: BAppColors.white,
                          fontSize: BSizes.fontSizeMd,
                          weight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Icon(Icons.check, color: BAppColors.main),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // top indicator dot (on top of blur)
            Positioned.fill(child: _topDot()),

            // capture -> next (Selfie with ID)
            Positioned(
              bottom: 42,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: () async {
                    if (_controller != null &&
                        _controller!.value.isInitialized) {
                      await _controller!.takePicture();
                      if (!mounted) return;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SelfieWithIdCardScreen()));
                    }
                  },
                  child: _captureBtn(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- overlay pieces ----------
  Widget _maskOverlay() {
    return LayoutBuilder(builder: (context, c) {
      // Figma numbers
      const double holeW = 298;
      const double holeH = 511;
      const double radius = 26;

      final double top = (c.maxHeight - holeH) / 2; // center vertically
      final double left = (c.maxWidth - holeW) / 2; // center horizontally
      final Rect hole = Rect.fromLTWH(left, top, holeW, holeH);

      return Stack(children: [
        // outside area blur + dim (soft light-ish look)
        ClipPath(
          clipper: _InvertedRRectClipper(hole, radius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.2, sigmaY: 2.2),
            child: Container(color: Colors.black.withOpacity(0.45)),
          ),
        ),
        // white border around the rectangular hole
        Positioned.fromRect(
          rect: hole,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(color: Colors.white70, width: 2),
            ),
          ),
        ),
      ]);
    });
  }

  Widget _topDot() {
    return LayoutBuilder(builder: (context, c) {
      const double holeW = 298;
      const double holeH = 511;
      const double radius = 26;

      final double top = (c.maxHeight - holeH) / 2;
      final double left = (c.maxWidth - holeW) / 2;
      final Rect hole = Rect.fromLTWH(left, top, holeW, holeH);

      return Stack(children: [
        Positioned(
          left: hole.center.dx - 27 / 2,
          top: hole.top - 27, // sits just above the frame
          child: Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.30),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white60, width: 2),
            ),
            child: Center(
              child: Container(
                width: 18,
                height: 18,
                decoration: const BoxDecoration(
                    color: Color(0xFF7ED957), shape: BoxShape.circle),
              ),
            ),
          ),
        ),
      ]);
    });
  }

  // ---------- small helpers ----------
  Widget _circleBtn(IconData icon, VoidCallback onTap) => Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.35), shape: BoxShape.circle),
        child: IconButton(
            icon: Icon(icon, color: BAppColors.white), onPressed: onTap),
      );

  Widget _captureBtn() => Container(
        width: 76,
        height: 76,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
              colors: [Color(0xFF222222), Color(0xFF000000)], radius: 0.9),
          boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 16)],
        ),
        child:
            Icon(Icons.camera_alt_rounded, color: BAppColors.white, size: 28),
      );
}

// inverted rounded-rect clipper (screen minus rounded-rect hole)
class _InvertedRRectClipper extends CustomClipper<Path> {
  final Rect hole;
  final double radius;

  _InvertedRRectClipper(this.hole, this.radius);

  @override
  Path getClip(Size size) {
    final outside = Path()..addRect(Offset.zero & size);
    final rr = RRect.fromRectAndRadius(hole, Radius.circular(radius));
    final inside = Path()..addRRect(rr);
    return Path.combine(PathOperation.difference, outside, inside);
  }

  @override
  bool shouldReclip(covariant _InvertedRRectClipper old) =>
      old.hole != hole || old.radius != radius;
}
