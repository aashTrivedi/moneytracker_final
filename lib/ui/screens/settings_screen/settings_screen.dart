  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneytracker/ui/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:moneytracker/ui/bloc/user_bloc/user_bloc.dart';
import 'package:moneytracker/ui/screens/Fakeapi/Product.dart';
import 'package:moneytracker/ui/screens/login_screen/login_screen.dart';
import 'package:moneytracker/ui/screens/manage_categories_screen/manage_categories_screen.dart';
import 'package:moneytracker/ui/screens/statistics_screen/statistics_screen.dart';


import 'widgets/settings_option.dart';
import 'widgets/user_info.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const routeName = 'settings_page';

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state.status == AuthStatus.signedOut) {
          Navigator.of(context, rootNavigator: true)
              .pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const UserInfo(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SettingOption(
                        icon: Icons.category_outlined,
                        title: "manage cat",
                        action: () {
                          context.read<NavigationBloc>().add(NavigateTab(
                              tabIndex: 6,
                              route: ManageCategoriesScreen.routeName));
                        }),
                    SettingOption(
                        icon: Icons.picture_as_pdf_outlined,
                        title:"export",
                        action: () {
                          context.read<NavigationBloc>().add(NavigateTab(
                              tabIndex: 0, route: StatisticsScreen.routeName));
                        }),
                  SettingOption(
                      icon: Icons.abc,
                      title: "product",
                      action: () {
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Product(),
                      ),
                    );
                  
                      },
                      arrow: false,
                    ),
                    SettingOption(
                      icon: Icons.logout_outlined,
                      title: "logout",
                      action: () {
                        context.read<UserBloc>().add(SignOutEvent());
                      },
                      arrow: false,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


