import 'package:flutter/material.dart';
import 'package:todo_list/config/theme/colors.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool canSeeTheIconPop;
  final Icon? iconItemCompleted;
  final Function()? itemsCompleted;

  const AppBarWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.canSeeTheIconPop,
      this.iconItemCompleted,
      this.itemsCompleted});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: TodoColors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      leading: Padding(
        padding:
            EdgeInsets.only(left: screenWidth * 0.02, top: screenWidth * 0.03),
        child: InkWell(
            onTap: () => Modular.to.navigate('/'),
            child: canSeeTheIconPop
                ? const Icon(Icons.arrow_circle_left_outlined,
                    color: TodoColors.white)
                : const Icon(Icons.arrow_back, color: TodoColors.black)),
      ),
      actions: [
        InkWell(
          onTap: itemsCompleted,
          child: Container(
              padding: EdgeInsets.only(
                  right: screenWidth * 0.09, top: screenWidth * 0.03),
              child: iconItemCompleted),
        )
      ],
      title: SizedBox(
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: TodoColors.white),
            ),
            Container(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: TodoColors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
