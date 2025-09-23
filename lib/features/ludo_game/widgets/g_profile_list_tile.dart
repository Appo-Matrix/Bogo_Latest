import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';

class GProfileItems {
  final String imagePath;
  final String titleText;
  final String subtitleText;
  final VoidCallback onTrailing;
  final VoidCallback onTile;

  GProfileItems(
      {required this.imagePath,
      required this.titleText,
      required this.subtitleText,
      required this.onTrailing,
      required this.onTile});
}

class GProfileList extends StatelessWidget {
  final List<GProfileItems> gProfileList;

  const GProfileList({super.key, required this.gProfileList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: gProfileList
            .map((gProfileItems) => _GProfileWidget(gProfileItems: gProfileItems))
            .toList(),
      ),
    );
  }
}

class _GProfileWidget extends StatelessWidget {
  final GProfileItems gProfileItems;

  const _GProfileWidget({super.key, required this.gProfileItems});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: gProfileItems.onTile,
        visualDensity: VisualDensity(vertical: 4),
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
        leading: SizedBox(
          height: 70,
          width: 70,
          child: Image.asset(gProfileItems.imagePath),
        ),
        title: Text(
          gProfileItems.titleText,
          style:
              BAppStyles.heading1.copyWith(color: BAppColors.white, fontSize: 15),
        ),
        subtitle: Text(
          gProfileItems.subtitleText,
          style: BAppStyles.body.copyWith(fontSize: 12, color: BAppColors.white),
        ),
        trailing: IconButton(
            onPressed: gProfileItems.onTrailing,
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: BAppColors.white,
            )),
      ),
    );
  }
}
