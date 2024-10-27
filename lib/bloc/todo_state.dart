import '../models/task.dart';

class TodoState {
  final List<Task> tasks;
  final String taskTitle;
  final bool isTaskCompleted;

  TodoState({
    required this.tasks,
    this.taskTitle = '',
    this.isTaskCompleted = false,
  });

  TodoState updateTasks(List<Task> newTasks) {
    return TodoState(
      tasks: newTasks,
      taskTitle: taskTitle,
      isTaskCompleted: isTaskCompleted,
    );
  }

  TodoState updateTaskTitle(String newTitle) {
    return TodoState(
      tasks: tasks,
      taskTitle: newTitle,
      isTaskCompleted: isTaskCompleted,
    );
  }

  TodoState updateTaskCompletionStatus(bool isCompleted) {
    return TodoState(
      tasks: tasks,
      taskTitle: taskTitle,
      isTaskCompleted: isCompleted,
    );
  }
  TodoState toggleAllTasksCompletion(bool markAsCompleted) {
    final updatedTasks = tasks.map((task) {
      return Task(
        title: task.title,
        isCompleted: markAsCompleted,
      );
    }).toList();

    return TodoState(
      tasks: updatedTasks,
      taskTitle: taskTitle,
      isTaskCompleted: markAsCompleted,
    );
  }
}
