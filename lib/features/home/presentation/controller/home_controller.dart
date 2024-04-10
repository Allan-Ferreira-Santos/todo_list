import 'package:mobx/mobx.dart';
import 'package:todo_list/features/home/domain/entities/home_entity.dart';
import 'package:todo_list/features/home/domain/usecases/get_list_usecase.dart';
import 'package:todo_list/features/home/domain/usecases/complete_task_usecase.dart';
import 'package:todo_list/features/home/domain/usecases/get_list_by_id_usecase.dart';
import 'package:todo_list/features/home/domain/usecases/get_all_task_completed_usecase.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetListUseCase getListUseCase;
  final GetAllTasksCompletedUseCase getAllTasksCompletedUseCase;
  final GetListByIdTaskUseCase getListByIdTaskUseCase;
  final CompleteTaskUseCase completeTaskUseCase;

  @observable
  List<HomeEntity> listItems = [];

  @observable
  List<HomeEntity> listItemsCompleted = [];

  @observable
  bool isActivityItemsCompleted = false;

  @observable
  bool isLoading = false;

  _HomeControllerBase(
      {required this.getListUseCase,
      required this.getAllTasksCompletedUseCase,
      required this.getListByIdTaskUseCase,
      required this.completeTaskUseCase});

  @action
  Future<void> getAllList() async {
    isLoading = true;

    await getListUseCase.call().then((value) => {
          if (value.isNotEmpty) {listItems = value, isLoading = false}
        });
  }

  @action
  Future<void> getAllCompleted() async {
    isLoading = true;
    final result = await getAllTasksCompletedUseCase.call();
    listItemsCompleted = result;
    isLoading = false;
  }

  @action
  Future<void> getListById({required int id}) async {
    await getListByIdTaskUseCase.call(id: id);
  }

  @action
  Future<void> completTask({required int id}) async {
    isLoading = true;
    await completeTaskUseCase.call(id: id);
    await getAllList();
  }

  @action
  Future<void> setIsActivityItemsCompleted() async {
    isActivityItemsCompleted = !isActivityItemsCompleted;

    if (isActivityItemsCompleted) {
      await getAllCompleted();
    } else {
      await getAllList();
    }
  }
}
