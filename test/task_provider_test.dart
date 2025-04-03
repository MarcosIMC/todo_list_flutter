import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/models/categories.dart';
import 'package:todo_list/models/filters.dart';
import 'package:todo_list/providers/task_provider.dart';

void main() {
  late TaskProvider taskProvider;
  setUpAll(() => {
    taskProvider = TaskProvider()
  });
  group('Task provider should', () {
    test('The tasks have to be 0 when we not add any task yet', () {
      expect(taskProvider.tasks.length, equals(0));
    });

    test('Return 1 if whe add a new task', () {
      taskProvider.addTask('Check', Categories.OCIO);
      expect(taskProvider.tasks.length, equals(1));
    });
    
    test('Return the category of the first element', () {
      var task = taskProvider.tasks.first;
      expect(task.category, equals(Categories.OCIO));
    });

    test('Return the current state of the task', () {
      var task = taskProvider.tasks.first;
      expect(task.isCompleted, equals(isFalse));
    });

    test('Complete a task when call "toggleTaskStatus" method', () {
      taskProvider.toggleTaskStatus(taskProvider.tasks.first.id);
      var task = taskProvider.tasks.first;
      expect(task.isCompleted, equals(isTrue));
    });

    test('Edit a task title', () {
      var task = taskProvider.tasks.first;
      taskProvider.editTask(task.id, 'EditTask', Categories.DEPORTE);
      task = taskProvider.tasks.first;
      expect(task.title, equals('EditTask'));
      expect(task.category, equals(Categories.DEPORTE));
    });

    test('Change state of a task from "all" to "completed"', () {
      var task = taskProvider.tasks.first;
      task.isCompleted = true;
      taskProvider.setFilter(TaskFilter.COMPLETED);
      task = taskProvider.tasksFilteredBy.first;
      expect(task.title, equals('EditTask'));
      expect(task.isCompleted, equals(isTrue));
    });

    test('Delete a completed task', () {
      var task = taskProvider.tasks.first;
      taskProvider.deleteTask(task);
      expect(taskProvider.tasks.length, equals(0));
    });
  });
}