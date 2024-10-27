
import '../models/task.dart';
import 'task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final List<Task> _tasks = [];

  @override
  List<Task> getTasks() => _tasks;

  @override
  void addTask(Task task) {
    _tasks.add(task);
  }

  @override
  void toggleTaskCompletion(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
  }
}
