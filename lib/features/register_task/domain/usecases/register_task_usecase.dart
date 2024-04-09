import 'package:todo_list/features/register_task/domain/repositories/register_task_repository.dart';

class RegisterTaskUseCase {
  final RegisterTaskRepository registerTaskRepository;

  RegisterTaskUseCase({required this.registerTaskRepository});

  call({required String nameTask}) async {
    final result =
        await registerTaskRepository.registerTask(nameTask: nameTask);
  }
}
