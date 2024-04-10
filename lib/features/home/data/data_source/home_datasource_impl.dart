import 'dart:convert';
import 'package:todo_list/core/data/http_service.dart';
import 'package:todo_list/core/utils/exceptions/exceptions.dart';
import 'package:todo_list/features/home/data/models/home_model.dart';
import 'package:todo_list/features/home/infra/datasource/home_datasource.dart';

class HomeDataSourceImpl implements HomeDataSource {
  final DefaultHttpResponseService client;

  HomeDataSourceImpl({required this.client});

  @override
  Future<List<HomeModel>> getList() async {
    try {
      const url = "https://gc-api-todo.vercel.app/{Allan-Ferreira}/todos";
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
      const url = "https://gc-api-todo.vercel.app/{Allan-Ferreira}/todos?status=complete";
      final response = await client.get(url: url);
      final List<dynamic> jsonData = jsonDecode(response.body);
      final List<HomeModel> homeModels = jsonData.map((json) => HomeModel.fromJson(json)).toList();
      return homeModels;
    } on ServerError {
      rethrow;
    }
  }

  @override
  Future<HomeModel> getListById({required int id}) async {
    try {
      final url = "https://gc-api-todo.vercel.app/{Allan-Ferreira}/todos/$id";
      final response = await client.get(url: url);
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final HomeModel homeModel = HomeModel.fromJson(jsonData);
      return homeModel;
    } on ServerError {
      rethrow;
    }
  }

  @override
  Future<String> completTask({required int id}) async {
    try {
      final url = "https://gc-api-todo.vercel.app/{Allan-Ferreira}/todos/$id/complete";
      final statusCodeResponse = await client.post(url: url);
      final statusCode = statusCodeResponse.statusCode.toString();
      return statusCode;
    } on ServerError {
      rethrow;
    }
  }
}
