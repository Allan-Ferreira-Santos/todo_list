import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/core/data/http_service.dart';
import 'package:todo_list/features/home/presentation/pages/home_page.dart';
import 'package:todo_list/features/home/domain/usecases/get_list_usecase.dart';
import 'package:todo_list/features/home/data/data_source/home_datasource_impl.dart';
import 'package:todo_list/features/home/domain/usecases/complete_task_usecase.dart';
import 'package:todo_list/features/home/data/repositories/home_repository_impl.dart';
import 'package:todo_list/features/home/domain/usecases/get_list_by_id_usecase.dart';
import 'package:todo_list/features/home/presentation/controller/home_controller.dart';
import 'package:todo_list/features/register_task/presentation/module/register_module.dart';
import 'package:todo_list/features/home/domain/usecases/get_all_task_completed_usecase.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => DefaultHttpResponseService()),
    Bind.factory((i) => HomeDataSourceImpl(client: i())),
    Bind.factory((i) => HomeRepositoryImpl(dataSource: i())),
    Bind.factory((i) => GetListUseCase(homeRepository: i())),
    Bind.factory((i) => GetAllTasksCompletedUseCase(homeRepository: i())),
    Bind.factory((i) => GetListByIdTaskUseCase(homeRepository: i())),
    Bind.factory((i) => CompleteTaskUseCase(homeRepository: i())),
    Bind.factory((i) => HomeController(
        getListUseCase: i(),
        getAllTasksCompletedUseCase: i(),
        getListByIdTaskUseCase: i(),
        completeTaskUseCase: i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/",
        child: (_, args) => HomePage(
              homeController: Modular.get(),
            )),
    ModuleRoute("/register", module: RegisterModule()),
  ];
}
