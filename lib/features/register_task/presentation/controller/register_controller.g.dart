// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on RegisteController, Store {
  late final _$nameTaskAtom =
      Atom(name: 'RegisteController.nameTask', context: context);

  @override
  String get nameTask {
    _$nameTaskAtom.reportRead();
    return super.nameTask;
  }

  @override
  set nameTask(String value) {
    _$nameTaskAtom.reportWrite(value, super.nameTask, () {
      super.nameTask = value;
    });
  }

  @override
  String toString() {
    return '''
nameTask: ${nameTask}
    ''';
  }
}
