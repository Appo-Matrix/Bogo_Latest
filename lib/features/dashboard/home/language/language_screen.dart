import 'package:bogo_latest/core/utils/common_widgets/custom_app_bar.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedLanguage = "English(US)";

  final List<String> languages = [
    "English(US)",
    "English(UK)",
    "Española",
    "Polski",
    "Português (Brazil)",
    "Rromani čhib (Romani)",
    "Русский (Russian)",
    "(Arabic) عربى",
    "മലയാളം (Malayalam)",
    "Urdu (اردو)",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        showBack: true,
        title: 'Language',
        titleColor: BAppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: BSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selected Language",
              style: BAppStyles.poppins(
                  fontSize: 14, color: BAppColors.white, weight: FontWeight.w600),
            ),
            const SizedBox(height: BSizes.spaceBtwItems),
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final lang = languages[index];
                  final isSelected = lang == _selectedLanguage;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedLanguage = lang;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? BAppColors.backGroundColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? BAppColors.backGroundColor : Colors.white30,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.language, color: Colors.white),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              lang,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ),
                          Icon(
                            isSelected
                                ? Icons.radio_button_checked_outlined
                                : Icons.radio_button_off,
                            color: isSelected ? Colors.white : Colors.white54,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
