  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moneytracker/domain/models/user_model/user.dart';
import 'package:moneytracker/domain/resources/app_colors.dart';
import 'package:moneytracker/domain/resources/app_icons.dart';
import 'package:moneytracker/domain/resources/app_text_styles.dart';

import 'package:moneytracker/services/local_auth_service.dart';
import 'package:moneytracker/ui/bloc/user_bloc/user_bloc.dart';
import 'package:moneytracker/ui/screens/main_screen.dart';
import 'package:moneytracker/ui/screens/registration_screen/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state.userId.isEmpty && state.user.email.isNotEmpty) {
          emailController.text = state.user.email;
          _auth(state.user);
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: ()async{
            if(mounted){
              context.read<UserBloc>().add(InitialUserEvent());
            }
            return true;
          },
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        SvgPicture.asset(AppIcons.logo),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'moneytracker',
                          style: AppStyles.menuPageTitle,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Wrap(
                    children: [
                      const Icon(Icons.login, color: AppColors.title),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "signin",
                        style: const TextStyle(
                            color: AppColors.title,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "email",
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  if (state.status == AuthStatus.error) ...[
                    Text(
                      state.errorMessage,
                      style: AppStyles.appRed,
                    )
                  ],
                  if (state.status == AuthStatus.loading) ...[
                    const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.activeBlue,
                      ),
                    )
                  ] else ...[
                    TextButton(
                      onPressed: () {
                        context.read<UserBloc>().add(InitialUserEvent());
                        Navigator.of(context)
                            .pushNamed(RegistrationScreen.routeName);
                      },
                      child: Text("singup", style:
                      AppStyles.button),
                    ),
                    ElevatedButton(
                        style: AppStyles.buttonStyle,
                        onPressed: () {
                          context
                              .read<UserBloc>()
                              .add(SignInEvent(emailController.text));
                        },
                        child: Center(child: Text(
                          "signin")))
                  ]
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _auth(User user) async {
    if (user.biometrics) {
      final ifAuth = await LocalAuth.authenticate();
      if (ifAuth && mounted) {
        context.read<UserBloc>().add(SuccessfullySignedIn());
        Navigator.of(context, rootNavigator: true)
            .pushNamedAndRemoveUntil(MainScreen.routeName, (route) => false);
      }else{
        context.read<UserBloc>().add(InitialUserEvent());
      }
    } else {
      screenLock(
        title: Text("enter pin"),
          context: context,
          correctString: user.pin,
          onCancelled: (){
            context.read<UserBloc>().add(InitialUserEvent());
            Navigator.of(context).pop();
          },
          onUnlocked: () {
            Navigator.of(context).pop();
            context.read<UserBloc>().add(SuccessfullySignedIn());
            Navigator.of(context, rootNavigator: true)
                .pushNamedAndRemoveUntil(MainScreen.routeName, (route) =>
            false);
          });
    }
  }
}
