import 'package:todo_list/core/utils/exceptions/errors.dart';
import 'package:todo_list/features/register_list/data/models/register_list_model.dart';
import 'package:todo_list/features/register_list/domain/entities/register_list_entity.dart';
import 'package:todo_list/features/register_list/data/data_source/home_datasource_impl.dart';
import 'package:todo_list/features/register_list/domain/repositories/register_list_repository.dart';

class RegisterListRepositoryImpl implements RegisterListRepository {
  final RegisterListDataSourceImpl dataSource;

  RegisterListRepositoryImpl({required this.dataSource});

  @override
  Future<void> registerList(
      {required RegisterListEntity registerListEntity}) async {
    try {
      final registerListModel =
          RegisterListModel(nameTask: registerListEntity.nameTask);

      await dataSource.registerList(registerListModel: registerListModel);
    } on Failure {
      rethrow;
    }
  }
}