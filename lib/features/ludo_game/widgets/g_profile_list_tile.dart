import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';

class GProfileWidget extends StatelessWidget {
  final String imagePath;
  final String titleText;
  final String subtitleText;
  final VoidCallback onTrailing;
  final VoidCallback onTile;

  const GProfileWidget(
      {super.key,
      required this.imagePath,
      required this.titleText,
      required this.subtitleText,
      required this.onTrailing,
      required this.onTile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: onTile,
        visualDensity: VisualDensity(vertical: 4),
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
        leading: SizedBox(
          height: 70,
          width: 70,
          child: Image.asset(imagePath),
        ),
        title: Text(
          titleText,
          style: BAppStyles.heading1
              .copyWith(color: BAppColors.white, fontSize: 15),
        ),
        subtitle: Text(
          subtitleText,
          style:
              BAppStyles.body.copyWith(fontSize: 12, color: BAppColors.white),
        ),
        trailing: IconButton(
            onPressed: onTrailing,
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: BAppColors.white,
            )),
      ),
    );
  }
}
