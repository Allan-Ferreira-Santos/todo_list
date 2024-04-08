import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/core/data/http_service.dart';
import 'package:todo_list/core/utils/exceptions/exceptions.dart';
import 'package:todo_list/features/register_list/data/models/register_list_model.dart';
import 'package:todo_list/features/register_list/infra/register_list_data_source.dart';
import 'package:todo_list/features/register_list/domain/entities/register_list_entity.dart';



class RegisterListDataSourceImpl implements RegisterListDataSource {
  final HttpService client;

  RegisterListDataSourceImpl({required this.client});

  @override
  Future<RegisterListEntity> registerList({required RegisterListModel registerListModel}) async {
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

class MockHttpService extends Mock implements HttpService {}

void main() async {
  late MockHttpService mockHttpService;
  late RegisterListDataSource dataSource;
  late RegisterListModel registerListModel;

  setUp(() {
    mockHttpService = MockHttpService();
    dataSource = RegisterListDataSourceImpl(client: mockHttpService);
    registerListModel = RegisterListModel(nameTask: "teste");
  });

  test(
      'should return a list of empty strings on successful registration (200 response)',
      () async {
    // Mock successful response (200) with an empty body
    when(() => mockHttpService.post(body: registerListModel.toJson()))
        .thenAnswer((_) => Future.value({'statusCode': 200}));

    final result =
        await dataSource.registerList(registerListModel: registerListModel);

    expect(result, equals([""]));
    verify(() => mockHttpService.post(body: registerListModel.toJson()))
        .called(1);
  });

  test('should rethrow ServerError if an exception occurs during the request',
      () async {
    // Mock a ServerError exception
    when(() => mockHttpService.post(body: registerListModel.toJson()))
        .thenThrow(ServerError());

    expect(() => dataSource.registerList(registerListModel: registerListModel),
        throwsA(isA<ServerError>()));
    verify(() => mockHttpService.post(body: registerListModel.toJson()))
        .called(1);
  });
}
