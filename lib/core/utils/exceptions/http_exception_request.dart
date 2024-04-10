class HttpExceptionRequest implements Exception {
  final String message;
  final String? url;
  final dynamic body;

  HttpExceptionRequest(this.message, {this.url, this.body});

  @override
  String toString() {
    return 'HttpException: $message${url != null ? ', url: $url' : ''}';
  }
}