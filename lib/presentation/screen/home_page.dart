import 'package:flutter/material.dart';
import '../../bloc/todo_bloc.dart';
import '../../bloc/todo_event.dart';
import '../../bloc/todo_state.dart';
import '../widget/input_task_widget.dart';
import '../widget/task_list_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Column(
        children: [
          InputTaskWidget(),
          allSelectedCheckBox(),
          Expanded(child: TaskListWidget()),
        ],
      ),
    );
  }

  Widget allSelectedCheckBox() {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        bool areAllCompleted = false;

        // Check if all tasks are completed
        if (state.tasks.isNotEmpty) {
          areAllCompleted = state.tasks.every((task) => task.isCompleted);
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CheckboxListTile(
            title: Text('Mark All as Completed'),
            value: areAllCompleted,
            onChanged: (value) {
              // Emit an event to toggle all tasks' completion status
              context.read<TodoBloc>().add(AllTasksToggleEvent(value ?? false));
            },
          ),
        );
      },
    );
  }
}


