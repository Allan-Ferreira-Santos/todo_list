class Failure implements Error {
  @override
  StackTrace? get stackTrace => throw UnimplementedError();
}
