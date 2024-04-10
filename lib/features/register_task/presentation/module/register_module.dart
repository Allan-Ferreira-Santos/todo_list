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
  void binds(i) {}

  @override
  void routes(r) {
    r.child("/",
        child: (context) => RegisterPage(
            homeEntity: r.args.data ?? HomeEntity(id: 0, task: "", status: ""),
            registerController: RegisterController(
                registerTaskUseCase: RegisterTaskUseCase(
                    registerRepository: RegisterRepositoryImpl(
                        registerDataSource: RegisterDataSourceImpl(
                            client: DefaultHttpResponseService()))),
                updateTaskUseCase: UpdateTaskUseCase(
                    registerRepository: RegisterRepositoryImpl(
                        registerDataSource: RegisterDataSourceImpl(
                            client: DefaultHttpResponseService()))))));
  }
}
