import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';

class MiniCalendarBar extends StatefulWidget {
  final DateTime? initialDate; // keep const-safe
  final BorderRadius borderRadius;
  final double width;
  final double height;
  final ValueChanged<DateTime>? onDateChanged;

  const MiniCalendarBar({
    super.key,
    this.initialDate,
    this.borderRadius = const BorderRadius.all(Radius.circular(35)),
    this.width = 373,
    this.height = 135,
    this.onDateChanged,
  });

  @override
  State<MiniCalendarBar> createState() => _MiniCalendarBarState();
}

class _MiniCalendarBarState extends State<MiniCalendarBar> {
  // ---- state
  late DateTime _selected;
  late DateTime _anchorWeekMonday; // week paging anchor
  late DateTime _anchorMonth; // month picker anchor

  final _weekCtrl = PageController(initialPage: 10000);
  final _monthCtrl = PageController(initialPage: 10000);
  final _yearCtrl = PageController(initialPage: 10000);

  bool _pickerMode = false; // false = week view, true = month/year pickers

  @override
  void initState() {
    super.initState();
    _selected = _strip(widget.initialDate ?? DateTime.now());
    _anchorWeekMonday = _mondayOf(_selected);
    _anchorMonth = DateTime(_selected.year, _selected.month, 1);
  }

