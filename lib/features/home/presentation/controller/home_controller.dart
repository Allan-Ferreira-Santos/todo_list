import 'package:mobx/mobx.dart';
import 'package:todo_list/features/home/domain/entities/home_entity.dart';
import 'package:todo_list/features/home/domain/usecases/get_list_usecase.dart';
import 'package:todo_list/features/home/domain/usecases/complete_task_usecase.dart';
import 'package:todo_list/features/home/domain/usecases/get_list_by_id_usecase.dart';
import 'package:todo_list/features/home/domain/usecases/get_all_task_completed_usecase.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final GetListUseCase getListUseCase;
  final GetAllTasksCompletedUseCase getAllTasksCompletedUseCase;
  final GetListByIdTaskUseCase getListByIdTaskUseCase;
  final CompleteTaskUseCase completeTaskUseCase;

  _HomeController(
      {required this.getListUseCase,
      required this.getAllTasksCompletedUseCase,
      required this.completeTaskUseCase,
      required this.getListByIdTaskUseCase});

  Future<void> getAllList() async {
    final List<HomeEntity> list = [];
    final result = await getListUseCase.call();

    print(result);

//TODO: passar aqui para melhorar nomes
    for (var teste in result) {
      final aqui =
          HomeEntity(id: teste.id, task: teste.task, status: teste.status);
      list.add(aqui);

      print(list);
    }

  }

  getAllCompleted() async {
    //TODO: PASSAR AQUI PARA COLOCAR UM FOR
    final result = await getListUseCase.call();
    print(result);
  }

  getListById({required int id}) async {
    //TODO: PASSAR AQUI PARA COLOCAR UM FOR
    final result = await getListByIdTaskUseCase.call(id: id);
    print(result);
  }

  completTask({required int id}) async {
    final result = await completeTaskUseCase.call(id: id);
    print("result ");
    print(result);
  }
}
