abstract class TodoEvent {}

class AddTaskEvent extends TodoEvent {
  final String title;
  final bool isCompleted;

  AddTaskEvent({
    required this.title,
    required this.isCompleted,
  });
}

class ToggleTaskCompletionEvent extends TodoEvent {
  final int index;

  ToggleTaskCompletionEvent(this.index);
}

class TaskInputChangedEvent extends TodoEvent {
  final String title;
  final bool isCompleted;

  TaskInputChangedEvent({
    required this.title,
    required this.isCompleted,
  });
}

// New Event for toggling all tasks' completion status
class AllTasksToggleEvent extends TodoEvent {
  final bool markAsCompleted;

  AllTasksToggleEvent(this.markAsCompleted);
}
