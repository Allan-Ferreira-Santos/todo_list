import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/core/data/http_service.dart';
import 'package:todo_list/features/register_task/domain/usecases/update_task_usecase.dart';
import 'package:todo_list/features/register_task/domain/usecases/register_task_usecase.dart';
import 'package:todo_list/features/register_task/data/data_source/register_datasource_impl.dart';
import 'package:todo_list/features/register_task/data/repositories/register_repository_impl.dart';
import 'package:todo_list/features/register_task/presentation/controller/register_controller.dart';

void main() {
  late RegisterController controller;
  late RegisterTaskUseCase registerTaskUseCase;
  late UpdateTaskUseCase updateTaskUseCase;

  setUp(() {
    updateTaskUseCase = UpdateTaskUseCase(
        registerRepository: RegisterRepositoryImpl(
            registerDataSource:
                RegisterDataSourceImpl(client: DefaultHttpResponseService())));
    registerTaskUseCase = RegisterTaskUseCase(
        registerRepository: RegisterRepositoryImpl(
            registerDataSource:
                RegisterDataSourceImpl(client: DefaultHttpResponseService())));
    controller = RegisterController(
        registerTaskUseCase: registerTaskUseCase,
        updateTaskUseCase: updateTaskUseCase);
  });

  test('should call GetListUseCase when getAllList is called', () async {
    await controller.updateTask(nameTask: "Atualizou mesmo", id: 149);
  });
}
