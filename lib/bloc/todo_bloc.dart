import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/task.dart';
import '../repositories/task_repository.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TaskRepository taskRepository;

  TodoBloc(this.taskRepository)
      : super(TodoState(tasks: taskRepository.getTasks())) {
    on<AddTaskEvent>(_onAddTask);
    on<ToggleTaskCompletionEvent>(_onToggleTaskCompletion);
    on<TaskInputChangedEvent>(_onTaskInputChanged);
    on<AllTasksToggleEvent>(_onAllTasksToggle);
  }

  void _onAddTask(AddTaskEvent event, Emitter<TodoState> emit) {
    // Add the new task to the repository
    taskRepository
        .addTask(Task(title: event.title, isCompleted: event.isCompleted));

    // Create a new state with updated tasks and reset title and completion status
    emit(state
        .updateTasks(taskRepository.getTasks())
        .updateTaskTitle('')
        .updateTaskCompletionStatus(false));
  }

  void _onToggleTaskCompletion(
      ToggleTaskCompletionEvent event, Emitter<TodoState> emit) {
    taskRepository.toggleTaskCompletion(event.index);
    emit(state.updateTasks(taskRepository.getTasks()));
  }

  void _onTaskInputChanged(
      TaskInputChangedEvent event, Emitter<TodoState> emit) {
    // Update the task title and completion status based on input
    emit(state
        .updateTaskTitle(event.title)
        .updateTaskCompletionStatus(event.isCompleted));
  }
  void _onAllTasksToggle(AllTasksToggleEvent event, Emitter<TodoState> emit) {
    // Update each task's completion status based on the `markAsCompleted` value
    final updatedState = state.toggleAllTasksCompletion(event.markAsCompleted);
    emit(updatedState); // Emit the new state
  }
}
