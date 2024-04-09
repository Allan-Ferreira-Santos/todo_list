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
      return await dataSource.getList();
    } on ServerError {
      rethrow;
    }
  }
  
  @override
  Future<List<HomeEntity>> getAllTasksCompleted() async{
  try {
      return await dataSource.getAllTasksCompleted();
    } on ServerError {
      rethrow;
    }
  }
  
  @override
  Future<List<HomeEntity>> getListById({required int id}) async{
    try {
      return await dataSource.getListById(id: id);
    } on ServerError {
      rethrow;
    }
  }
}
