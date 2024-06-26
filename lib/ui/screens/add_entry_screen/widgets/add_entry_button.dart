  import 'package:flutter/material.dart';
import 'package:moneytracker/domain/resources/app_text_styles.dart';

class AddEntryButton extends StatelessWidget {
  const AddEntryButton({
    Key? key,
    required this.option,
    required this.isActive,
    required this.action,
  }) : super(key: key);

  final String option;
  final bool isActive;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppStyles.buttonStyle,
      onPressed: isActive ? action : null,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 32,
        child: Center(
          child: option == 'income'
              ? Text("add income")
              : option == 'expense'
                  ? Text( "add expense ")
                  : Text( "add" ),
        ),
      ),
    );
  }
}
