import 'package:flutter/material.dart';
import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';

class IdentityVerificationScreen extends StatefulWidget {
  const IdentityVerificationScreen({super.key});

  @override
  State<IdentityVerificationScreen> createState() =>
      _IdentityVerificationScreenState();
}

class _IdentityVerificationScreenState
    extends State<IdentityVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.black1000,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // back button row
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: BAppColors.white),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 6),

              // avatar with ring + online dot + crown
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                      Border.all(color: BAppColors.black700, width: 3),
                    ),
                    child: CircleAvatar(
                      radius: 42,
                      backgroundImage: AssetImage(BImages.profile),
                      onBackgroundImageError: (_, __) {},
                    ),
                  ),
                  Positioned(
                    right: -2,
                    top: 6,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: BAppColors.main,
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(color: Colors.green, blurRadius: 8)
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 6,
                    bottom: -2,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: BAppColors.black1000,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(
                        BImages.crown,
                        width: 14,
                        height: 14,
                        errorBuilder: (_, __, ___) => Icon(
                            Icons.workspace_premium,
                            color: Colors.amber,
                            size: 14),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // name + premium text
              Text(
                "AVINASH KUMAR",
                textAlign: TextAlign.center,
                style: BAppStyles.poppins(
                  color: BAppColors.white,
                  fontSize: BSizes.fontSizeMd,
                  weight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.workspace_premium,
                      size: 16, color: Colors.amber),
                  const SizedBox(width: 6),
                  Text(
                    "PREMIUM ACCOUNT",
                    style: BAppStyles.poppins(
                      color: BAppColors.black300,
                      fontSize: BSizes.fontSizeSm,
                      weight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // ===== Tiles =====
              // Identity verification (red, chevron)
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: BAppColors.black900,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF6D4D),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      alignment: Alignment.center,
                      child: Icon(Icons.close,
                          color: BAppColors.white, size: 26),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Identity verification",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: BAppStyles.poppins(
                          color: BAppColors.white,
                          fontSize: BSizes.fontSizeMd,
                          weight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Icon(Icons.chevron_right,
                        color: BAppColors.white, size: 26),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Email (green, edit icon + subtitle)
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: BAppColors.black900,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: BAppColors.main,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      alignment: Alignment.center,
                      child: Icon(Icons.check,
                          color: BAppColors.white, size: 26),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "email",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: BAppStyles.poppins(
                              color: BAppColors.white,
                              fontSize: BSizes.fontSizeMd,
                              weight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "abdouplaystor@gmail.com",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: BAppStyles.poppins(
                              color: BAppColors.black300,
                              fontSize: BSizes.fontSizeSm,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.edit_outlined,
                        color: BAppColors.white, size: 20),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Phone (green, edit icon + subtitle)
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: BAppColors.black900,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: BAppColors.main,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      alignment: Alignment.center,
                      child: Icon(Icons.check,
                          color: BAppColors.white, size: 26),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Phone",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: BAppStyles.poppins(
                              color: BAppColors.white,
                              fontSize: BSizes.fontSizeMd,
                              weight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "05555555555",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: BAppStyles.poppins(
                              color: BAppColors.black300,
                              fontSize: BSizes.fontSizeSm,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.edit_outlined,
                        color: BAppColors.white, size: 20),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Facebook (blue card, power icon at end)
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFF3F51B5),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(
                        BImages.facebook,
                        width: 24,
                        height: 24,
                        color: BAppColors.white,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.facebook,
                            color: Colors.white, size: 24),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "facebook",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: BAppStyles.poppins(
                              color: BAppColors.white,
                              fontSize: BSizes.fontSizeMd,
                              weight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "Connecte",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: BAppStyles.poppins(
                              color: BAppColors.white.withOpacity(0.9),
                              fontSize: BSizes.fontSizeSm,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.16),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Icon(Icons.power_settings_new,
                          color: Colors.white, size: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
