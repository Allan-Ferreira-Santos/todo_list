import 'dart:ffi';
import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../domain/usecases/register_list_usecase_test.dart';
import 'package:todo_list/features/register_list/domain/entities/register_list_params_entity.dart';



class MockRegisterListUseCase extends Mock implements RegisterListUseCase {}

void main() async {
  RegisterListParamsEntity fakerDataRegister() =>
      RegisterListParamsEntity(nameTask: faker.lorem.random.string(5));

  late RegisterListUseCase registerListUseCase;
  late RegisterListParamsEntity registerListParamsEntity;

  setUp(() {
    registerListUseCase = MockRegisterListUseCase();
    registerListParamsEntity = fakerDataRegister();
    registerFallbackValue(registerListParamsEntity);
  });

  group("Create List controller", () {
    test('should create list successfully', () async {
      when(() => registerListUseCase.call(params: any(named: "params")))
          .thenAnswer((_) async => Void);

      await registerListUseCase.call(params: registerListParamsEntity);

      verify(() => registerListUseCase.call(params: registerListParamsEntity))
          .called(1);
    });
  });
}
