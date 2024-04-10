import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/core/data/http_service.dart';
import 'package:todo_list/features/home/domain/entities/home_entity.dart';
import 'package:todo_list/features/register_task/presentation/pages/register_page.dart';
import 'package:todo_list/features/register_task/domain/usecases/update_task_usecase.dart';
import 'package:todo_list/features/register_task/domain/usecases/register_task_usecase.dart';
import 'package:todo_list/features/register_task/data/data_source/register_datasource_impl.dart';
import 'package:todo_list/features/register_task/data/repositories/register_repository_impl.dart';
import 'package:todo_list/features/register_task/presentation/controller/register_controller.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => DefaultHttpResponseService()),
    Bind.factory((i) => RegisterDataSourceImpl(client: i())),
    Bind.factory((i) => RegisterRepositoryImpl(registerDataSource: i())),
    Bind.factory((i) => RegisterTaskUseCase(registerRepository: i())),
    Bind.factory((i) => UpdateTaskUseCase(registerRepository: i())),
    Bind.factory((i) =>
        RegisterController(updateTaskUseCase: i(), registerTaskUseCase: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/",
        child: (_, args) => RegisterPage(
            registerController: Modular.get(),
            homeEntity: args.data ?? HomeEntity(id: 0, task: "", status: ""))),
  ];
}
