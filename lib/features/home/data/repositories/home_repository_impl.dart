import 'package:todo_list/core/utils/exceptions/exceptions.dart';
import 'package:todo_list/features/home/domain/entities/home_entity.dart';
import 'package:todo_list/features/home/infra/datasource/home_datasource.dart';
import 'package:todo_list/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl({required this.dataSource});

  @override
  Future<List<HomeEntity>> getList() async {
    try {
      final getAllTask = await dataSource.getList();
      final List<HomeEntity> listHomeEntity =
          getAllTask.map((e) => e.toEntity()).toList();
      return listHomeEntity;
    } on ServerError {
      rethrow;
    }
  }

  @override
  Future<List<HomeEntity>> getAllTasksCompleted() async {
    try {
      final getAllTaskComplete = await dataSource.getAllTasksCompleted();
      final List<HomeEntity> listHomeEntity = getAllTaskComplete.map((e) => e.toEntity()).toList();
      return listHomeEntity;
    } on ServerError {
      rethrow;
    }
  }

  @override
  Future<HomeEntity> getListById({required int id}) async {
    try {
      final getTaskById = await dataSource.getListById(id: id);
      final HomeEntity homeEntity = getTaskById.toEntity();
      return homeEntity;
    } on ServerError {
      rethrow;
    }
  }

  @override
  Future<String> completTask({required int id}) async {
    try {
      return await dataSource.completTask(id: id);
    } on ServerError {
      rethrow;
    }
  }
}
