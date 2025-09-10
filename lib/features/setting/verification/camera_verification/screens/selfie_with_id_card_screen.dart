import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizes.dart';
import '../../../../../core/utils/constants/app_styles.dart';

class SelfieWithIdCardScreen extends StatefulWidget {
  const SelfieWithIdCardScreen({super.key});

  @override
  State<SelfieWithIdCardScreen> createState() => _SelfieWithIdCardScreenState();
}

class _SelfieWithIdCardScreenState extends State<SelfieWithIdCardScreen> {
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
    final front = cams.firstWhere(
      (c) => c.lensDirection == CameraLensDirection.front,
      orElse: () => cams.first,
    );

    _controller =
        CameraController(front, ResolutionPreset.high, enableAudio: false);
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

            // ===== mask (outside blur + clear rounded-rect hole) =====
            Positioned.fill(child: _maskOverlay()),

            // UI above blur
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
              left: 22,
              top: 66,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                decoration: BoxDecoration(
                  color: BAppColors.main,
                  borderRadius: BorderRadius.circular(38),
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 8)
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "take a selfie with\nID card",
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

            // top indicator dot (above the frame)
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
                      Navigator.pop(context); // or push to success
                    }
                  },
                  child: Container(
                    width: 76,
                    height: 76,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                          colors: [Color(0xFF222222), Color(0xFF000000)],
                          radius: 0.9),
                      boxShadow: [
                        BoxShadow(color: Colors.black54, blurRadius: 16)
                      ],
                    ),
                    child: Icon(Icons.camera_alt_rounded,
                        color: BAppColors.white, size: 28),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===== overlay builders =====
  Widget _maskOverlay() {
    return LayoutBuilder(builder: (context, c) {
      // Figma: X≈21, Y≈249, W=392, H=511, r=26
      const double holeW = 392;
      const double holeH = 511;
      const double radius = 26;

      final double left = (c.maxWidth - holeW).clamp(0, double.infinity) /
          2; // center horizontally (works on small screens too)
      final double top = (c.maxHeight - holeH).clamp(0, double.infinity) / 2;

      final Rect hole = Rect.fromLTWH(left, top, holeW, holeH);

      return Stack(children: [
        ClipPath(
          clipper: _InvertedRRectClipper(hole, radius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.2, sigmaY: 2.2),
            child: Container(color: Colors.black.withOpacity(0.45)),
          ),
        ),
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
      const double holeW = 392;
      const double holeH = 511;
      const double radius = 26;

      final double left = (c.maxWidth - holeW).clamp(0, double.infinity) / 2;
      final double top = (c.maxHeight - holeH).clamp(0, double.infinity) / 2;
      final Rect hole = Rect.fromLTWH(left, top, holeW, holeH);

      return Stack(children: [
        Positioned(
          left: hole.center.dx - 27,
          top: hole.top - 27,
          child: Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.35),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white60, width: 2),
            ),
            child: Center(
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                    color: Color(0xFF7ED957), shape: BoxShape.circle),
              ),
            ),
          ),
        ),
      ]);
    });
  }

  // ===== tiny helpers =====
  Widget _circleBtn(IconData icon, VoidCallback onTap) => Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.35), shape: BoxShape.circle),
        child: IconButton(
            icon: Icon(icon, color: BAppColors.white), onPressed: onTap),
      );
}

// inverted rounded-rect clipper
class _InvertedRRectClipper extends CustomClipper<Path> {
  final Rect hole;
  final double radius;

  _InvertedRRectClipper(this.hole, this.radius);

  @override
  Path getClip(Size size) {
    final outside = Path()..addRect(Offset.zero & size);
    final inside = Path()
      ..addRRect(RRect.fromRectAndRadius(hole, Radius.circular(radius)));
    return Path.combine(PathOperation.difference, outside, inside);
  }

  @override
  bool shouldReclip(covariant _InvertedRRectClipper old) =>
      old.hole != hole || old.radius != radius;
}
