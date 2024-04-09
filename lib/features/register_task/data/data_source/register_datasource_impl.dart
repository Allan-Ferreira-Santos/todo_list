import 'package:todo_list/core/data/http_service.dart';
import 'package:todo_list/features/register_task/infra/register_datasource.dart';

class RegisterDataSourceImpl implements RegisterDataSource {
  final HttpService httpService;

  RegisterDataSourceImpl({required this.httpService});

  @override
  Future<void> registerTask({required String nameTask}) async {
    final result = await httpService.post(
        body: {'name': nameTask}, url: 'https://jsonplaceholder.typicode.com/todos');
    print(result);
  }
}