  @override
  void dispose() {
    _weekCtrl.dispose();
    _monthCtrl.dispose();
    _yearCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = widget.width;
    final h = widget.height;

    // ---- TOP LABEL
    // Week view: show "W 12"; Picker view: show "January 2023"
    final topLabel = !_pickerMode
        ? '${DateFormat.E().format(_selected).characters.first.toUpperCase()} ${_selected.day}'
        : DateFormat('MMMM yyyy').format(_selected);

    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: BAppColors.black900,
        borderRadius: widget.borderRadius,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // ===== Top row label (tap to toggle modes)
          GestureDetector(
            onTap: () => setState(() => _pickerMode = !_pickerMode),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 6),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  topLabel,
                  style: BAppStyles.poppins(
                    color: Colors.white,
                    fontSize: BSizes.fontSizeLg,
                    weight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),

          // ===== Body (either week view OR month/year pickers)
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              child: _pickerMode ? _buildPickers() : _buildWeek(w),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- WEEK VIEW (static day header + dates pager) ----------------
  Widget _buildWeek(double w) {
    // Static day header (no scroll)
    final dayLabels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    final header = Padding(
      // days ko thora niche lane ke liye top padding barha di,
      // aur bottom me 4px diya; isse days & dates ke beech spacing controlled rehti hai
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(7, (i) {
          final isWeekend = (i == 5 || i == 6);
          return SizedBox(
            width: (w - 24) / 7,
            child: Text(
              dayLabels[i],
              textAlign: TextAlign.center,
              style: BAppStyles.poppins(
                color: isWeekend ? const Color(0xFFFF4A4A) : Colors.white70,
                fontSize: 12,
                weight: FontWeight.w600,
              ),
            ),
          );
        }),
      ),
    );

    // Dates pager (only dates slide)
    final dates = PageView.builder(
      controller: _weekCtrl,
      onPageChanged: (page) {
        final delta = page - 10000;
        final start = _anchorWeekMonday.add(Duration(days: delta * 7));
        setState(() {
          _anchorWeekMonday = start;
          _selected = _keepSameWeekday(_selected, start);
        });
        widget.onDateChanged?.call(_selected);
      },
      itemBuilder: (_, page) {
        final delta = page - 10000;
        final monday = _anchorWeekMonday.add(Duration(days: delta * 7));
        final days = List.generate(7, (i) => monday.add(Duration(days: i)));

        return Padding(
          // bottom padding ko 10 rakha hai taake component ki total height match rahe
          padding: const EdgeInsets.fromLTRB(12, 2, 12, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: days.map((d) {
              final isSel = _sameDay(d, _selected);
              final isWeekend = d.weekday == DateTime.saturday ||
                  d.weekday == DateTime.sunday;
              final slotW = (w - 24) / 7;

              return SizedBox(
                width: slotW,
                height: 56, // fixed height so kuch upar-neeche na hile
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    setState(() => _selected = d);
                    widget.onDateChanged?.call(_selected);
                  },
                  child: isSel
                      // Selected: green pill — ONLY number (no day-letter)
                      ? Container(
                          decoration: BoxDecoration(
                            color: BAppColors.primary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${d.day}',
                            style: BAppStyles.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              weight: FontWeight.w700,
                            ),
                          ),
                        )
                      // Unselected: sirf date, center me (weekend red)
                      : Center(
                          child: Text(
                            '${d.day}',
                            style: BAppStyles.poppins(
                              color: isWeekend
                                  ? const Color(0xFFFF4A4A)
                                  : Colors.white.withOpacity(.85),
                              fontSize: 14,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );

    return Column(
      key: const ValueKey('week'),
      children: [
        header,
        const SizedBox(height: 6),
        Expanded(child: dates),
      ],
    );
  }

  // ---------------- MONTH / YEAR PICKERS (independent) ----------------
  Widget _buildPickers() {
    // MONTHS row (horizontal, independent)
    final months = PageView.builder(
      controller: _monthCtrl,
      padEnds: false,
      pageSnapping: true,
      itemBuilder: (_, page) {
        final delta = page - 10000;
        final m = DateTime(_anchorMonth.year, _anchorMonth.month + delta, 1);
        final isSel = (m.year == _selected.year && m.month == _selected.month);

        return Center(
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              setState(() {
                _anchorMonth = m;
                final last = DateTime(m.year, m.month + 1, 0).day;
                final day = _selected.day.clamp(1, last);
                _selected = DateTime(m.year, m.month, day);
                _anchorWeekMonday = _mondayOf(_selected);
              });
              widget.onDateChanged?.call(_selected);
            },
            child: Container(
              width: 72,
              height: 36,
              decoration: BoxDecoration(
                color: isSel ? BAppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: Text(
                DateFormat('MMM').format(m),
                style: BAppStyles.poppins(
                  color: isSel ? Colors.white : Colors.white.withOpacity(.9),
                  fontSize: 14,
                  weight: isSel ? FontWeight.w700 : FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
      onPageChanged: (page) {
        final delta = page - 10000;
        final m = DateTime(_anchorMonth.year, _anchorMonth.month + delta, 1);
        setState(() => _anchorMonth = m);
      },
    );

    // YEARS row (horizontal, independent)
    final years = PageView.builder(
      controller: _yearCtrl,
      padEnds: false,
      pageSnapping: true,
      itemBuilder: (_, page) {
        final delta = page - 10000;
        final y = _anchorMonth.year + delta;
        final isSel = (y == _selected.year);

        return Center(
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              setState(() {
                _anchorMonth = DateTime(y, _anchorMonth.month, 1);
                final last = DateTime(y, _selected.month + 1, 0).day;
                final day = _selected.day.clamp(1, last);
                _selected = DateTime(y, _selected.month, day);
                _anchorWeekMonday = _mondayOf(_selected);
              });
              widget.onDateChanged?.call(_selected);
            },
            child: Container(
              width: 72,
              height: 36,
              decoration: BoxDecoration(
                color: isSel ? BAppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: Text(
                '$y',
                style: BAppStyles.poppins(
                  color: isSel ? Colors.white : Colors.white.withOpacity(.9),
                  fontSize: 14,
                  weight: isSel ? FontWeight.w700 : FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
      onPageChanged: (page) {
        final delta = page - 10000;
        final y = _anchorMonth.year + delta;
        setState(() => _anchorMonth = DateTime(y, _anchorMonth.month, 1));
      },
    );

    return Column(
      key: const ValueKey('pickers'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        SizedBox(height: 44, child: _MonthsProxy()),
        SizedBox(height: 6),
        SizedBox(height: 44, child: _YearsProxy()),
        SizedBox(height: 6),
      ],
    )._injectPickers(months, years);
  }

  // ---------------- helpers ----------------
  DateTime _strip(DateTime d) => DateTime(d.year, d.month, d.day);

  DateTime _mondayOf(DateTime d) =>
      _strip(d).subtract(Duration(days: d.weekday - 1));

  DateTime _keepSameWeekday(DateTime oldSel, DateTime newWeekMonday) {
    final off = oldSel.weekday - 1;
    return DateTime(
        newWeekMonday.year, newWeekMonday.month, newWeekMonday.day + off);
  }

  bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}

/* ---------- tiny helpers to inject built pickers into const layout ---------- */
// Flutter const Column children can’t hold runtime widgets directly,
// so we use placeholders then replace via extension.
class _MonthsProxy extends StatelessWidget {
  const _MonthsProxy({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

class _YearsProxy extends StatelessWidget {
  const _YearsProxy({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

extension _Inject on Column {
  Column _injectPickers(Widget months, Widget years) {
    final kids = List<Widget>.from(children);
    final mi = kids.indexWhere((w) => w is SizedBox && (w).child is _MonthsProxy);
    final yi = kids.indexWhere((w) => w is SizedBox && (w).child is _YearsProxy);
    if (mi != -1) kids[mi] = SizedBox(height: 44, child: months);
    if (yi != -1) kids[yi] = SizedBox(height: 44, child: years);
    return Column(
      key: key,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: kids,
    );
  }
}
