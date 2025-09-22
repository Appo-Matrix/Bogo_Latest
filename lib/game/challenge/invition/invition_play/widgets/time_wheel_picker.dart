import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';

class TimeWheelPicker extends StatefulWidget {
  final TimeOfDay initialTime;

  final ValueChanged<TimeOfDay>? onChanged;

  final double height; // container height of each wheel
  final double hourWidth;
  final double minuteWidth;
  final double periodWidth;

  final double numberFontSize;
  final double periodFontSize;

  const TimeWheelPicker({
    super.key,
    this.initialTime = const TimeOfDay(hour: 6, minute: 30),
    this.onChanged,
    this.height = 92,
    this.hourWidth = 131,
    this.minuteWidth = 131,
    this.periodWidth = 92,
    this.numberFontSize = BSizes.fontSizeMd,
    this.periodFontSize = BSizes.fontSizeMd,
  });

  @override
  State<TimeWheelPicker> createState() => _TimeWheelPickerState();
}

class _TimeWheelPickerState extends State<TimeWheelPicker> {
  late int _hourIndex;
  late int _minuteIndex;
  late int _periodIndex;

  late FixedExtentScrollController _hCtrl;
  late FixedExtentScrollController _mCtrl;
  late FixedExtentScrollController _pCtrl;

  @override
  void initState() {
    super.initState();
    final init = widget.initialTime;
    _hourIndex = (init.hour % 12) - 1;
    if (_hourIndex < 0) _hourIndex = 11;
    _minuteIndex = init.minute.clamp(0, 59);
    _periodIndex = init.period == DayPeriod.am ? 0 : 1;

    _hCtrl = FixedExtentScrollController(initialItem: _hourIndex);
    _mCtrl = FixedExtentScrollController(initialItem: _minuteIndex);
    _pCtrl = FixedExtentScrollController(initialItem: _periodIndex);
  }

  @override
  void dispose() {
    _hCtrl.dispose();
    _mCtrl.dispose();
    _pCtrl.dispose();
    super.dispose();
  }

  void _notify() {
    final hour12 = ((_hourIndex + 1) % 12); // 0..11 (0 means 12)
    final h = _periodIndex == 0
        ? (hour12 == 0 ? 12 % 12 : hour12) // AM
        : (hour12 == 0 ? 12 : hour12) + 0 + 12; // PM
    final composed = TimeOfDay(hour: h % 24, minute: _minuteIndex);
    widget.onChanged?.call(composed);
  }

  TextStyle get _numberStyle => BAppStyles.poppins(
        color: BAppColors.white,
        fontSize: widget.numberFontSize,
        weight: FontWeight.w600,
      );

  TextStyle get _periodStyle => BAppStyles.poppins(
        color: BAppColors.white,
        fontSize: widget.periodFontSize,
        weight: FontWeight.w600,
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // HOURS (left pill, rounded left only)
        _pill(
          width: widget.hourWidth,
          height: widget.height,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            bottomLeft: Radius.circular(35),
          ),
          child: CupertinoPicker(
            scrollController: _hCtrl,
            itemExtent: 36,
            useMagnifier: true,
            magnification: 1.08,
            squeeze: 1.2,
            selectionOverlay: const SizedBox.shrink(),
            onSelectedItemChanged: (i) {
              setState(() => _hourIndex = i);
              _notify();
            },
            children: List.generate(12, (i) {
              final value = (i + 1) % 12 == 0 ? 12 : (i + 1) % 12; // 1..12
              return Center(
                  child: Text(value.toString().padLeft(2, '0'),
                      style: _numberStyle));
            }),
          ),
        ),

        const SizedBox(width: 5),
        Text(':',
            style: BAppStyles.poppins(
                color: BAppColors.white,
                fontSize: BSizes.fontSizeLg,
                weight: FontWeight.w600)),
        const SizedBox(width: 5),

        // MINUTES (right pill, rounded right only)
        _pill(
          width: widget.minuteWidth,
          height: widget.height,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
          child: CupertinoPicker(
            scrollController: _mCtrl,
            itemExtent: 36,
            useMagnifier: true,
            magnification: 1.08,
            squeeze: 1.2,
            selectionOverlay: const SizedBox.shrink(),
            onSelectedItemChanged: (i) {
              setState(() => _minuteIndex = i);
              _notify();
            },
            children: List.generate(
                60,
                (i) => Center(
                    child: Text(i.toString().padLeft(2, '0'),
                        style: _numberStyle))),
          ),
        ),

        const SizedBox(width: 10),

        // AM/PM chip
        _pill(
          width: widget.periodWidth,
          height: widget.height,
          borderRadius: BorderRadius.circular(35),
          child: CupertinoPicker(
            scrollController: _pCtrl,
            itemExtent: 36,
            useMagnifier: true,
            magnification: 1.08,
            squeeze: 1.2,
            selectionOverlay: const SizedBox.shrink(),
            onSelectedItemChanged: (i) {
              setState(() => _periodIndex = i);
              _notify();
            },
            children: [
              Center(child: Text('AM', style: _periodStyle)),
              Center(child: Text('PM', style: _periodStyle)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _pill(
      {required double width,
      required double height,
      required BorderRadius borderRadius,
      required Widget child}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: BAppColors.black900,
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: DefaultTextStyle(
          style: _numberStyle,
          child: child,
        ),
      ),
    );
  }
}
