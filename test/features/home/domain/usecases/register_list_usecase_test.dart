import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/core/utils/exceptions/name_cannot_be_empty.dart';
import 'package:todo_list/features/register_list/domain/entities/register_list_entity.dart';
import 'package:todo_list/features/register_list/domain/entities/register_list_params_entity.dart';
import 'package:todo_list/features/register_list/domain/repositories/register_list_repository.dart';

class RegisterListUseCase {
  final RegisterListRepository registerListRepository;

  RegisterListUseCase({required this.registerListRepository});

  Future<void> call({required RegisterListParamsEntity params}) async {
    try {
      _validationName(name: params.nameTask);

      final RegisterListEntity registerListEntity = RegisterListEntity(
        nameTask: params.nameTask,
      );

      await registerListRepository.registerList(
          registerListEntity: registerListEntity);
    } on Exception {
      rethrow;
    }
  }

  void _validationName({required String name}) {
    if (name.isEmpty) {
      print("teste");
      throw NameCannotBeEmpty();
    }
  }
}
