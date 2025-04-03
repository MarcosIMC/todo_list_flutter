import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/task_provider.dart';
import 'package:todo_list/widget/delete_dialog.dart';

import '../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    return Card(
      child: ListTile(
        title: Text(
            task.title,
            style: TextStyle(decoration: task.isCompleted ? TextDecoration.lineThrough : null),
        ),
        subtitle: Text(task.category.name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(value: task.isCompleted, onChanged: (value) {
              taskProvider.toggleTaskStatus(task.id);
            }),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                print('Antes del objeto Dialog');
                showDialog(context: context, builder: (BuildContext context) {
                  return DeleteDialog(provider: taskProvider, task: task);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
