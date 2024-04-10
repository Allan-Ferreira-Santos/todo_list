import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_list/core/utils/exceptions/http_exception_request.dart';

abstract class HttpResponseService {
  Future<http.Response> get({required String url});
  Future<http.Response> post({Map<String, dynamic>? body, required String url});
  Future<http.Response> put(
      {required Map<String, dynamic> body, required String url});
}

class DefaultHttpResponseService implements HttpResponseService {
  final http.Client client = http.Client();

  @override
  Future<http.Response> get({required String url}) async {
    try {
      final response = await client.get(Uri.parse(url));

      if (response.statusCode >= 400) {
        throw HttpExceptionRequest(
          'HTTP error ${response.statusCode}: ${response.body}',
          url: url,
        );
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<http.Response> put(
      {required Map<String, dynamic> body, required String url}) async {
    try {
      final response = await client.put(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode >= 400) {
        throw HttpExceptionRequest(
          'HTTP error ${response.statusCode}: ${response.body}',
          url: url,
          body: body,
        );
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<http.Response> post(
      {Map<String, dynamic>? body, required String url}) async {
    try {
      final response = await client.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode >= 400) {
        throw HttpExceptionRequest(
          'HTTP error ${response.statusCode}: ${response.body}',
          url: url,
          body: body,
        );
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }
}

