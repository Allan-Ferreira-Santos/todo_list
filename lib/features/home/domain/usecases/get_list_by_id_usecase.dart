import 'package:todo_list/core/utils/exceptions/exceptions.dart';
import 'package:todo_list/features/home/domain/entities/home_entity.dart';
import 'package:todo_list/features/home/domain/repositories/home_repository.dart';

class GetListByIdTaskUseCase {
  final HomeRepository homeRepository;

  GetListByIdTaskUseCase({required this.homeRepository});

  Future<List<HomeEntity>> call({required int id}) async {
    try {
      return await homeRepository.getListById(id: id);
    } on ServerError {
      rethrow;
    }
  }
}
