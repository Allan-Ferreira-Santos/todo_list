import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/core/data/http_service.dart';
import 'package:todo_list/features/home/domain/usecases/get_list_usecase.dart';
import 'package:todo_list/features/home/domain/usecases/complete_task_usecase.dart';
import 'package:todo_list/features/home/data/data_source/home_datasource_impl.dart';
import 'package:todo_list/features/home/domain/usecases/get_list_by_id_usecase.dart';
import 'package:todo_list/features/home/data/repositories/home_repository_impl.dart';
import 'package:todo_list/features/home/presentation/controller/home_controller.dart';
import 'package:todo_list/features/home/domain/usecases/get_all_task_completed_usecase.dart';

void main() {
  late HomeController controller;
  late GetListUseCase getListUseCase;
  late GetAllTasksCompletedUseCase getAllTasksCompleted;
  late GetListByIdTaskUseCase getListByIdTaskUseCase;
  late CompleteTaskUseCase completeTaskUseCase;

  setUp(() {
    completeTaskUseCase = CompleteTaskUseCase(
        homeRepository: HomeRepositoryImpl(
            dataSource:
                HomeDataSourceImpl(client: DefaultHttpResponseService())));
    getAllTasksCompleted = GetAllTasksCompletedUseCase(
        homeRepository: HomeRepositoryImpl(
            dataSource:
                HomeDataSourceImpl(client: DefaultHttpResponseService())));
    getListUseCase = GetListUseCase(
        homeRepository: HomeRepositoryImpl(
            dataSource:
                HomeDataSourceImpl(client: DefaultHttpResponseService())));

    getListByIdTaskUseCase = GetListByIdTaskUseCase(
        homeRepository: HomeRepositoryImpl(
            dataSource:
                HomeDataSourceImpl(client: DefaultHttpResponseService())));
    controller = HomeController(
        completeTaskUseCase: completeTaskUseCase,
        getListUseCase: getListUseCase,
        getAllTasksCompletedUseCase: getAllTasksCompleted,
        getListByIdTaskUseCase: getListByIdTaskUseCase);
  });

  test('should call GetListUseCase when getAllList is called', () async {
    await controller.getAllList();
  });
}
