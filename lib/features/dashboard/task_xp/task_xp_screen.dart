import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:bogo_latest/features/dashboard/task_xp/widgets/task_app_bar.dart';
import 'package:bogo_latest/features/dashboard/task_xp/widgets/reward_card.dart';
import 'package:bogo_latest/features/dashboard/task_xp/widgets/task_reward_card.dart';
import 'package:bogo_latest/features/dashboard/task_xp/widgets/task_xp_benner.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const TaskAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: BSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            XPBanner(pageController: _pageController),
            const SizedBox(height: 16),
            const RewardCard(),
            const SizedBox(height: 20),
            Text(
              "XP Earning Tasks",
              style: BAppStyles.poppins(
                color: BAppColors.white,
                fontSize: 14,
                weight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),

            /// Example Task List
            Column(
              children: const [
                TaskRewardCard(
                  xp: 100,
                  title: "Invite 10 friends and win 100 XP",
                  progress: 5,
                  total: 10,
                  image: "assets/images/friends.png",
                ),
                TaskRewardCard(
                  xp: 100,
                  title: "Play 5 games in a row and win 100 XP",
                  progress: 4,
                  total: 5,
                  image: "assets/images/friends.png",
                ),
                TaskRewardCard(
                  xp: 50,
                  title: "Complete your profile and win 50 XP",
                  progress: 0,
                  total: 1,
                  image: "assets/images/friends.png",
                ),
                TaskRewardCard(
                  xp: 50,
                  title: "Complete your profile and win 50 XP",
                  progress: 0,
                  total: 1,
                  image: "assets/images/friends.png",
                ),
                TaskRewardCard(
                  xp: 50,
                  title: "Complete your profile and win 50 XP",
                  progress: 0,
                  total: 1,
                  image: "assets/images/friends.png",
                ),
                TaskRewardCard(
                  xp: 50,
                  title: "Complete your profile and win 50 XP",
                  progress: 0,
                  total: 1,
                  image: "assets/images/friends.png",
                ),
                TaskRewardCard(
                  xp: 50,
                  title: "Complete your profile and win 50 XP",
                  progress: 0,
                  total: 1,
                  image: "assets/images/friends.png",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
