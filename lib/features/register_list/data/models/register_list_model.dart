import 'package:todo_list/features/register_list/domain/entities/register_list_entity.dart';

class RegisterListModel extends RegisterListEntity {
  RegisterListModel({required super.nameTask});

  factory RegisterListModel.fromJson(Map<String, dynamic> json) {
    return RegisterListModel(
      nameTask: json['nameTask'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'task': nameTask,
    };
  }
  
}
