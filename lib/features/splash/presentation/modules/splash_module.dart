import 'package:flutter_modular/flutter_modular.dart';


class SplashModule extends Module {
  @override
  void binds(i) {
    //controller
    // i.add<RegisterListController>((i) => RegisterListController(
    //     registerListUseCase: i.get<RegisterListUseCase>()));
    // //UseCase
    // i.add(((i) => RegisterListUseCase(
    //     registerListRepository: i.get<RegisterListRepository>())));
    // //Repository
    // i.add((i) => RegisterListRepositoryImpl(
    //     dataSource: i.get<RegisterListDataSource>()));
    // //DataSource
    // i.add((i) => RegisterListDataSourceImpl(client: i.get<HttpService>()));
    // i.add((i) => HttpServiceImpl());
  }

  @override
  void routes(r) {
    
  }
}
