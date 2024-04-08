import 'package:todo_list/features/register_list/data/models/register_list_model.dart';
import 'package:todo_list/features/register_list/domain/entities/register_list_entity.dart';


abstract class RegisterListDataSource {
  Future<RegisterListEntity> registerList(
      {required RegisterListModel registerListModel});

  Future<RegisterListEntity> getList();
}
