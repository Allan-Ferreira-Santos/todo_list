import 'package:mobx/mobx.dart';
import 'package:todo_list/features/register_task/domain/usecases/update_task_usecase.dart';
import 'package:todo_list/features/register_task/domain/usecases/register_task_usecase.dart';

part 'register_controller.g.dart';

class RegisterController = RegisteController with _$RegisterController;

abstract class RegisteController with Store {
  final RegisterTaskUseCase registerTaskUseCase;
  final UpdateTaskUseCase updateTaskUseCase;

  RegisteController(
      {required this.registerTaskUseCase, required this.updateTaskUseCase});

  createTask({required String nameTask}) async {
    final result = await registerTaskUseCase.call(nameTask: nameTask);
    print(result);
  }

  updateTask({required String nameTask, required int id}) async {
    final result = await updateTaskUseCase.call(nameTask: nameTask, id: id);
    print("controolleee ${result}");
  }
}
