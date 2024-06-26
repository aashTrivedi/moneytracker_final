  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moneytracker/domain/resources/app_colors.dart';
import 'package:moneytracker/domain/resources/app_icons.dart';
import 'package:moneytracker/domain/resources/app_text_styles.dart';
import 'package:moneytracker/ui/bloc/entries_control_bloc/entries_control_bloc.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntriesControlBloc, EntriesControlState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border:
                Border.all(color: AppColors.borderGrey, width: 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppIcons.expenses,
                      color: AppColors.subTitle,
                    ),
                    Text(
                      '${state.balance.expenses}',
                      style: AppStyles.appRed,
                    ),
                     Text(
                      "expenses",
                      style: AppStyles.caption,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppIcons.wallet,
                      color: AppColors.subTitle,
                    ),
                    state.balance.balance < 0
                        ? Text(
                      '${state.balance.balance}',
                      style: AppStyles.appRed,
                    )
                        : Text(
                      '${state.balance.balance}',
                      style: AppStyles.appGreen,
                    ),
                    Text(
                      "balance",
                      style: AppStyles.caption,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppIcons.institute,
                      color: AppColors.subTitle,
                    ),
                    Text(
                      '${state.balance.income}',
                      style: AppStyles.buttonBlack,
                    ),
                     Text(
                      "income",
                      style: AppStyles.caption,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}