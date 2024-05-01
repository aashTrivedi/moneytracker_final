import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneytracker/routes/app_routes.dart';
import 'package:moneytracker/themes/app_theme_data.dart';
import 'package:moneytracker/ui/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/foundation.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(
  BlocProvider(
        create: (context) => UserBloc()..add(CallLatestUserEvent()),
        child: const moneytrackerApp(),
      ),
  );
}

class moneytrackerApp extends StatelessWidget {
  const moneytrackerApp({
    Key? key,
  }) : super(key: key);

  static final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.generateRoute,
      theme: AppThemeData.mainTheme,
    );
  }
}
