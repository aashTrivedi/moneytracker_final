  import 'package:flutter/material.dart';

class CategoryDropDown extends StatelessWidget {
  const CategoryDropDown(
      {Key? key,
        required this.onTap,
        required this.onChanged})
      : super(key: key);
  final VoidCallback onTap;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        onTap: onTap,
        onChanged: onChanged,
        borderRadius: BorderRadius.circular(8),
        icon: const Icon(Icons.keyboard_arrow_down),
        hint: Text( "select" ),
        isDense: true,
        items: [
          DropdownMenuItem(
              value: 'income', child: Text(" income" )),
          DropdownMenuItem(
              value: 'expense', child: Text( "expenses "))
        ]);
  }
}
