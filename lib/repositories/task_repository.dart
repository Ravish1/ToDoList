
import '../models/task.dart';

abstract class TaskRepository {
  List<Task> getTasks();
  void addTask(Task task);
  void toggleTaskCompletion(int index);
}
