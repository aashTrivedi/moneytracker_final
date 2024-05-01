  import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moneytracker/domain/resources/app_icons.dart';

class MainBottomNavigationAppBar extends StatelessWidget {
  const MainBottomNavigationAppBar({
    Key? key,
    required this.navigateTo, required this.currentIndex,
  }) : super(key: key);

  final ValueChanged navigateTo;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: navigateTo,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcons.pieChart),
          activeIcon: SvgPicture.asset(AppIcons.pieChartFilled),
          label: "stats",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcons.home),
          activeIcon: SvgPicture.asset(AppIcons.homeFilled),
          label: "home",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcons.settings),
          activeIcon: SvgPicture.asset(AppIcons.settingsFilled),
          label: "settings",
        ),
      ],
    );
  }
}