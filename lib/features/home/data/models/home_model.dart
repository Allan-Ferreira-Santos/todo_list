import 'package:todo_list/features/home/domain/entities/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({required super.nameTask, required super.name, required super.id});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      nameTask: json['title'] ?? "",
      name: json['name'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'task': nameTask,
    };
  }
}
