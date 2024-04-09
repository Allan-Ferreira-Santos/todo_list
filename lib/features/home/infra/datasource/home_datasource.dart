import 'package:todo_list/features/home/data/models/home_model.dart';

abstract class HomeDataSource {
  Future<List<HomeModel>> getList();
  
  Future<List<HomeModel>> getListById({required int id});

  Future<List<HomeModel>> getAllTasksCompleted();
}
