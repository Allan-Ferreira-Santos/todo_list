import 'package:flutter/material.dart';
import 'package:todo_list/config/theme/colors.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/features/home/domain/entities/home_entity.dart';
import 'package:todo_list/features/home/presentation/widgets/app_bar_widget.dart';
import 'package:todo_list/features/register_task/presentation/widgets/register_buttom.dart';
import 'package:todo_list/features/register_task/presentation/controller/register_controller.dart';
import 'package:todo_list/features/register_task/presentation/widgets/list_title_text_field_widget.dart';

class RegisterPage extends StatefulWidget {
  final RegisterController registerController;
  final HomeEntity homeEntity;

  const RegisterPage(
      {super.key, required this.registerController, required this.homeEntity});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameTask = TextEditingController();

  @override
  void initState() {
    if (widget.homeEntity.task.isNotEmpty) {
      nameTask.text = widget.homeEntity.task;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenWidth * 0.25),
          child: const AppBarWidget(
            canSeeTheIconPop: true,
            title: "Crie sua Tarefa",
            subtitle: "preencha todos os campos",
          )),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text("Nome da Tarefa"),
              ),
              ListTitleTextFieldWidget(
                onChanged: (value) {
                  widget.registerController.nameTask = value;
                },
                initialValue: nameTask.text,
              ),
            ],
          )),
      bottomSheet: Container(
          color: TodoColors.white,
          child: RegisterButtom(
            nameButtom: widget.homeEntity.task.isEmpty
                ? "Criar Tarefa"
                : "Atualizar Tarefa",
            onTap: () {
              final nameTask = widget.registerController.nameTask;
              if (widget.homeEntity.task.isEmpty) {
                widget.registerController.createTask(nameTask: nameTask);
              }
              widget.registerController.updateTask(
                  nameTask: widget.registerController.nameTask,
                  id: widget.homeEntity.id);
              Modular.to.navigate('/');
            },
          )),
    );
  }
}
