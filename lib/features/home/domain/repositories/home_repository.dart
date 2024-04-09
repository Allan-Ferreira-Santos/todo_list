import 'package:todo_list/features/home/domain/entities/home_entity.dart';

abstract class HomeRepository {
  Future<List<HomeEntity>> getList();

  Future<List<HomeEntity>> getListById({required int id});

  Future<List<HomeEntity>> getAllTasksCompleted();
}
