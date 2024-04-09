import 'package:todo_list/core/utils/exceptions/exceptions.dart';
import 'package:todo_list/features/home/domain/entities/home_entity.dart';
import 'package:todo_list/features/home/domain/repositories/home_repository.dart';

class GetListUseCase {
  final HomeRepository homeRepository;

  GetListUseCase({required this.homeRepository});

  Future<List<HomeEntity>> call() async {
    try {
      return await homeRepository.getList();
    } on ServerError {
      rethrow;
    }
  }
}
