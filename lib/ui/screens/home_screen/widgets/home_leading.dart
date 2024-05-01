import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moneytracker/domain/resources/app_icons.dart';
import 'package:moneytracker/domain/resources/app_text_styles.dart';

class HomeLeading extends StatelessWidget {
  const HomeLeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppIcons.logo,
          height: 24,
          width: 24,
        ),
        const SizedBox(
          width: 8,
        ),
        const Text(
          'moneytracker',
          style: AppStyles.menuPageTitle,
        )
      ],
    );
  }
}