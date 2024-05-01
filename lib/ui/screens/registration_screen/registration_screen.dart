  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moneytracker/domain/resources/app_colors.dart';
import 'package:moneytracker/domain/resources/app_icons.dart';
import 'package:moneytracker/domain/resources/app_text_styles.dart';
import 'package:moneytracker/services/local_auth_service.dart';
import 'package:moneytracker/ui/bloc/user_bloc/user_bloc.dart';
import 'package:moneytracker/ui/screens/main_screen.dart';

import 'widgets/avatar_pick.dart';
import 'widgets/biometrics_dialog.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);
  static const routeName = 'registration page';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) async {
        if (state.status == AuthStatus.done) {
          Navigator.of(context, rootNavigator: true)
              .pushNamedAndRemoveUntil(MainScreen.routeName, (route) => false);
        }
        if (state.status == AuthStatus.valid) {
          await buildScreenLockCreate(context);
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
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              reverse: true,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 36,
                    ),
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
                    const AvatarPick(),
                    const SizedBox(
                      height: 16,
                    ),
                    Wrap(
                      children: [
                        const Icon(Icons.app_registration_outlined,
                            color: AppColors.title),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                       "registration singup",
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
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText:"registration name",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: surnameController,
                            decoration: InputDecoration(
                              labelText: "surname",
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "email",
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (state.status == AuthStatus.error) ...[
                      Text(state.errorMessage, style: AppStyles.appRed),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                    if (state.status == AuthStatus.loading) ...[
                      const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.activeBlue,
                        ),
                      )
                    ] else ...[
                      ElevatedButton(
                        style: AppStyles.buttonStyle,
                        onPressed: () {
                          context.read<UserBloc>().add(ValidateUserEvent(
                              name: '${nameController.text} '
                                  '${surnameController.text}',
                              email: emailController.text));
                        },
                        child: Center(
                          child: Text("singup"),
                        ),
                      )
                    ]
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  buildScreenLockCreate(BuildContext context) async {
    screenLockCreate(
      title: Text("registration create pin"),
      confirmTitle: Text("registration confirm pin"),
      context: context,
      onConfirmed: (value) async {
        if (await LocalAuth.canAuthenticate()) {
          Navigator.of(context).pop();
          showDialog(
              context: context,
              builder: (context) {
                return BiometricsDialog(
                  name: '${nameController.text} ${surnameController.text}',
                  email: emailController.text,
                  pin: value,
                );
              });
        } else {
          Navigator.of(context).pop();
          context.read<UserBloc>().add(CreateUserEvent(
              name: '${nameController.text} ${surnameController.text}',
              pin: value,
              email: emailController.text,
              biometrics: false));
        }
      },
    );
  }
}
