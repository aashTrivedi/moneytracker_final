  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moneytracker/domain/resources/app_colors.dart';
import 'package:moneytracker/domain/resources/app_icons.dart';
import 'package:moneytracker/domain/resources/app_text_styles.dart';
import 'package:moneytracker/services/local_auth_service.dart';
import 'package:moneytracker/ui/bloc/user_bloc/user_bloc.dart';

class BiometricsDialog extends StatefulWidget {
  const BiometricsDialog({
    Key? key,
    required this.name,
    required this.email,
    required this.pin,
  }) : super(key: key);

  final String name;
  final String email;
  final String pin;

  @override
  State<BiometricsDialog> createState() => _BiometricsDialogState();
}

class _BiometricsDialogState extends State<BiometricsDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Center(
        child: Text(
          "use biometrics",
          style: AppStyles.menuPageTitle,
        ),
      ),
      contentPadding: const EdgeInsets.all(16),
      children: [
        Text(
          "choose biometrics",
          style: AppStyles.body2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.fingerprint_outlined,
              color: AppColors.subTitle,
              size: 48,
            ),
            SvgPicture.asset(
              AppIcons.faceId,
              color: AppColors.subTitle,
              height: 48,
              width: 48,
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        TextButton(
            onPressed: () async {
              final ifAuth = await LocalAuth.authenticate();
              if (ifAuth && mounted) {
                Navigator.of(context).pop();
                context.read<UserBloc>().add(CreateUserEvent(
                    name: widget.name,
                    pin: widget.pin,
                    email: widget.email,
                    biometrics: true));
              }
            },
            child: Text(
              "yes",
              style: AppStyles.button,
            )),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<UserBloc>().add(CreateUserEvent(
                  name: widget.name,
                  pin: widget.pin,
                  email: widget.email,
                  biometrics: false));
            },
            child: Text(
              "no",
              style: AppStyles.buttonBlack,
            ))
      ],
    );
  }
}