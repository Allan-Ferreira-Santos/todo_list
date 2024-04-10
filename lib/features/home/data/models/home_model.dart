import 'package:todo_list/features/home/domain/entities/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({required super.id, required super.task, required super.status});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      task: json['task'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'task': task,
      'status': status,
    };
  }

  HomeEntity toEntity() {
    return HomeEntity(
      id: id,
      task: task,
      status: status,
    );
  }
}
