import 'dart:ui';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum Button { square, backBlur, smpButton }

class AppButtons extends StatefulWidget {
  final Button type;
  final dynamic imageIcon;
  final dynamic imageIconOnChange;
  final double? imageSize;
  final Color? imageColor;
  final Function() onTap;
  final double? blurScale;
  final double? borderRadius;
  final double? height;
  final double? width;
  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;
  final bool isBackGTransparent;
  final String? buttonText;

  const AppButtons.square(
      {required this.imageIcon, required this.onTap, super.key})
      : type = Button.square,
        blurScale = null,
        buttonText = null,
        isBackGTransparent = false,
        imageSize = null,
        fontSize = null,
        textColor = null,
        buttonColor = null,
        height = null,
        borderRadius = null,
        width = null,
        imageIconOnChange = null,
        imageColor = null;

  const AppButtons.backBlur(
      {required this.imageIcon,
      required this.onTap,
      this.blurScale = 5,
      this.imageSize,
      this.imageIconOnChange,
      this.isBackGTransparent = false,
      this.imageColor = BAppColors.white,
      this.buttonText,
      this.height = 58,
      super.key})
      : type = Button.backBlur,
        fontSize = null,
        width = null,
        textColor = null,
        borderRadius = null,
        buttonColor = null;

  const AppButtons.simple(
      {required this.onTap,
      this.imageIcon,
      required this.buttonText,
      this.buttonColor = BAppColors.black1000,
      this.height = 92,
      this.textColor = BAppColors.white,
      this.borderRadius = 35,
      this.width = double.infinity,
      this.fontSize = 18,
      super.key})
      : type = Button.smpButton,
        imageIconOnChange = null,
        blurScale = null,
        imageSize = null,
        isBackGTransparent = false,
        imageColor = null;

  @override
  State<AppButtons> createState() => _AppButtonsState();
}

