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
  void binds(i) {}

  @override
  void routes(r) {
    r.child("/",
        child: (context) => HomePage(
            homeController: HomeController(
                getListUseCase: GetListUseCase(
                    homeRepository: HomeRepositoryImpl(
                        dataSource: HomeDataSourceImpl(
                            client: DefaultHttpResponseService()))),
                getAllTasksCompletedUseCase: GetAllTasksCompletedUseCase(
                    homeRepository: HomeRepositoryImpl(
                        dataSource: HomeDataSourceImpl(
                            client: DefaultHttpResponseService()))),
                completeTaskUseCase: CompleteTaskUseCase(
                    homeRepository: HomeRepositoryImpl(
                        dataSource: HomeDataSourceImpl(
                            client: DefaultHttpResponseService()))),
                getListByIdTaskUseCase: GetListByIdTaskUseCase(
                    homeRepository: HomeRepositoryImpl(
                        dataSource: HomeDataSourceImpl(
                            client: DefaultHttpResponseService()))))));

    r.module("/register", module: RegisterModule());
  }
}
