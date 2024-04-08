import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/features/splash/presentation/pages/splash_page.dart';
import 'package:todo_list/features/splash/presentation/modules/splash_module.dart';

void main() {
  return runApp(ModularApp(module: SplashModule(), child: const SplashPage()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
