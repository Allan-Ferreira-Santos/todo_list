import 'package:mobx/mobx.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_list/features/register_task/domain/usecases/register_task_usecase.dart';

part 'register_controller.g.dart';

class RegisterController = RegisteController with _$RegisterController;

abstract class RegisteController with Store {
  final RegisterTaskUseCase registerTaskUseCase;

  RegisteController({required this.registerTaskUseCase});

  createTask({required String nameTask}) async {
    final result = await registerTaskUseCase.call(nameTask: nameTask);
  }
}
