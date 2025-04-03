import 'categories.dart';

class Task {
  final String id;
  final String title;
  final Categories category;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.category,
    required this.isCompleted
  });
}