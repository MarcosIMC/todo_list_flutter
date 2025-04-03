import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/models/categories.dart';
import 'package:todo_list/models/filters.dart';
import 'package:todo_list/models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];
  TaskFilter _filter = TaskFilter.ALL;

  List<Task> get tasks => _tasks;

  List<Task> get tasksFilteredBy {
    switch (_filter) {
      case TaskFilter.COMPLETED:
        return _tasks.where((tasks) => tasks.isCompleted).toList();
      case TaskFilter.PENDING:
        return _tasks.where((tasks) => !tasks.isCompleted).toList();
      default:
        return _tasks;
    }
  }

  TaskFilter get filter => _filter;

  void addTask(String title, Categories category) {
    final newTask = Task(id: DateTime.now().toString(), title: title, category: category, isCompleted: false);
    _tasks.add(newTask);
    notifyListeners();
  }

  void toggleTaskStatus(String id) {
    var taskIndex = _tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      _tasks[taskIndex].isCompleted = !_tasks[taskIndex].isCompleted;
      notifyListeners();
    }
  }

  void editTask(String id, String newTitle, Categories newCategory) {
    final taskToEditIndex = _tasks.indexWhere((task) => task.id == id);
    if (taskToEditIndex != -1) {
      _tasks[taskToEditIndex] = Task(
          id: id,
          title: newTitle,
          category: newCategory,
          isCompleted: _tasks[taskToEditIndex].isCompleted
      );
      notifyListeners();
    }
  }

  void deleteTask(Task task) {
    _tasks.removeWhere((task) => task.id == task.id);
    notifyListeners();
}

  void setFilter(TaskFilter filter) {
    _filter = filter;
    notifyListeners();
  }
}