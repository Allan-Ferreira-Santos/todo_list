abstract class RegisterDataSource {
  Future<String> registerTask({required String nameTask});

  Future<String> updateTask({required String nameTask, required int id});
}
