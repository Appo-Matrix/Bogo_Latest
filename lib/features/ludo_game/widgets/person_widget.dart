import 'package:bogo_latest/core/utils/common_widgets/app_buttons.dart';
import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:bogo_latest/core/utils/constants/app_sizes.dart';
import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';

class PersonItems {
  final String profileImage;
  final String title;
  final VoidCallback onFollow;
  final VoidCallback? onFriend;

  const PersonItems(
      {required this.profileImage,
      required this.title,
      required this.onFollow,
      this.onFriend});
}

class PersonList extends StatefulWidget {
  final bool showAddButton;
  final List<PersonItems> personList;

  const PersonList(
      {required this.personList, this.showAddButton = false, super.key});

  @override
  State<PersonList> createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      int page = _pageController.page?.round() ?? 0;
      if (currentIndex != page) {
        setState(() {
          currentIndex = page;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.showAddButton
        ? ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Container(
              height: 320,
              width: 124,
              decoration: BoxDecoration(
                color: BAppColors.darkGray500.withOpacity(.5),
              ),
              child: Stack(children: [
                PageView(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: widget.personList.map((personItems) {
                    return _PersonWidget(personItems: personItems);
                  }).toList(),
                ),
                Positioned(
                    right: 20,
                    bottom: 145,
                    child:
                        _dotIndicator(widget.personList.length, currentIndex))
              ]),
            ),
          )
        : SingleChildScrollView(
      scrollDirection: Axis.horizontal,
          child: Row(
              children: widget.personList.map((personItems) {
                return _PersonWidget2(personItems: personItems);
              }).toList(),
            ),
        );
  }
}

class _PersonWidget extends StatelessWidget {
  final PersonItems personItems;

  const _PersonWidget({required this.personItems});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(height: BSizes.size20),
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                image: DecorationImage(
                    image: AssetImage(personItems.profileImage))),
          ),
          SizedBox(height: BSizes.cardRadiusSm),
          Text(
            personItems.title,
            style: BAppStyles.button.copyWith(fontSize: 12),
          ),
          SizedBox(height: BSizes.cardRadiusSm),
          AppButtons.simple(
            onTap: personItems.onFollow,
            buttonText: "Follow",
            height: 32,
            width: 87,
            buttonColor: BAppColors.backGroundColor,
            fontSize: 13,
          ),
          SizedBox(
            height: BSizes.size35,
          ),
          SizedBox(
            height: BSizes.size20,
          ),
          AppButtons.square(
            imageIcon: "assets/icons/add_friend_outline.svg",
            buttonColor: BAppColors.darkGray400.withOpacity(.4),
            onTap: personItems.onFriend!,
            buttonText: "Friends",
          )
        ],
      ),
    );
  }
}

class _PersonWidget2 extends StatelessWidget {
  final PersonItems personItems;

  const _PersonWidget2({required this.personItems});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Center(
        child: Container(
          height: 154,
          width: 124,
          decoration: BoxDecoration(
              color: BAppColors.darkGray500.withOpacity(.5),
              borderRadius: BorderRadius.circular(35)),
          child: Column(
            children: [
              SizedBox(height: BSizes.cardRadiusSm),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    image: DecorationImage(
                        image: AssetImage(personItems.profileImage))),
              ),
              SizedBox(height: BSizes.cardRadiusSm),
              Text(
                personItems.title,
                style: BAppStyles.button.copyWith(fontSize: 12),
              ),
              SizedBox(height: BSizes.cardRadiusSm),
              AppButtons.simple(
                onTap: personItems.onFollow,
                buttonText: "Follow",
                height: 32,
                width: 87,
                buttonColor: BAppColors.backGroundColor,
                fontSize: 13,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _dotIndicator(int length, int currentIndex) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: List.generate(
      length,
      (index) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: currentIndex == index ? 4 : 20,
        height: 4,
        margin: const EdgeInsets.symmetric(horizontal: 1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: currentIndex == index
              ? BAppColors.backGroundColor
              : BAppColors.lightGray400.withOpacity(0.6),
        ),
      ),
    ),
  );
}
