import 'package:todo_list/core/data/http_service.dart';
import 'package:todo_list/core/utils/exceptions/exceptions.dart';
import 'package:todo_list/features/register_task/infra/register_datasource.dart';
import 'package:todo_list/features/register_task/data/models/register_model.dart';

class RegisterDataSourceImpl implements RegisterDataSource {
  final DefaultHttpResponseService client;

  RegisterDataSourceImpl({required this.client});

  @override
  Future<String> registerTask({required String nameTask}) async {
    try {
      const url = "https://gc-api-todo.vercel.app/{Allan-Ferreira}/todos";
      final RegisterModel registerModel = RegisterModel(nameTask: nameTask);
      final Map<String, dynamic> json = registerModel.toJson();
      final statusCodeResponse = await client.post(url: url, body: json);
      final String statusCode = statusCodeResponse.statusCode.toString();
      return statusCode;
    } on ServerError {
      rethrow;
    }
  }

  @override
  Future<String> updateTask(
      {required String nameTask, required int id}) async {
    try {
      final url = "https://gc-api-todo.vercel.app/{Allan-Ferreira}/todos/$id";
      final RegisterModel registerModel = RegisterModel(nameTask: nameTask);
      final Map<String, dynamic> json = registerModel.toJson();
      final statusCodeResponse = await client.put(url: url, body: json);
      final String statusCode = statusCodeResponse.statusCode.toString();
      return statusCode;
    } on ServerError {
      rethrow;
    }
  }
}
