import 'package:todo_list/features/register_task/infra/register_datasource.dart';
import 'package:todo_list/features/register_task/domain/repositories/register_task_repository.dart';

class RegisterTaskRepositoryImpl implements RegisterTaskRepository {
  final RegisterDataSource registerDataSource;

  RegisterTaskRepositoryImpl({required this.registerDataSource});

  @override
  Future<void> registerTask({required String nameTask}) {
    final result = registerDataSource.registerTask(nameTask: nameTask);
    return result;
  }
}
