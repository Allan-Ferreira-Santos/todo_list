import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/presentation/page/app.dart';
import 'package:todo_list/app/presentation/module/app_module.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: const App()));
}
