import 'package:todo_list/features/register_task/domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  RegisterModel({required super.nameTask});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(nameTask: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'task': nameTask};
  }
}
