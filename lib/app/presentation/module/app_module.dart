import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/features/home/presentation/modules/home_module.dart';

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [ModuleRoute("/", module: HomeModule())];
}