class _AppButtonsState extends State<AppButtons> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case Button.square:
        return _square(context);
      case Button.backBlur:
        return _backBlurIconColorChanger(context);
      case Button.smpButton:
        return _simpleButton(context);
    }
  }

  Widget _square(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 92,
        width: 92,
        decoration: BoxDecoration(
          color: BAppColors.black1000,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Center(
          child: SizedBox(
            height: BSizes.iconMd - 3,
            width: BSizes.iconMd - 3,
            child: widget.imageIcon is IconData
                ? Icon(widget.imageIcon, color: BAppColors.white)
                : SvgPicture.asset(
                    widget.imageIcon,
                    color: BAppColors.white,
                  ),
          ),
        ),
      ),
    );
  }

  Widget _backBlurIconColorChanger(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.onTap();
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: widget.blurScale!, sigmaY: widget.blurScale!),
          child: Container(
            height: widget.height,
            width: 58,
            decoration: BoxDecoration(
              color: widget.isBackGTransparent
                  ? Colors.transparent
                  : BAppColors.white.withOpacity(0.1),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: widget.imageSize ?? BSizes.iconSm + 2,
                    width: widget.imageSize ?? BSizes.iconSm + 2,
                    child: widget.imageIcon is IconData
                        ? Icon(widget.imageIcon,
                            color: isSelected
                                ? BAppColors.yellow500
                                : widget.imageColor)
                        : SvgPicture.asset(
                            widget.imageIcon,
                            color: isSelected
                                ? BAppColors.yellow500
                                : widget.imageColor,
                          ),
                  ),
                  if (widget.buttonText != null)
                    SizedBox(
                      width: BSizes.size5,
                    ),
                  if (widget.buttonText != null)
                    Text(widget.buttonText!,
                        style:
                            BAppStyles.body.copyWith(color: BAppColors.white))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _simpleButton(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            color: widget.buttonColor,
            borderRadius: BorderRadius.circular(widget.borderRadius!)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.imageIcon != null)
                SizedBox(
                  height: 21,
                  child: Center(
                    child: widget.imageIcon is IconData
                        ? Icon(widget.imageIcon,
                            color: isSelected
                                ? BAppColors.yellow500
                                : BAppColors.white)
                        : SvgPicture.asset(
                            widget.imageIcon,
                            color: isSelected
                                ? BAppColors.yellow500
                                : BAppColors.white,
                          ),
                  ),
                ),
              SizedBox(width: BSizes.size5),
              Text(
                widget.buttonText!,
                style: BAppStyles.poppins(
                    color: widget.textColor!,
                    fontSize: widget.fontSize!,
                    weight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FixedPositionAnimatedButtonList extends StatefulWidget {
  const FixedPositionAnimatedButtonList({
    super.key,
    required this.items,
    this.spacing = 5.0,
  });

  final List<FixedPositionAnimatedButtonItem> items;
  final double spacing;

  @override
  State<FixedPositionAnimatedButtonList> createState() =>
      _FixedPositionAnimatedButtonListState();
}

class _FixedPositionAnimatedButtonListState
    extends State<FixedPositionAnimatedButtonList> {
  int? _selectedIndex;

  void _onItemTap(int index, VoidCallback onTap) {
    setState(() {
      // toggle if the same button tapped again, otherwise select new one
      _selectedIndex = (_selectedIndex == index) ? null : index;
    });
    onTap();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _FixedSpecs.itemTotalHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        separatorBuilder: (_, __) => SizedBox(width: widget.spacing),
        itemBuilder: (context, index) {
          final item = widget.items[index];
          final bool isExpanded = _selectedIndex == index;
          return FixedPositionAnimatedButton(
            imageIcon: item.imageIcon,
            textTitle: item.textTitle,
            expanded: isExpanded,
            onTap: () => _onItemTap(index, item.onTap),
          );
        },
      ),
    );
  }
}

class FixedPositionAnimatedButtonItem {
  const FixedPositionAnimatedButtonItem({
    required this.imageIcon,
    required this.onTap,
    required this.textTitle,
  });

  final Object imageIcon;
  final VoidCallback onTap;
  final String textTitle;
}

class _FixedSpecs {
  static const double baseWidth = 80.0;
  static const double baseHeight = 92.0;
  static const double expandedHeight = 125.0;
  static const double radius = 35.0;

  static const double itemTotalHeight = 125.0;
  static const double iconCenterY = baseHeight / 2;
  static const double titleTop = baseHeight + 2.0;

  static const Duration duration = Duration(milliseconds: 200);
  static const Curve curve = Curves.easeInOut;
}

class FixedPositionAnimatedButton extends StatelessWidget {
  const FixedPositionAnimatedButton({
    super.key,
    required this.imageIcon,
    required this.onTap,
    required this.textTitle,
    required this.expanded,
  });

  final Object imageIcon;
  final VoidCallback onTap;
  final String textTitle;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final double containerHeight =
        expanded ? _FixedSpecs.expandedHeight : _FixedSpecs.baseHeight;

    final bool titleIsInside = _FixedSpecs.titleTop <= containerHeight;
    final Color titleColor =
        titleIsInside ? BAppColors.white : BAppColors.lightGray600;

    return SizedBox(
      width: _FixedSpecs.baseWidth,
      height: _FixedSpecs.itemTotalHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedContainer(
            duration: _FixedSpecs.duration,
            curve: _FixedSpecs.curve,
            width: _FixedSpecs.baseWidth,
            height: containerHeight,
            decoration: BoxDecoration(
              color:
                  expanded ? BAppColors.backGroundColor : BAppColors.black1000,
              borderRadius: BorderRadius.circular(_FixedSpecs.radius),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: _FixedSpecs.iconCenterY - 12,
            child: _buildIconOrSvg(imageIcon),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: _FixedSpecs.titleTop,
            child: IgnorePointer(
              ignoring: true,
              child: Text(
                textTitle,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: titleColor,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(_FixedSpecs.radius),
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_FixedSpecs.radius),
                ),
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconOrSvg(Object imageIcon) {
    const double iconSize = 24.0;
    if (imageIcon is IconData) {
      return Icon(
        imageIcon,
        size: iconSize,
        color: Colors.white,
      );
    } else if (imageIcon is String) {
      return SizedBox(
        height: iconSize,
        width: iconSize,
        child: FittedBox(
          fit: BoxFit.contain,
          child: SvgPicture.asset(
            imageIcon,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      );
    } else {
      return const SizedBox(
        height: iconSize,
        width: iconSize,
      );
    }
  }
}

class SquareButtonItems {
  final dynamic imageIcons;
  final VoidCallback onTap;

  const SquareButtonItems({required this.imageIcons, required this.onTap});
}

class SquareButtonList extends StatelessWidget {
  final List<SquareButtonItems> squareButtonItems;

  const SquareButtonList({required this.squareButtonItems, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: squareButtonItems.map((item) {
          return _SqrButtonWidget(squareButtonItems: item);
        }).toList(),
      ),
    );
  }
}

class _SqrButtonWidget extends StatelessWidget {
  final SquareButtonItems squareButtonItems;

  const _SqrButtonWidget({required this.squareButtonItems, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
      child: AppButtons.square(
          imageIcon: squareButtonItems.imageIcons,
          onTap: squareButtonItems.onTap),
    );
  }
}

class DragButton extends StatefulWidget {
  final String text;
  final VoidCallback onActivated;

  const DragButton({
    super.key,
    required this.text,
    required this.onActivated,
  });

  @override
  State<DragButton> createState() => _DragButtonState();
}

class _DragButtonState extends State<DragButton> {
  double _dragPosition = 0.0;
  bool _activated = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.9;
    const height = 80.0;
    const circleSize = 70.0;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Center Text
          if (!_activated)
            Text(
              widget.text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            )
          else
            const Icon(Icons.check, color: Colors.white, size: 32),

          // Draggable Circle
          Positioned(
            left: _dragPosition,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _dragPosition += details.delta.dx;
                  _dragPosition = _dragPosition.clamp(0.0, width - circleSize);
                });
              },
              onHorizontalDragEnd: (details) {
                if (_dragPosition > width * 0.6) {
                  // Activated
                  setState(() {
                    _activated = true;
                    _dragPosition = width - circleSize;
                  });
                  widget.onActivated();
                } else {
                  // Reset
                  setState(() {
                    _dragPosition = 0.0;
                  });
                }
              },
              child: Container(
                width: circleSize,
                height: circleSize,
                decoration: BoxDecoration(
                  color: _activated
                      ? BAppColors.backGroundColor
                      : BAppColors.lightGray700,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: _activated
                      ? const Icon(Icons.check, color: Colors.white, size: 32)
                      : const Icon(Icons.arrow_forward_ios,
                          color: Colors.white, size: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
