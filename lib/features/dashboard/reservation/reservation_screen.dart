import 'package:bogo_latest/features/dashboard/reservation/widgets/corner_tick_button.dart';
import 'package:bogo_latest/features/dashboard/reservation/widgets/guest_picker_tile.dart';
import 'package:bogo_latest/features/dashboard/reservation/widgets/online_dot.dart';
import 'package:bogo_latest/features/dashboard/reservation/widgets/rail_item.dart';
import 'package:bogo_latest/features/dashboard/reservation/widgets/reservation_calendar.dart';
import 'package:bogo_latest/features/dashboard/reservation/widgets/time_picker_row.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/constants/app_assets.dart';
import '../../../core/utils/constants/app_colors.dart';
import '../../../core/utils/constants/app_strings.dart';
import '../../../core/utils/constants/app_sizes.dart';
import '../../../core/utils/constants/app_styles.dart';
import '../storedetail/store_detail_screen.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  int selectedDay = 12;
  int hour = 6;
  int minute = 30;
  bool isAm = true;

  int adults = 1;
  int children = 1;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final isCompact = mq.size.width < 600; // phones & tight layouts

    // Left rail width from BSizes
    final railW = isCompact ? BSizes.lg * 2.5 : BSizes.lg * 3.3;

    return Scaffold(
      backgroundColor: BAppColors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ======= Left Rail (fixed width) =======
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: railW),
              child: DecoratedBox(
                decoration: BoxDecoration(color: BAppColors.black100),
                child: Column(
                  children: [
                    SizedBox(height: BSizes.sm),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        onPressed: () => Navigator.maybePop(context),
                      ),
                    ),
                    SizedBox(height: BSizes.md),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(vertical: BSizes.sm),
                        child: Column(
                          children: [
                            RailItem(label: 'Date', selected: true),
                            SizedBox(height: BSizes.xl),
                            const RailItem(label: 'Time'),
                            SizedBox(height: BSizes.xl),
                            const RailItem(label: 'Genre'),
                            SizedBox(height: BSizes.xl),
                            const RailItem(label: 'Note'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ======= Main Content (flexible) =======
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  isCompact ? BSizes.sm : BSizes.md,
                  0,
                  isCompact ? BSizes.sm : BSizes.md,
                  isCompact ? BSizes.sm : BSizes.md,
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(top: BSizes.md, bottom: BSizes.spaceBtwSections),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: BSizes.xs, vertical: BSizes.sm),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      AppStrings.reservation,
                                      style: BAppStyles.poppins(
                                        color: BAppColors.black1000,
                                        fontSize: BSizes.fontSizeLhx,
                                        weight: FontWeight.w700,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: const [
                                      CircleAvatar(
                                        radius: BSizes.iconLg,
                                        backgroundImage: AssetImage(BImages.profile),
                                      ),
                                      Positioned(right: -2, top: -2, child: OnlineDot()),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: BSizes.lg),
                            const ReservationCalendar(),
                            SizedBox(height: BSizes.lg),
                            const TimePickerRow(),
                            SizedBox(height: BSizes.lg),

                            GuestPickerTile(
                              label: AppStrings.adults,
                              avatar: const AssetImage('assets/images/man.png'),
                              value: adults,
                              onChanged: (v) => setState(() => adults = v),
                            ),
                            SizedBox(height: BSizes.sm),
                            GuestPickerTile(
                              label: AppStrings.children,
                              avatar: const AssetImage('assets/images/Maskgroup.png'),
                              value: children,
                              onChanged: (v) => setState(() => children = v),
                            ),

                            SizedBox(height: BSizes.lg),

                            LayoutBuilder(
                              builder: (context, c) {
                                final noteWidth = isCompact ? c.maxWidth : 299.0;
                                return ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: noteWidth,
                                    minHeight: 120,
                                  ),
                                  child: TextField(
                                    minLines: 5,
                                    maxLines: 8,
                                    textAlignVertical: TextAlignVertical.top,
                                    decoration: InputDecoration(
                                      hintText: AppStrings.tField,
                                      hintStyle: TextStyle(
                                        color: BAppColors.black1000.withOpacity(0.28),
                                        fontSize: BSizes.fontSizeSm,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      contentPadding: const EdgeInsets.all(BSizes.md),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(BSizes.borderRadiusLg * 2),
                                        borderSide: const BorderSide(width: 1),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(BSizes.borderRadiusLg * 2),
                                        borderSide: const BorderSide(width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(BSizes.borderRadiusLg * 2),
                                        borderSide: const BorderSide(width: 1.2),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),

                            SizedBox(height: BSizes.spaceBtwSections),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CornerTickButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StoreDetailScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
