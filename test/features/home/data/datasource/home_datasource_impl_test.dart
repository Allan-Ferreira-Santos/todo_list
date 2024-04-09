import 'package:mobx/mobx.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/core/data/http_service.dart';
import 'package:todo_list/core/utils/exceptions/exceptions.dart';
import 'package:todo_list/features/home/domain/entities/home_entity.dart';
import 'package:todo_list/features/home/data/data_source/home_datasource_impl.dart';

void main() {
  late HomeDataSourceImpl dataSource;
  late HttpService httpService;

  setUp(() {
    httpService = HttpServiceImpl();
    dataSource = HomeDataSourceImpl(client: httpService);
  });

  test('getList should throw ServerError when HTTP request fails', () async {
    final result = await dataSource.getList();

    expect(() => dataSource.getList(), throwsA(isInstanceOf<ServerError>()));
  });
}
