import 'dart:convert';
import 'package:todo_list/core/data/http_service.dart';
import 'package:todo_list/core/utils/exceptions/exceptions.dart';
import 'package:todo_list/features/home/data/models/home_model.dart';
import 'package:todo_list/features/home/infra/datasource/home_datasource.dart';

class HomeDataSourceImpl implements HomeDataSource {
  final HttpService client;

  HomeDataSourceImpl({required this.client});

  @override
  Future<List<HomeModel>> getList() async {
    try {
      const url = "https://jsonplaceholder.typicode.com/todos";
      final response = await client.get(url: url);

      final List<dynamic> jsonData = jsonDecode(response.body);

      final List<HomeModel> homeModels =
          jsonData.map((json) => HomeModel.fromJson(json)).toList();

      return homeModels;
    } on ServerError {
      rethrow;
    }
  }

  @override
  Future<List<HomeModel>> getAllTasksCompleted() async {
    try {
      const url =
          "https://jsonplaceholder.typicode.com/posts/1/comments?postId=2";

      final response = await client.get(url: url);

      final List<dynamic> jsonData = jsonDecode(response.body);
      final List<HomeModel> homeModels =
          jsonData.map((json) => HomeModel.fromJson(json)).toList();

      return homeModels;
    } on ServerError {
      rethrow;
    }
  }
  
  @override
  Future<List<HomeModel>> getListById({required int id}) async{
    try {
      print("id $id");
      final url =
          "https://jsonplaceholder.typicode.com/comments?postId=$id";

      final response = await client.get(url: url);

      final List<dynamic> jsonData = jsonDecode(response.body);
      final List<HomeModel> homeModels =
          jsonData.map((json) => HomeModel.fromJson(json)).toList();

      return homeModels;
    } on ServerError {
      rethrow;
    }
  }
}
