import 'package:flutter/material.dart';

/// GuestPickerTile — pill row for guest count selection (Figma-accurate sizing)
class GuestPickerTile extends StatefulWidget {
  const GuestPickerTile({
    super.key,
    required this.label,
    required this.avatar,
    this.value = 1,
    this.min = 0,
    this.max = 9,
    this.onChanged,
    this.color,
    this.width = 299,
    this.height = 92,
    this.borderRadius = 35,
    this.avatarSize = 76.82720947265625,
  });

  final String label;
  final ImageProvider avatar;
  final int value;
  final int min;
  final int max;
  final ValueChanged<int>? onChanged;
  final Color? color;              // avatar background color

  // Layout overrides
  final double width;              // default 299 (Figma)
  final double height;             // default 92  (Figma)
  final double borderRadius;       // default 35  (Figma)
  final double avatarSize;         // default 76.8272 (Figma)

  @override
  State<GuestPickerTile> createState() => _GuestPickerTileState();
}

class _GuestPickerTileState extends State<GuestPickerTile> {
  late int _value = widget.value.clamp(widget.min, widget.max);

  void _increment() {
    if (_value < widget.max) {
      setState(() => _value++);
      widget.onChanged?.call(_value);
    }
  }

  void _decrement() {
    if (_value > widget.min) {
      setState(() => _value--);
      widget.onChanged?.call(_value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFEDEEEF),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar circle (exact Figma size)
            Container(
              width: widget.avatarSize,
              height: widget.avatarSize,
              decoration: BoxDecoration(
                color: widget.color ?? const Color(0xFF7C3AED),
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.antiAlias,
              child: ClipOval(
                child: Image(
                  image: widget.avatar,
                  fit: BoxFit.cover,
                  width: widget.avatarSize,
                  height: widget.avatarSize,
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Label
            Expanded(
              child: Text(
                widget.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),

            // Counter (tall to balance larger avatar)
            const SizedBox(width: 8),
            _CounterCapsule(
              height: 76,               // visually balanced within 92px tile
              width: 104,
              valueText: _value.toString().padLeft(2, '0'),
              onDown: _decrement,
              onUp: _increment,
            ),
          ],
        ),
      ),
    );
  }
}

class _CounterCapsule extends StatelessWidget {
  const _CounterCapsule({
    required this.valueText,
    required this.onDown,
    required this.onUp,
    this.height = 76,
    this.width = 104,
  });

  final String valueText;
  final VoidCallback onDown;
  final VoidCallback onUp;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ChevronButton(icon: Icons.expand_more, onTap: onDown),
          Text(
            valueText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: 1.0,
            ),
          ),
          _ChevronButton(icon: Icons.expand_less, onTap: onUp),
        ],
      ),
    );
  }
}

class _ChevronButton extends StatelessWidget {
  const _ChevronButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: double.infinity,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Icon(icon, size: 22, color: Colors.black87),
      ),
    );
  }
}
