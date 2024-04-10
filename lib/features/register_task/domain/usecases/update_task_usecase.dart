import 'package:todo_list/core/utils/exceptions/exceptions.dart';
import 'package:todo_list/features/register_task/domain/repositories/register_repository.dart';

class UpdateTaskUseCase {
  final RegisterRepository registerRepository;
  UpdateTaskUseCase({required this.registerRepository});

  Future<String> call({required String nameTask, required int id}) async {
    try {
      return await registerRepository.updateTask(nameTask: nameTask, id: id);
    } on ServerError {
      rethrow;
    }
  }
}
