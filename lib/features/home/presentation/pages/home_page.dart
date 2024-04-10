import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_list/config/theme/colors.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/features/home/domain/entities/home_entity.dart';
import 'package:todo_list/features/home/presentation/widgets/card_widget.dart';
import 'package:todo_list/features/home/presentation/widgets/app_bar_widget.dart';
import 'package:todo_list/features/home/presentation/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  final HomeController homeController;

  const HomePage({super.key, required this.homeController});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.homeController.getAllList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final longestSide = MediaQuery.sizeOf(context).longestSide;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenWidth * 0.25),
          child: Observer(
            builder: (context) {
              return AppBarWidget(
                  itemsCompleted: () async {
                    await widget.homeController.setIsActivityItemsCompleted();
                  },
                  iconItemCompleted:
                      widget.homeController.isActivityItemsCompleted
                          ? const Icon(Icons.checklist_rounded,
                              color: TodoColors.green500, size: 30)
                          : const Icon(Icons.checklist_rounded,
                              color: TodoColors.white, size: 30),
                  canSeeTheIconPop: false,
                  title: "Seja Bem-Vindo ",
                  subtitle: "Adicione conteudo a sua lista");
            },
          )),
      body: RefreshIndicator(
        onRefresh: () => widget.homeController.getAllList(),
        child: SingleChildScrollView(
          child: Container(
            margin:
                EdgeInsets.only(right: 16, left: 16, top: longestSide * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(builder: (_) {
                  widget.homeController.isLoading;
                  return widget.homeController.isActivityItemsCompleted
                      ? listCompleted(context, widget.homeController)
                      : listTask(context, widget.homeController);
                })
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TodoColors.neutral100,
        onPressed: () {
          Modular.to.navigate('/register');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget listTask(BuildContext context, HomeController homeController) {
  final longestSide = MediaQuery.sizeOf(context).longestSide;
  final loading = homeController.isLoading;
  return Column(children: [
    Container(
      padding: EdgeInsetsDirectional.symmetric(vertical: longestSide * 0.01),
      child:
          const Text("suas listas", style: TextStyle(color: TodoColors.black)),
    ),
    loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: homeController.listItems.length,
            itemBuilder: (context, indexList) {
              final list = homeController.listItems[indexList];
              return CardWidget(
                iconCompleteTask: const Icon(Icons.check),
                iconEdit: const Icon(Icons.edit),
                editTask: () {
                  Modular.to.navigate("/register",
                      arguments: HomeEntity(
                          id: list.id, task: list.task, status: list.status));
                },
                completeTask: () async =>
                    await homeController.completTask(id: list.id),
                name: list.task,
                status: list.status,
              );
            })
  ]);
}

Widget listCompleted(BuildContext context, HomeController homeController) {
  final longestSide = MediaQuery.sizeOf(context).longestSide;
  final loading = homeController.isLoading;
  return Column(children: [
    Container(
      padding: EdgeInsetsDirectional.symmetric(vertical: longestSide * 0.01),
      child: const Text("suas lista completadas",
          style: TextStyle(color: TodoColors.black)),
    ),
    loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: homeController.listItemsCompleted.length,
            itemBuilder: (context, indexList) {
              final list = homeController.listItemsCompleted[indexList];
              return CardWidget(
                iconCompleteTask: const Icon(Icons.check, color: TodoColors.neutral100),
                iconEdit: const Icon(Icons.edit , color: TodoColors.neutral100,),
                name: list.task,
                status: list.status,
              );
            })
  ]);
}
