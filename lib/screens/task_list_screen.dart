import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/filters.dart';
import 'package:todo_list/providers/task_provider.dart';
import 'package:todo_list/screens/task_form_screen.dart';
import 'package:todo_list/widget/task_item.dart';

import '../widget/elevation_button_filter.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de tareas'),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10),
          child: Row(
            children: [
              FilterButton(
                label: 'Todas',
                isSelected: taskProvider.filter == TaskFilter.ALL,
                onPressed: () {
                  taskProvider.setFilter(TaskFilter.ALL);
                },
              ),
              SizedBox(width: 5,),
              FilterButton(
                label: 'Completadas',
                isSelected: taskProvider.filter == TaskFilter.COMPLETED,
                onPressed: () {
                  taskProvider.setFilter(TaskFilter.COMPLETED);
                },
              ),
              SizedBox(width: 5,),
              FilterButton(
                label: 'Pendientes',
                isSelected: taskProvider.filter == TaskFilter.PENDING,
                onPressed: () {
                  taskProvider.setFilter(TaskFilter.PENDING);
                },
              ),
            ],
          ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: taskProvider.tasksFilteredBy.length,
                itemBuilder: (context, index) {
                  final task = taskProvider.tasksFilteredBy[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TaskFormScreen(task: task,)));
                    },
                    child: TaskItem(task: task),
                  );
                }
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TaskFormScreen()));
        },
        child: const Icon(Icons.add, color: Colors.white,)
      ),
    );
  }
}
