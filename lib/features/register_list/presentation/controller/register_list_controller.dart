import 'package:todo_list/features/register_list/domain/usecase/register_list_usecase.dart';
import 'package:todo_list/features/register_list/domain/entities/register_list_params_entity.dart';

class RegisterListController {
  final RegisterListUseCase registerListUseCase;

  RegisterListController({required this.registerListUseCase});

  Future<void> registerList({required String nameTask}) async {
    try {
      RegisterListParamsEntity registerListParams =
          RegisterListParamsEntity(nameTask: nameTask);

      final result = await registerListUseCase.call(params: registerListParams);

      return result;
    } catch (e) {
      return;
    }
  }
}
