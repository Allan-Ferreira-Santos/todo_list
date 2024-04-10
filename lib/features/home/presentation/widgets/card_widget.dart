import 'package:flutter/material.dart';
import 'package:todo_list/config/theme/colors.dart';

class CardWidget extends StatelessWidget {
  final String name;
  final String status;
  final Icon? iconEdit;
  final Icon? iconCompleteTask;

  final Function()? editTask;
  final Function()? completeTask;

  const CardWidget(
      {super.key,
      required this.name,
      required this.status,
      this.iconEdit,
      this.iconCompleteTask,
      this.editTask,
      this.completeTask});

  @override
  Widget build(BuildContext context) {
    final longestSide = MediaQuery.sizeOf(context).longestSide;
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: const BoxDecoration(
          color: TodoColors.neutral100,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 80,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://services.meteored.com/img/article/inteligencia-artificial-aprende-a-reconstruir-imagens-vistas-por-pessoas-ciencia-fotos-1679175318563_1280.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: longestSide * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(color: TodoColors.neutral900)),
                  Text(status,
                      style: const TextStyle(color: TodoColors.neutral900)),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: longestSide * 0.02),
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: longestSide * 0.02),
                        child: InkWell(
                          onTap: editTask,
                          child: iconEdit,
                        )),
                    InkWell(onTap: completeTask, child: iconCompleteTask)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
