import 'package:http/http.dart' as http;

abstract class HttpService {
  Future<dynamic> get();
  Future<dynamic> post({required Map<String ,dynamic> body});
  Future<dynamic> put();
  dynamic delete();
}

class HttpServiceImpl implements HttpService {
  final client = http.Client();
  final url = "https://jsonplaceholder.typicode.com/posts";

  @override
  Future<dynamic> get() async {
    final result = await client.get(Uri.parse(url));

    return result.body;
  }

  @override
  Future delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future put() {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future post({required Map<String, dynamic> body}) async {
    final response = await client.post(Uri.parse(url), body: body);
    print("ta aqui ${response.body}");
    print("ta aqui ${response.statusCode}");
    return response.body;
  }
}
