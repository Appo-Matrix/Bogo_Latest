import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizes.dart';
import '../../../../../core/utils/constants/app_styles.dart';
import 'id_card_verification_screen.dart';

class FaceVerificationScreen extends StatefulWidget {
  const FaceVerificationScreen({super.key});

  @override
  State<FaceVerificationScreen> createState() => _FaceVerificationScreenState();
}

class _FaceVerificationScreenState extends State<FaceVerificationScreen> {
  CameraController? _controller;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final granted = await Permission.camera.request();
    if (!granted.isGranted) return;
    final cams = await availableCameras();
    final front = cams.firstWhere(
      (c) => c.lensDirection == CameraLensDirection.front,
      orElse: () => cams.first,
    );
    _controller =
        CameraController(front, ResolutionPreset.medium, enableAudio: false);
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

            // ----- MASK (blur outside) + white border -----
            Positioned.fill(child: _maskOverlay()),

            // ----- UI jo blur ke upar chahiye -----
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
                left: 26,
                top: 72,
                child: _banner("take a picture of\nyour face")),
            // green top dot (outside the blur)
            Positioned.fill(child: _topDot()),

            // capture
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
                              builder: (_) =>
                                  const IdCardVerificationScreen()));
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

  // ========== pieces ==========
  Widget _maskOverlay() {
    return LayoutBuilder(builder: (context, c) {
      const double holeW = 259;
      const double holeH = 342;
      final double top = (c.maxHeight - holeH) / 2 - 6;
      final double left = (c.maxWidth - holeW) / 2;
      final Rect hole = Rect.fromLTWH(left, top, holeW, holeH);

      return Stack(children: [
        // outside blur+dim
        ClipPath(
          clipper: _InvertedOvalClipper(hole),
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 2.2, sigmaY: 2.2),
            child: Container(color: Colors.black.withOpacity(0.45)),
          ),
        ),
        // white border
        Positioned.fromRect(
          rect: hole,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white70, width: 2),
              borderRadius: BorderRadius.circular(holeW),
            ),
          ),
        ),
      ]);
    });
  }

  Widget _topDot() {
    return LayoutBuilder(builder: (context, c) {
      const double holeW = 259;
      const double holeH = 342;
      final double top = (c.maxHeight - holeH) / 2 - 6;
      final double left = (c.maxWidth - holeW) / 2;
      final Rect hole = Rect.fromLTWH(left, top, holeW, holeH);

      return Stack(children: [
        Positioned(
          left: hole.center.dx - 20,
          top: hole.top - 22,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.35),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white60, width: 2),
            ),
            child: Center(
              child: Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  color: Color(0xFF7ED957),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ]);
    });
  }

  Widget _circleBtn(IconData icon, VoidCallback onTap) => Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.35), shape: BoxShape.circle),
        child: IconButton(
            icon: Icon(icon, color: BAppColors.white), onPressed: onTap),
      );

  Widget _banner(String text) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: BAppColors.main,
          borderRadius: BorderRadius.circular(38),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8)],
        ),
        child: Row(
          children: [
            Text(
              text,
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

// inverted clipper
class _InvertedOvalClipper extends CustomClipper<Path> {
  final Rect hole;

  _InvertedOvalClipper(this.hole);

  @override
  Path getClip(Size size) {
    final outside = Path()..addRect(Offset.zero & size);
    final oval = Path()
      ..addRRect(RRect.fromRectAndRadius(hole, Radius.circular(hole.width)));
    return Path.combine(PathOperation.difference, outside, oval);
  }

  @override
  bool shouldReclip(covariant _InvertedOvalClipper old) => old.hole != hole;
}
