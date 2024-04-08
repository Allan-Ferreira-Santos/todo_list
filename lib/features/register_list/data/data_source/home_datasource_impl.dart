import 'package:todo_list/core/data/http_service.dart';
import 'package:todo_list/core/utils/exceptions/exceptions.dart';
import 'package:todo_list/features/register_list/data/models/register_list_model.dart';
import 'package:todo_list/features/register_list/infra/register_list_data_source.dart';
import 'package:todo_list/features/register_list/domain/entities/register_list_entity.dart';


class RegisterListDataSourceImpl implements RegisterListDataSource {
  final HttpService client;

  RegisterListDataSourceImpl({required this.client});

  @override
  Future<RegisterListEntity> registerList(
      {required RegisterListModel registerListModel}) async {
    try {
      final body = registerListModel.toJson();

      final result = await client.post(body: body);

      await getList();

      return result;
    } on ServerError {
      rethrow;
    }
  }

  Future<RegisterListEntity> getList() async {
    try {
      final result = await client.get();

      print("teste $result");

      final teste = RegisterListModel.fromJson(result);

      print(teste);

      return RegisterListEntity(nameTask: "nameTask");
    } on ServerError {
      rethrow;
    }
  }
}
