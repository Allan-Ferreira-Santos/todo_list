import 'package:todo_list/core/utils/exceptions/exceptions.dart';
import 'package:todo_list/features/home/domain/repositories/home_repository.dart';

class CompleteTaskUseCase {
  final HomeRepository homeRepository;

  CompleteTaskUseCase({required this.homeRepository});
  Future<String> call({required int id}) async {
    try {
      return await homeRepository.completTask(id: id);
    } on ServerError {
      rethrow;
    }
  }
}
