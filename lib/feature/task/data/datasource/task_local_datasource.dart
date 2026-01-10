abstract class TaskLocalDatasource {
  Future<List<Map<String, dynamic>>> getAllTasksJson();
  Future<int> insertTask(Map<String, dynamic> json);
  Future<int> deleteTask(int id);
  Future<int> updateTask(Map<String, dynamic> jsonTask);
}
