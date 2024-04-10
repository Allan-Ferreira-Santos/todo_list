import 'package:todo_list/core/utils/exceptions/exceptions.dart';
import 'package:todo_list/features/register_task/infra/register_datasource.dart';
import 'package:todo_list/features/register_task/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDataSource registerDataSource;

  RegisterRepositoryImpl({required this.registerDataSource});

  @override
  Future<String> registerTask({required String nameTask}) async {
    try {
      return await registerDataSource.registerTask(nameTask: nameTask);
    } on ServerError {
      rethrow;
    }
  }

  @override
  Future<String> updateTask({required String nameTask, required int id}) async {
    try {
      return await registerDataSource.updateTask(nameTask: nameTask, id: id);
    } on ServerError {
      rethrow;
    }
  }
}
