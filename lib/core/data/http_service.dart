import 'package:http/http.dart' as http;

abstract class HttpService {
  Future<dynamic> get({required String url});
  Future<dynamic> post(
      {required Map<String, dynamic> body, required String url});
  Future<dynamic> put();
  dynamic delete();
}

class HttpServiceImpl implements HttpService {
  final client = http.Client();

  @override
  Future<dynamic> get({required String url}) async {
    final result = await client.get(Uri.parse(url));

    print(result);

    return result;
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
  Future post({required Map<String, dynamic> body, required String url}) async {
    final response = await client.post(Uri.parse(url), body: body);
    return response.body;
  }
}
