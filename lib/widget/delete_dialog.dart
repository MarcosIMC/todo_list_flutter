import 'package:flutter/material.dart';
import 'package:todo_list/providers/task_provider.dart';
import 'package:todo_list/widget/snackbar_delete.dart';

import '../models/task.dart';

class DeleteDialog extends StatelessWidget {
  final TaskProvider provider;
  final Task task;
  DeleteDialog({super.key, required this.provider, required this.task});
  final snackBar = SnackBar(content: const Text('Tarea eliminada'));

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      title: const Text('Eliminar',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.red
      ),
      ),
      content: const Text('¿Está seguro de querer borrar la tarea?'),
      actions: [
        ElevatedButton(
            onPressed: () { Navigator.of(context).pop(); },
            child: const Text('Cancelar')
        ),
        ElevatedButton(
            onPressed: () {
              provider.deleteTask(task);
              Navigator.of(context).pop();
              SnackbarDelete.showSnackbar(context);
            },
            child: Text('Eliminar',
            style: TextStyle(color: Colors.red),
            )
        )

      ],
    );
  }
}
