import 'package:flutter/material.dart';
import 'package:todo_list/config/theme/colors.dart';

class ListTitleTextFieldWidget extends StatelessWidget {
  final Function(String)? onChanged;
  final String initialValue;

  const ListTitleTextFieldWidget(
      {super.key, this.onChanged, required this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: 'Título da lista',
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: TodoColors.neutral200),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: TodoColors.black),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
