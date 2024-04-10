import 'package:mobx/mobx.dart';
import 'package:todo_list/features/register_task/domain/usecases/update_task_usecase.dart';
import 'package:todo_list/features/register_task/domain/usecases/register_task_usecase.dart';

part 'register_controller.g.dart';

class RegisterController = RegisteController with _$RegisterController;

abstract class RegisteController with Store {
  final RegisterTaskUseCase registerTaskUseCase;
  final UpdateTaskUseCase updateTaskUseCase;

  @observable
  String nameTask = "";

  RegisteController(
      {required this.registerTaskUseCase, required this.updateTaskUseCase});

  Future<void> createTask({required String nameTask}) async {
    await registerTaskUseCase.call(nameTask: nameTask);
  }

  Future<void> updateTask({required String nameTask, required int id}) async {
     await updateTaskUseCase.call(nameTask: nameTask, id: id);
  }
}
