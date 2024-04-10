import 'package:flutter/material.dart';
import 'package:todo_list/config/theme/colors.dart';

class RegisterButtom extends StatelessWidget {
  final Function()? onTap;
  final String nameButtom;

  const RegisterButtom({super.key, this.onTap, required this.nameButtom});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.sizeOf(context).longestSide * 0.04),
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).longestSide * 0.014),
        decoration: BoxDecoration(
            color: TodoColors.black,
            borderRadius: BorderRadius.all(Radius.circular(
                MediaQuery.sizeOf(context).longestSide * 0.01))),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( nameButtom, style: const TextStyle(color: TodoColors.white)),
            const Icon(Icons.chevron_right_rounded, color: TodoColors.white),
          ],
        ),
      ),
    );
  }
}
