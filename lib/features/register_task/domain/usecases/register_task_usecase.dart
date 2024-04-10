import 'package:todo_list/core/utils/exceptions/exceptions.dart';
import 'package:todo_list/features/register_task/domain/repositories/register_repository.dart';

class RegisterTaskUseCase {
  final RegisterRepository registerRepository;

  RegisterTaskUseCase({required this.registerRepository});

  Future<String> call({required String nameTask}) async {
    try {
      if (nameTask.isNotEmpty) {
        return await registerRepository.registerTask(nameTask: nameTask);
      }
      return "";
    } on ServerError {
      rethrow;
    }
  }
}
