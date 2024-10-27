import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_assignment/utils/common_widgets.dart';

import '../../bloc/todo_bloc.dart';
import '../../bloc/todo_event.dart';
import '../../bloc/todo_state.dart';

class InputTaskWidget extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        _controller.value = TextEditingValue(text: state.taskTitle);

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Add a task',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    context.read<TodoBloc>().add(TaskInputChangedEvent(
                      title: value,
                      isCompleted: state.isTaskCompleted,
                    ));
                  },
                ),
              ),
              Checkbox(
                value: state.isTaskCompleted,
                onChanged: (value) {
                  context.read<TodoBloc>().add(TaskInputChangedEvent(
                    title: state.taskTitle,
                    isCompleted: value!,
                  ));
                },
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  _addTask(context, state);
                },
                child: Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _addTask(BuildContext context, TodoState state) {
    if (state.taskTitle.isNotEmpty) {
      context.read<TodoBloc>().add(AddTaskEvent(
        title: state.taskTitle,
        isCompleted: state.isTaskCompleted,
      ));
     showSnackBar("Task Added Successfully", context);
    }
    else {
      showSnackBar("Task field can not be empty", context);


      }
      }
}
