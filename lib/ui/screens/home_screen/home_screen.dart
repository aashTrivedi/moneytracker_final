  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moneytracker/domain/resources/app_icons.dart';
import 'package:moneytracker/ui/bloc/entries_control_bloc/entries_control_bloc.dart';
import 'package:moneytracker/ui/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:moneytracker/ui/screens/add_entry_screen/add_entry_screen.dart';
import 'package:moneytracker/ui/widgets/entries_list.dart';
import 'package:moneytracker/ui/widgets/main_app_bar.dart';
import 'package:moneytracker/ui/widgets/month_picker/month_picker.dart';


import 'widgets/balance.dart';
import 'widgets/home_leading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = 'home page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  MainAppBar(leading: HomeLeading(),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: SvgPicture.asset(
          AppIcons.addPlus,
          color: Colors.white,
        ),
        label: Text("add new"),
        onPressed: () {
          context
              .read<NavigationBloc>()
              .add(NavigateTab(tabIndex: 3, route: AddEntryScreen.routeName));
        },
      ),
      body: BlocConsumer<EntriesControlBloc, EntriesControlState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0,),
            child: Column(
              children: const [
                  MonthPicker(
                    selectType: 'range',
                  ),
                SizedBox(
                  height: 20,
                ),
                BalanceWidget(),
                SizedBox(
                  height: 8,
                ),
                EntriesListBuilder()
              ],
            ),
          );
        },
      ),
    );
  }
}




