import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_assignment/utils/common_widgets.dart';

import '../../bloc/todo_bloc.dart';
import '../../bloc/todo_event.dart';
import '../../bloc/todo_state.dart';

class TaskListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state.tasks.isEmpty) {
          return Center(child: Text('No tasks available'));
        }
        return ListView.builder(
          itemCount: state.tasks.length,
          itemBuilder: (context, index) {
            final task = state.tasks[index];
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                elevation: 5,
                color: task.isCompleted ? Colors.red : null,
                child: ListTile(
                  title: Text(
                    task.title,
                    style: TextStyle(
                      fontSize: 18,
                      color: task.isCompleted?Colors.white:Colors.black,
                      decoration:
                          task.isCompleted ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  trailing: Checkbox(
                    value: task.isCompleted,
                    onChanged: (_) {
                      context
                          .read<TodoBloc>()
                          .add(ToggleTaskCompletionEvent(index));
                      checkUncheck(task.isCompleted, context);
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void checkUncheck(bool isCompleted, BuildContext context) {
    if (isCompleted) {
      showSnackBar("Task status changed to Active", context);
    } else {
      showSnackBar("Task status changed to completed", context);
    }
  }
}
