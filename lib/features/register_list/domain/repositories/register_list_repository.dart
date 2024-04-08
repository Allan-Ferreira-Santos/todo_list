import 'package:todo_list/features/register_list/domain/entities/register_list_entity.dart';

abstract class RegisterListRepository {
  Future<void> registerList({required RegisterListEntity registerListEntity});
}
